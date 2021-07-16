package co.kr.springBoardTrip;

import org.springframework.stereotype.Controller; //컨트롤러
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.beans.factory.annotation.Autowired; //자동 Setter 작업
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
	
	
	//공지사항 등록 (글 쓰기) ->  noticeWriteForm.jsp
	@RequestMapping("/noticeWriteForm.do")
	public String noticePlusForm(Model model, String n_num){
		
		n_num = "0";
		
		//View에서 사용할 속성
		model.addAttribute("n_num", new Integer(n_num)); //Integer()는 null값 처리 가능, 산술연산불가 ===> SQL 작업 적합
//		model.addAttribute("n_num", n_num); //INT는 null값처리 불가능, 산술연산만 가능
		
		return ".main.notice.noticeWriteForm"; //views/notice/noticeWriteForm.jsp
	}
	
	
	
	
	
	//DB에 글쓰기 ->  noticeWritePro.jsp
	@RequestMapping(value = "noticeWritePro.do", method = RequestMethod.POST)
	public String noticePlusProc(@ModelAttribute("noticeDto") NoticeDto noticeDto,
			HttpServletRequest request) throws IOException, NamingException{
		
		//최대 글번호
		int maxNum = 0;
		maxNum = sqlSession.selectOne("notice.noticeMaxNum");
		
		//아이피 구하기
		String ip = request.getRemoteAddr();
		noticeDto.setIp(ip); 
		
		//insert
		sqlSession.insert("notice.writeNotice", noticeDto);
		
		return "redirect:noticeList.do";
	}
	
	
	
	
	
	//리스트  ->  noticeList.jsp
	@RequestMapping("noticeList.do")
	public String noticeView(Model model, String pageNum)
		throws IOException, NamingException{
		
		if(pageNum == null) {pageNum = "1";}
		
		int pageSize = 10;
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1; //1페이지는 1부터, 2페이지는 11부터, 3페이지는 21부터
		int endRow = currentPage * pageSize; //1페이지는 10까지, 2페이지는 20까지, 3페이지는 30까지
		// {startRow} ~ {endRow}
		
		int count = 0; //총 글 수 넣기 위해
		int pageBlock = 10; //블럭당 10개 패이지로 묶기
		
		count = sqlSession.selectOne("notice.selectCount"); //총 글 수 얻기
		//selectOne은 XML에서 해당 쿼리수행한것 가져오기 *****
		
		int number = count - (currentPage - 1) * pageSize; //글번호를 역순으로 하기
		
		HashMap <String, Integer> map = new HashMap <String, Integer>();
		map.put("start", startRow - 1); //시작 위치, MySql은 0부터 시작
		map.put("cnt", pageSize); //글 갯수 ( 10개씩 )
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1); //총 페이지 수
//							    몫				꽁다리 레코드 수
		int startPage = (currentPage / 10) * 10 + 1; // 시작페이지
		int endPage = startPage + pageBlock - 1;
		
		
		List <NoticeDto> list = sqlSession.selectList("notice.viewNotice", map);
		//selectList("XML쿼리경로",map); *****
		
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
		
		model.addAttribute("list",list); //출력할 데이터
		
		/* <나중에 추가>
		 * if(count > 0){//글이 존재하면 noticeList = dao.noticeGetList(startRow, pageSize);
		 * //dao메서드 호출하고 결과 받는다 }else{//글이 없으면 noticeList = Collections.EMPTY_LIST;
		 * //비어있는는 뜻 request.setAttribute("noticeList", noticeList);
		 */
		
		return ".main.notice.noticeList"; //뷰 리턴
	}
	
	
	
	
	
	//글 내용 보기 + 조회수 증가 ->  noticeContent.jsp
	@RequestMapping("noticeContent.do")
	public String noticeText(Model model, String n_num, String pageNum)
	throws IOException, NamingException{
		
		int numCount = Integer.parseInt(n_num); //*** String을 integer형으로 변환
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
	
	
	
	
	
	//글 수정 ->  noticeUpdateForm.jsp
	@RequestMapping("noticeUpdateForm.do")
	public ModelAndView updateForm(String n_num, String pageNum)
	throws IOException, NamingException{
		
		int num1 = Integer.parseInt(n_num);
		NoticeDto noticeDto = sqlSession.selectOne("notice.contentView",num1); // XML 글내용보기 ***
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("pageNum", pageNum);
		mv.addObject("noticeDto", noticeDto);
		mv.setViewName(".main.notice.noticeUpdateForm");
		
		return mv;
	}
	
	
	
	
	
//____________________________________________________________________________________
	//DB에 글 수정 , noticeUpdatePro.jsp
	
	//초기 MVC 기법 (pro JSP 별도로 만들고 사용하는 로직) - 수정,삭제
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
	
	
	
	
	//Spring MVC -> 경우의 수에 따라 메세지 출력 및 뷰 이동 [DB에 글수정]
	@RequestMapping(value = "noticeUpdatePro.do", method = RequestMethod.POST)
	public String noticeUpdatePro(String n_num, String u_pass, Model model, NoticeDto noticeDto, String pageNum)
	throws IOException, NamingException{
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("n_num", n_num);
		map.put("u_pass", u_pass);
		
		NoticeDto noticeDto2 = sqlSession.selectOne("notice.checkGetPw", map); // ***** XML, 글번호와 암호체크 
		
		if(noticeDto2 == null) {
			model.addAttribute("msg", "수정 실패 : 암호가 일치하지 않습니다. \n 암호를 정확히 입력해주세요.");
			return ".main.notice.noticeUpdateForm";
			
		}else {
			sqlSession.update("notice.noticeUpdatePro", noticeDto); // ***** XML, 글 수정 
//			model.addAttribute("msg","정상적으로 글 수정 완료했습니다. \n 리스트로 돌아갑니다.");
		}//if else end
		
		model.addAttribute("noticeDto",noticeDto);
		model.addAttribute("pageNum",pageNum);
		
		return "redirect:noticeList.do";
	}
	
	
	
	
	
	//글 삭제폼 ->  noticeDeleteForm.jsp
	@RequestMapping("noticeDeleteForm.do")
	public ModelAndView noticeDelete(String n_num, String pageNum)
	throws IOException, NamingException{
		
		ModelAndView mv = new ModelAndView(); //코드 가독성을 위해 제일 위에 작성
		
		int num1 = Integer.parseInt(n_num);
		NoticeDto noticeDto = sqlSession.selectOne("contentView", num1); //글내용보기
		
		mv.addObject("pageNum", pageNum);
		mv.addObject("noticeDto",noticeDto);
		mv.setViewName(".main.notice.noticeDeleteForm"); //뷰 이름 등록
		
		return mv;
	}
	
	
	
	
	
	//DB에 글 삭제 ->  noticeDeletePro.jsp
	@RequestMapping(value="noticeDeletePro.do", method=RequestMethod.POST)
	public String noticeDeletePro(String n_num, String u_pass, Model model, NoticeDto noticeDto, String pageNum)
	throws IOException, NamingException{
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("n_num", n_num);
		map.put("u_pass", u_pass);
		
		NoticeDto noticeDto3 = sqlSession.selectOne("notice.checkGetPw",map);
		
		if(noticeDto3 == null) {
			model.addAttribute("msg", "삭제 실패 :암호가 서로 일치하지 않습니다.");
			return ".main.notice.noticeDeleteForm"; //뷰 리턴(일치하지않으면)
		}else {
			sqlSession.delete("notice.noticeDelete",noticeDto3); //******* XML 이름 유의
		}
		
		model.addAttribute("noticeDto", noticeDto);
		model.addAttribute("pageNum", pageNum);
		
		return "redirect:noticeList.do";
	}

}//class end