package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FreeBoardDAO;
import dto.FreeBoardDTO;


@WebServlet("*.win")
public class WinController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF8");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String reqUri = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = reqUri.substring(ctxPath.length());
		PrintWriter pt = response.getWriter();
		FreeBoardDAO fb= new FreeBoardDAO();
		try {
			if (cmd.equals("/goMain.win")) {
				request.getRequestDispatcher("main.jsp").forward(request, response);
			}else if(cmd.equals("/goFreeList.win")) {//자유게시판 목록페이지로
				try {
					List<FreeBoardDTO> freeList = fb.FreeList();
					request.setAttribute("freeList", freeList);
				
					}catch(Exception e) {
						e.printStackTrace();
						response.sendRedirect("error.html");
					}
				request.getRequestDispatcher("/WEB-INF/board/freeList.jsp").forward(request, response);
				}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
