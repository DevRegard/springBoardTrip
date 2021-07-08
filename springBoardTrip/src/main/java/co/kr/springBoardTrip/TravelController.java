package co.kr.springBoardTrip;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.beans.factory.annotation.Autowired;
import org.apache.ibatis.session.SqlSession; //Mybatis 사용 private SqlSession sqlSession(변수 소문자로 둔다)
import org.springframework.web.servlet.ModelAndView;

import model.travel.TravelDto;

import javax.servlet.http.HttpServletRequest;
import javax.naming.NamingException;

import java.util.*;//HashMap 사용
import java.io.IOException;

//Front Controller(org.springframework.web.servlet.DispatcherServlet)
//                (org.springframework.web.servlet.DispatcherServlet)
//Controller(컨트롤러) : Action에 해당

@Controller
public class TravelController {

	@Autowired//setter가 자동
	private SqlSession sqlSession;//변수 MyBatis 사용 


	//글쓰기 폼, 답글, 원글 writeForm
		@RequestMapping("travel_writeForm.do") //요청매핑, 프로젝트에서 writeForm.do하면 writeForm.jsp 실행
		public String writeF(Model model, String num, String pageNum) {
	
			if(num == null) {//원글쓰기
				num = "0";//글번호
			}
	
			model.addAttribute("pageNum",pageNum);//request.setAttribute()와 같은 개념
			model.addAttribute("num",new Integer(num));
			
			//return "travel/writeForm";//뷰를 리턴, views/writeForm.jsp 작성
			return ".main.travel.travel_writeForm";//뷰를 리턴, views/writeForm.jsp 작성
		}// writeForm()---
		

	//DB에 글쓰기 insert
		@RequestMapping(value="/travel_writePro.do",method=RequestMethod.POST)
		public String writePro(@ModelAttribute("travelDto") TravelDto travelDto,HttpServletRequest request)
				throws IOException,NamingException{
	
			int maxNum=0;//최대 글번호, 변수선언
			if(sqlSession.selectOne("travel.numMax") != null) {
				//최대 글번호가 null이 아니면, 최대글번호가 있으면
				maxNum=sqlSession.selectOne("travel.numMax");
			}
	
			if(maxNum != 0) {//최대 글번호가 0이 아니면 
				maxNum=maxNum+1;//최대 글번호 +1로 글작성, 답글 그룹으로 하려고
			}else {
				maxNum=1;//글번호 1부터 작성(처음글이면), 답글 그룹으로 사용하려고
			}
	
			String ip=request.getRemoteAddr();//ip구한다
			travelDto.setIp(ip);//setter 작업
	
			sqlSession.insert("travel.insertTravel",travelDto);//insert
			//DB처리
			return "redirect:travel_list.do";//jsp의 response.sendReditect("list.jsp")같다
		}//writePro() end


	//list 리스트
		@RequestMapping("travel_list.do")
		public String listtravel(Model model, String pageNum)
				throws IOException,NamingException{
	
			if(pageNum==null) {pageNum="1";}
	
			int pageSize=10;
			int currentPage=Integer.parseInt(pageNum);
			int startRow=(currentPage-1)*pageSize+1; //한 페이지의 첫번째 row 구한다
			int endRow=currentPage*pageSize; //한페이지의 마지막 row를 구한다
	
			int count=0;//총 글 수 넣으려고
			int pageBlock=10;//블럭당 10개 페이지
	
			count=sqlSession.selectOne("travel.selectCount"); //총 글 수 얻기
	
			int number=count-(currentPage-1)*pageSize; //글번호를 역순으로
				
			int pageCount=count/pageSize+(count%pageSize==0?0:1); //총 페이지 수 구하기
			int startPage=(currentPage/10)*10+1;//시작페이지
			//                
			int endPage=startPage+pageBlock-1;
			//             1+10-1=10 end페이지	
					
			HashMap<String,Integer> map=new HashMap<String,Integer>();
			map.put("start", startRow-1); //시작위치, mysql은 0부터 시작]
			map.put("cnt", pageSize); //글 갯수 (10개씩)
	
			List<TravelDto> list=sqlSession.selectList("travel.selectList",map);
	
			model.addAttribute("currentPage",currentPage);
			model.addAttribute("startRow",startRow);
			model.addAttribute("endRow",endRow);
	
			model.addAttribute("pageBlock",pageBlock);
			model.addAttribute("pageCount",pageCount);
	
			model.addAttribute("startPage",startPage);
			model.addAttribute("endPage",endPage);
	
			model.addAttribute("count",count);
			model.addAttribute("pageSize",pageSize);
	
			model.addAttribute("number",number);
			model.addAttribute("list",list);//출력할 데이터
	
			return ".main.travel.travel_list";//뷰 리턴
		}
	

	//조횟수 증가, 글내용보기
		@RequestMapping("travel_content.do")
		public String content(Model model,String num, String pageNum)
		throws IOException,NamingException{
			int num1=Integer.parseInt(num);
			sqlSession.update("travel.readCount",num1);//조횟수 증가
			
			//글 내용 보기
			TravelDto travelDto=sqlSession.selectOne("travel.getTravel",num1);
			
			String content=travelDto.getContent();
			content=content.replace("\n", "<br>");
			model.addAttribute("content",content);
			
			model.addAttribute("num",num1);
			model.addAttribute("pageNum",pageNum);
			model.addAttribute("travelDto",travelDto);
			
			return ".main.travel.travel_content";//뷰 리턴, views/travel/content.jsp
		}

	
	//글수정 폼
		@RequestMapping("travel_updateForm.do")
		public ModelAndView updateForm(String num, String pageNum) 
		throws IOException,NamingException{
			
			int num1=Integer.parseInt(num);
			TravelDto travelDto=sqlSession.selectOne("travel.getTravel",num1); //***
			
			ModelAndView mv=new ModelAndView();
			mv.addObject("pageNum",pageNum);
			mv.addObject("travelDto",travelDto);
			
			mv.setViewName(".main.travel.travel_updateForm");//뷰
			
			return mv;
		}

		
	//DB 글 수정
		@RequestMapping(value="travel_updatePro.do",method=RequestMethod.POST)
		public String travel_updatePro(String num, String pw, Model model,TravelDto travelDto,String pageNum)
				throws IOException,NamingException{
			HashMap<String,String> map=new HashMap<String,String>();
			map.put("num", num);
			map.put("pw", pw);

			TravelDto travelDto1=sqlSession.selectOne("travel.getPW",map); //***
			if(travelDto1==null) {
				model.addAttribute("msg","수정 실패 : 암호가 틀립니다.");
//						return "/member/loginForm";//뷰 리턴
				return ".main.travel.travel_updateForm";//뷰 리턴
			}else{
				sqlSession.update("travel.travel_updatePro",travelDto); //***
			}
			
			model.addAttribute("travelDto",travelDto);
			model.addAttribute("pageNum",pageNum);
			return "redirect:travel_list.do";//뷰 리턴
		}
		
		
	//글삭제 폼
		@RequestMapping("travel_delete.do")
		public ModelAndView delete(String num, String pageNum) 
		throws IOException,NamingException{
			
			int num1=Integer.parseInt(num);
			TravelDto travelDto=sqlSession.selectOne("travel.getTravel",num1);
			
			ModelAndView mv=new ModelAndView();
			mv.addObject("pageNum",pageNum);
			mv.addObject("travelDto",travelDto);
			
			mv.setViewName(".main.travel.travel_delete");//뷰
			
			return mv;
		}

	//DB 글 삭제
		@RequestMapping(value="travel_deletePro.do",method=RequestMethod.POST)
		public String deletePro(String num, String pw, Model model,TravelDto travelDto,String pageNum)
				throws IOException,NamingException{
			HashMap<String,String> map=new HashMap<String,String>();
			map.put("num", num);
			map.put("pw", pw);
	
			TravelDto travelDto1=sqlSession.selectOne("travel.getPW",map);
			if(travelDto1==null) {
				model.addAttribute("msg","삭제 실패 : 암호가 틀립니다.");
	//						return "/member/loginForm";//뷰 리턴
				return ".main.travel.travel_delete";//뷰 리턴
			}else {
			sqlSession.delete("travel.travel_deletePro",travelDto1);
			}
			model.addAttribute("travelDto",travelDto);
			model.addAttribute("pageNum",pageNum);
			return "redirect:travel_list.do";//뷰 리턴
		}

}//class
