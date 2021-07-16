package co.kr.springBoardTrip;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.beans.factory.annotation.Autowired;
import org.apache.ibatis.session.SqlSession; //Mybatis
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import model.member.MemberDto; //회원관리 DB

import javax.servlet.http.HttpServletRequest;
import javax.naming.NamingException;

import java.io.IOException;
import java.util.*;//HashMap 사용

@Controller
public class MemberController {

   @Autowired
   private SqlSession sqlSession;//변수 선언
   
   
   @RequestMapping("main.do")
   public String mm() {
      return "main";//뷰 리턴 main.jsp
   }
   
   
   
   
   
   //회원가입 폼
   @RequestMapping("insertForm.do")
   public String insertForm() {
      //return "member/insertForm";//뷰 리턴 member/insertForm.jsp 만들고 작성
      return ".main.member.insertForm";//뷰 리턴 member/insertForm.jsp 만들고 작성
   }
   
   
   
   
   
   //id중복 체크
   @RequestMapping(value="idCheck.do",method=RequestMethod.POST)
   public String idCheck(String m_id,Model model)
   throws IOException,NamingException{
      
      //System.out.println("id:"+id);
      int check = -1;//사용중
      
      MemberDto memberDto = sqlSession.selectOne("member.selectOne",m_id);
      if(memberDto==null) {
         check=1;//사용 가능한 id
      }
      model.addAttribute("check",check);
      //System.out.println("check:"+check);//check:1
      
      return "/member/idCheck";//뷰 리턴  idCheck.jsp 만들고 작성
    }
   
   
   
   
   
   //회원 가입
   @RequestMapping(value="insertPro.do",method=RequestMethod.POST)
   public String memInsert(@ModelAttribute("memberDto") MemberDto memberDto, HttpServletRequest request)
   throws IOException,NamingException{
	   
	   String m_addr=request.getParameter("m_addr");
	   String m_addr2=request.getParameter("m_addr2");
	  
	   memberDto.setM_addr(m_addr+","+m_addr2);
      
      sqlSession.insert("member.insertMember",memberDto);
      //return "/member/loginForm";//뷰리턴 member/loginForm.jsp 만들기
      return ".main.member.loginForm";//뷰리턴 member/loginForm.jsp 만들기
   }
   
   
   
   
   
   //로그인 폼
   @RequestMapping("loginForm.do")
   public String loginF() {
	   //return "member/loginForm";//뷰리턴, loginForm.jsp 작성
	   return ".main.member.loginForm";//뷰리턴, loginForm.jsp 작성
   }
   
   
   
   
   
   //로그인(DB정보  확인)
   @RequestMapping(value="loginPro.do",method=RequestMethod.POST)
   public String loginM(String m_id,String m_pw, Model model)
   throws IOException,NamingException{
	   HashMap<String, String> map=new HashMap<String,String>();
	   map.put("m_id",m_id);
	   map.put("m_pw",m_pw);
	   
	   MemberDto memberDto=sqlSession.selectOne("member.selectLogin",map);
	   if(memberDto==null) {
		   model.addAttribute("msg","ID또는 패스워드가 일치하지 않습니다");
		   //return "/member/loginForm";//뷰리턴
		   return ".main.member.loginForm";//뷰리턴
	   }
	   
	   model.addAttribute("memberDto",memberDto);
	   //return "/member/loginSuccess";//뷰리턴
	   return ".main.member.loginSuccess";//뷰리턴
   }
   
   
   
   
   
   //로그아웃
   @RequestMapping("logOut.do")
   public String logOut() {
	  // return "/member/logOut";//뷰 리턴
	   return ".main.member.logOut";//뷰 리턴
   }
   
   
   
   
   
   //회원 수정 폼
   @RequestMapping(value="editForm.do", method=RequestMethod.POST)
   public String editF(String m_id, Model model)
   throws IOException,NamingException{
	   MemberDto memberDto=sqlSession.selectOne("member.selectOne",m_id);
	   String m_addr=memberDto.getM_addr();
	   String m_addr1[]=m_addr.split(",");
	   m_addr=m_addr1[0];//우편번호 검색하여 나온 주소
	   String m_addr2=m_addr1[1];//직접 적은 상세주소
	   
	   model.addAttribute("m_addr",m_addr);
	   model.addAttribute("m_addr2",m_addr2);
	   model.addAttribute("memberDto",memberDto);
	   
	  // return "/member/editForm";//뷰리턴 /member/editForm.jsp 만들기
	   return ".main.member.editForm";//뷰리턴 /member/editForm.jsp 만들기
   }
   
   
   
   
   
   //DB회원 정보 수정
   @RequestMapping(value="editPro.do", method=RequestMethod.POST)
   public String editP(@ModelAttribute("memberDto") MemberDto memberDto, HttpServletRequest request)
   throws IOException,NamingException{
	   
	   System.out.println("ID:"+memberDto.getM_id());
	   
	   String m_addr=request.getParameter("m_addr");
	   String m_addr2=request.getParameter("m_addr2");	  
	   memberDto.setM_addr(m_addr+","+m_addr2);
	   
	   sqlSession.update("member.memberUpdate",memberDto);
	   return "main";//views/main.jsp 만들기
   }
   
   
   
   
   
   //회원탈퇴
   @RequestMapping("deleteMember.do")
   public String deleteP(String m_id) 
		   throws IOException,NamingException{

	   sqlSession.delete("member.memberDelete",m_id);
	   return "main";//뷰리턴, main 작성
   }
}//class end