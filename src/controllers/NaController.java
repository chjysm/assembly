package controllers;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonParser;

import dao.MemberDAO;
import dao.NaverDAO;
import dto.MemberDTO;


@WebServlet("*.na")
public class NaController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		String reqUri = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = reqUri.substring(ctxPath.length());
		NaverDAO na = new NaverDAO();
		MemberDAO me = new MemberDAO();
		Gson g = new Gson();
		JsonParser parse = new JsonParser();
		response.setCharacterEncoding("UTF8");
		response.setContentType("text/html;charset=UTF-8");
		try {
			if(cmd.equals("/login.na")) {
				String apiURL=na.login();
				response.sendRedirect(apiURL);
			}else if(cmd.equals("/callback.na")) {
				String code = request.getParameter("code");
				String state = request.getParameter("state");
				String res = na.getToken(code, state);
				String access_token=parse.parse(res.toString()).getAsJsonObject().get("access_token").getAsString();
				String info=na.getInfo(access_token);
				try {
					String email=parse.parse(info).getAsJsonObject().get("email").getAsString();
					String nickname=parse.parse(info).getAsJsonObject().get("nickname").getAsString();
					String age=parse.parse(info).getAsJsonObject().get("age").getAsString();
					String gender=parse.parse(info).getAsJsonObject().get("gender").getAsString();
					String name = parse.parse(info).getAsJsonObject().get("name").getAsString();
					String birthday = parse.parse(info).getAsJsonObject().get("birthday").getAsString();
					int type = 1;
					email+=" "+type;
					if(me.check(email)==0) {
						int result = me.insert_member(new MemberDTO(0,email,null,name,nickname,birthday,gender,age,type));
					}
					int id=me.getId(email);
					request.getSession().setAttribute("id", id);
					request.getSession().setAttribute("email", email);
					request.getSession().setAttribute("type", type);
					request.getSession().setAttribute("nickname", nickname);
					response.sendRedirect("main.jsp");
				}catch(Exception e) {
					request.setAttribute("type", 1);
					request.getRequestDispatcher("reprompt.jsp").forward(request, response);
				}
			}else if(cmd.equals("/reprompt.na")) {
				response.sendRedirect(na.reprompt());
			}else if(cmd.equals("/logout.na")) {
				request.getSession().setAttribute("id", null);
				request.getSession().setAttribute("email", null);
				request.getSession().setAttribute("type", null);
				request.getSession().setAttribute("nickname", null);
				request.getRequestDispatcher("main.jsp").forward(request, response);
			}
		}catch (Exception e) {
			e.printStackTrace();

		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
