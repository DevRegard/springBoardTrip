package co.kr.springBoardTrip;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.beans.factory.annotation.Autowired; //자동 Setter
import org.apache.ibatis.session.SqlSession; // MyBatis
import org.springframework.ui.Model;

import model.notice.NoticeDto; //공지사항 DB

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;

@Controller
public class NoticeController {
	
	@Autowired
	private SqlSession sqlSession; // MyBatis
	
	
	//글 쓰기
	@RequestMapping("/noticeWriteForm.do")
	public String noticePlusForm(Model model, String n_num){
		
		n_num = "0";
		
		model.addAttribute("n_num", new Integer(n_num)); 
		
		/* 
		 * Integer()는 null값 처리 가능, 산술연산불가 ===> SQL 작업 적합
		 * 
		 * 자료형 INT는 null값처리 불가능, 산술연산만 가능하므로 아래와 같은 코드는 부적절
		 * model.addAttribute("n_num", n_num);
		*/
		
		return ".main.notice.noticeWriteForm"; //views/notice/noticeWriteForm.jsp
	}
	
	
	
	
	//DB에 글쓰기
	public static int maxNum = 0;
	
	@RequestMapping(value = "noticeWritePro.do", method = RequestMethod.POST)
	public String noticePlusProc(@ModelAttribute("noticeDto") NoticeDto noticeDto,
			HttpServletRequest request) throws IOException, NamingException{
		
		//최대 글번호
		if(sqlSession.selectOne("notice.noticeMaxNum") != null) {
			maxNum = sqlSession.selectOne("notice.noticeMaxNum");
		}
		
		//아이피 구하기
		String ip = request.getRemoteAddr();
		noticeDto.setIp(ip); 
		
		//insert
		sqlSession.insert("notice.writeNotice", noticeDto);
		
		return "redirect:noticeList.do";
	}
	
	
	
	
	
	//리스트
	@RequestMapping("noticeList.do")
	public String noticeView(Model model, String pageNum)
		throws IOException, NamingException{
		
		if(pageNum == null) {pageNum = "1";} //첫번째 글 작성에 대한 에러방지
		/*
		 * <리스트 버튼 및 표시 기능 구현>
		 * 가독성 향상을 위해 변수 구조 및 주석 변경
		 */
		int pageSize, //페이지 크기
			currentPage, //현재 페이지
			count, //총 글 수 
			number, //글 번호 역순으로 표시
			pageBlock, //블럭당 n개 페이지 묶기
			pageCount, //총 페이지 수
			startRow, endRow, //페이지 블럭 당 글의 시작과 끝 번호 [이동 버튼]
			startPage, endPage; //시작과 끝 페이지 [이동 버튼]
		
		pageSize = 10;
		currentPage = Integer.parseInt(pageNum);
		
		startRow = (currentPage - 1) * pageSize + 1; 
		// 시작 줄번호 = (현재페이지 - 1) * 페이지크기 + 1
		endRow = currentPage * pageSize; 			 
		// 끝 줄번호 = 현재페이지 * 페이지크기
		
		pageBlock = 10; //블럭당 10개 패이지로 묶기
		count = sqlSession.selectOne("notice.selectCount");
		number = count - (currentPage - 1) * pageSize; 
		//글번호[역순] = 총글수 - (현재페이지 - 1) * 페이지크기
		
		HashMap <String, Integer> map = new HashMap <String, Integer>();
		map.put("start", startRow - 1); //시작 위치, (MySql은 0부터 시작하므로 -1)
		map.put("cnt", pageSize); //글 갯수
		
		pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1); 
		//총 페이지 수 = 총글수 / 페이지크기 + (총글수 % 페이지크기 == 0 ? 0 : 1)
		
		startPage = (currentPage / 10) * 10 + 1; // 시작페이지 = (현재페이지 / 10) * 10 + 1
		endPage = startPage + pageBlock - 1;	 // 마지막페이지 = 시작페이지 + 블럭당페이지수 - 1
		
		
		List <NoticeDto> list = sqlSession.selectList("notice.viewNotice", map);
		
		// addAttribute ("key", value) : JSP에서 ${}을 통해 출력할 데이터 저장
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("currentPage",currentPage);
		
		model.addAttribute("startRow",startRow);
		model.addAttribute("endRow",endRow);
		
		model.addAttribute("count",count);
		model.addAttribute("pageBlock",pageBlock);
		
		model.addAttribute("number",number);
		model.addAttribute("pageCount",pageCount);
		
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		
		model.addAttribute("list",list);
		
		/* <추후 추가 - 글 존재 유무에 따른 페이지 출력>
		 * 
		 * if(count > 0){//글이 존재하면 noticeList = dao.noticeGetList(startRow, pageSize);
		 * 
		 * //dao메서드 호출하고 결과 받는다 }else{//글이 없으면 noticeList = Collections.EMPTY_LIST;
		 * //비어있다는 뜻 request.setAttribute("noticeList", noticeList);
		 */
		
		return ".main.notice.noticeList"; //뷰 리턴
	}
	
	
	
	
	
	//글 내용 보기 + 조회수 증가
	@RequestMapping("noticeContent.do")
	public String noticeText(Model model, String n_num, String pageNum)
	throws IOException, NamingException{
		
		int numCount = Integer.parseInt(n_num); //String을 integer형으로 변환 중요
		sqlSession.update("notice.noticeReadCount", numCount);
		
		NoticeDto noticeDto = sqlSession.selectOne("notice.contentView", numCount); //조회수
		
		String n_content = noticeDto.getN_content();
		n_content = n_content.replace("\n", "<br>");
		
		model.addAttribute("n_content", n_content);
		model.addAttribute("n_num", numCount); //*** String n_num -> INT numCount(조회수)
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("noticeDto", noticeDto);
		
		return ".main.notice.noticeContent";
	}
	
	
	
	
	
	//글 수정
	@RequestMapping("noticeUpdateForm.do")
	public ModelAndView updateForm(String n_num, String pageNum)
	throws IOException, NamingException{
		
		int num1 = Integer.parseInt(n_num);
		NoticeDto noticeDto = sqlSession.selectOne("notice.contentView",num1); //글내용보기
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("pageNum", pageNum);
		mv.addObject("noticeDto", noticeDto);
		mv.setViewName(".main.notice.noticeUpdateForm");
		
		return mv;
	}
	
	
	
	
	
//____________________________________________________________________________________
	//DB에서 글 수정 <초기 MVC기법>
	//JSP 별도로 만들고 사용하는 로직 - 수정,삭제
	
//	@RequestMapping(value = "noticeUpdatePro.do", method = RequestMethod.POST)
//	public ModelAndView updatePro(NoticeDto noticeDto, String pageNum)
//	throws IOException, NamingException{
//		sqlSession.update("notice.updateNoticeProc", noticeDto);
//		
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("pageNum", pageNum);
//		mv.setViewName("redirect:noticeList.do");
//		
//		return mv;
//		
//	}
//____________________________________________________________________________________
	
	
	
	
	//DB에서 글수정
	@RequestMapping(value = "noticeUpdatePro.do", method = RequestMethod.POST)
	public String noticeUpdatePro(String n_num, String u_pass, Model model, NoticeDto noticeDto, String pageNum)
	throws IOException, NamingException{
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("n_num", n_num);
		map.put("u_pass", u_pass);
		
		NoticeDto noticeDto2 = sqlSession.selectOne("notice.checkGetPw", map); //글번호와 암호체크 
		
		//경우의 수에 따라 메세지 출력 및 뷰 이동
		if(noticeDto2 == null) {
			model.addAttribute("msg", "수정 실패 : 암호가 일치하지 않습니다. \n 암호를 정확히 입력해주세요.");
			return ".main.notice.noticeUpdateForm";
			
		} else {
			sqlSession.update("notice.noticeUpdatePro", noticeDto); //글 수정 
			model.addAttribute("msg2","정상적으로 글 수정 완료했습니다. \n 리스트로 돌아갑니다.");
		}//if else end
		
		model.addAttribute("noticeDto",noticeDto);
		model.addAttribute("pageNum",pageNum);
		
		return "redirect:noticeList.do";
	}
	
	
	
	
	
	//글 삭제
	@RequestMapping("noticeDeleteForm.do")
	public ModelAndView noticeDelete(String n_num, String pageNum)
	throws IOException, NamingException{
		
		int num1 = Integer.parseInt(n_num);
		NoticeDto noticeDto = sqlSession.selectOne("contentView", num1); //글내용보기
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("pageNum", pageNum);
		mv.addObject("noticeDto",noticeDto);
		mv.setViewName(".main.notice.noticeDeleteForm"); //뷰 이름 등록
		
		return mv;
	}
	
	
	
	
	
	//DB에서 글 삭제
	@RequestMapping(value = "noticeDeletePro.do", method = RequestMethod.POST)
	public String noticeDeletePro(String n_num, String u_pass, Model model, NoticeDto noticeDto, String pageNum)
	throws IOException, NamingException{
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("n_num", n_num);
		map.put("u_pass", u_pass);
		
		NoticeDto noticeDto3 = sqlSession.selectOne("notice.checkGetPw",map);
		
		if(noticeDto3 == null) { //일치하지 않으면 다시 삭제폼으로
			model.addAttribute("msg", "삭제 실패 :암호가 서로 일치하지 않습니다.");
			return ".main.notice.noticeDeleteForm";
		}else { //일치하면 삭제
			sqlSession.delete("notice.noticeDelete", noticeDto3); //******* XML이름 유의 (에러찾기 힘들었음)
		}
		
		model.addAttribute("noticeDto", noticeDto);
		model.addAttribute("pageNum", pageNum);
		
		return "redirect:noticeList.do";
	}

}//class end