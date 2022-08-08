package ch09.com.saeyan.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ch09.com.saeyan.dao.MemberDAO;
import ch09.com.saeyan.dto.MemberVO;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "member/login.jsp";
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginUser") != null){
			url="main.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("dopost");
		String url = "member/login.jsp";
		
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		
		MemberDAO mDao=MemberDAO.getInstance(); // 회원 인증을 하기위해 MmberDAO에 있는 userCheck 메서드를 
												// 사용하기위해 MemberDAO를 참조하는 객체생성
		int result = mDao.userCheck(userid, pwd); // login.jsp에서 입력한 아이디와 패스워드를 getParameter로 가져와서 userCheck 메서드 실행
		
		if(result==1) {  // 회원정보가 일치했을때 
			MemberVO mVo = mDao.getMember(userid);      // getMember에서 가져온 회원정보를 MemberVO를 참조하는 mVo 객체에 저장
			HttpSession session = request.getSession(); // 세션 객체를 생성하여 
			session.setAttribute("loginUser", mVo);		// 세션에 회원 정보를 저장
			request.setAttribute("message", "회원가입에 성공");
			url="main.jsp";                             // 인증에 성공했다면 메인화면으로 이동
		}else if(result==0) {  // 비밀번호가 맞지않을때
			request.setAttribute("message", "비밀번호가 맞지 않습니다");
		}else if(result==-1) {  // 아이디가 존재하지않을때
			request.setAttribute("message", "존재하지 않는 회원입니다");
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
