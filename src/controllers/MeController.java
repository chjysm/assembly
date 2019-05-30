package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;

@WebServlet("*.me")
public class MeController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reqUri = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = reqUri.substring(ctxPath.length());
		MemberDAO me = new MemberDAO();
		response.setCharacterEncoding("UTF8");
		response.setContentType("text/html;charset=UTF-8");
		try {
			if(cmd.equals("/login.me")) {
				String email =request.getParameter("id");
				String pw =request.getParameter("pw");
				int result = me.loginCheck(email, pw);
				if(result==1) {
					int id=me.getId(email);
					String nickname= me.getNickname(email);
					request.getSession().setAttribute("id", id);
					request.getSession().setAttribute("email", email);
					request.getSession().setAttribute("type", 3);
					request.getSession().setAttribute("nickname", nickname);
					response.sendRedirect("main.jsp");
				}else {
					response.getWriter().append("<script>;"
							+ "if(alert('로그인 실패! 아이디와 비밀번호를 확인 하세요!')!=0){  location.href='main.jsp'}</script>");
				}
			}else if(cmd.equals("/logout.me")) {
				request.getSession().setAttribute("id", null);
				request.getSession().setAttribute("email", null);
				request.getSession().setAttribute("type", null);
				request.getSession().setAttribute("nickname", null);
				request.getRequestDispatcher("main.jsp").forward(request, response);
			}else if(cmd.equals("/getPw.me")) {
				request.getRequestDispatcher("getPw.jsp").forward(request, response);
			}else if(cmd.equals("/goPwReset.me")) {
				String email=request.getParameter("email");
				request.setAttribute("email", email);
				request.getRequestDispatcher("pwReset.jsp").forward(request, response);
			}else if(cmd.equals("/pwReset.me")) {
				String email=request.getParameter("email");
				String pw=request.getParameter("pw");
				System.out.println(email +" "+pw);
				int result=me.pwReset(email, pw);
				response.getWriter().print(result);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
