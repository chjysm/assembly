package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FreeBoardDAO;
import dao.NoticeBoardDAO;
import dao.QnaBoardDAO;
import dto.FreeBoardDTO;
import dto.NoticeBoardDTO;
import dto.QnaBoardDTO;


@WebServlet("*.win")
public class WinController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF8");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8 ");
		String reqUri = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = reqUri.substring(ctxPath.length());
		FreeBoardDAO fb= new FreeBoardDAO();
		QnaBoardDAO qb = new QnaBoardDAO();
		NoticeBoardDAO nb = new NoticeBoardDAO();

		try {
			if (cmd.equals("/goMain.win")) { // 메인페이지로 이동
				
				int freeRecordCount = 0 ;
				int qnaRecordCount = 0; 
				int noticeRecordCount = 0;
				try {
				freeRecordCount = fb.recordCount();
				qnaRecordCount = qb.recordCount();
				noticeRecordCount = nb.recordCount();
				}catch(Exception e) {
					e.printStackTrace();
				}
				
				if(freeRecordCount == 0 ) { // 자유게시판 게시글 0 일 경우
					request.setAttribute("freeRecordCount", freeRecordCount);
				}else{
				List<FreeBoardDTO> mainFreeList = null;
				try {
				mainFreeList = fb.mainFreeBoardList(1);
				}catch(Exception e) {
					e.printStackTrace();
					response.sendRedirect("error.html");
				}
				request.setAttribute("mainFreeList", mainFreeList);
				}
				if(qnaRecordCount == 0) {//질문 게시판 게시글이 0 일경우
					request.setAttribute("qnaRecordCount", qnaRecordCount);
				}else {
					List<QnaBoardDTO> mainQnaList = null;
					try {
					mainQnaList = qb.mainQnaBoardList(1);
					}catch(Exception e) {
						e.printStackTrace();
						response.sendRedirect("error.html");
					}
					request.setAttribute("mainQnaList", mainQnaList);
				}
				if(noticeRecordCount == 0) {// 공지게시판 게시글이 0일 경우
					request.setAttribute("noticeRecordCount", noticeRecordCount);
				}else {
					List<NoticeBoardDTO> mainNoticeList = null;
					try {
						mainNoticeList = nb.mainNoticeBoardList(1);
					}catch(Exception e) {
						e.printStackTrace();
						response.sendRedirect("error.html");
					}
					request.setAttribute("mainNoticeList", mainNoticeList);
				}
				request.getRequestDispatcher("/WEB-INF/main.jsp").forward(request, response);
				

				
				

			}else if (cmd.equals("/goStoreSerch.win")) {
				request.getRequestDispatcher("/WEB-INF/etc/storeSerch.jsp").forward(request, response);
			}else if (cmd.equals("/goStoreSerch2.win")) {
				String addr=request.getParameter("addr");
				request.setAttribute("addr", addr);
				request.getRequestDispatcher("/WEB-INF/etc/storeSerch2.jsp").forward(request, response);
			}else if (cmd.equals("/goStoreSerch3.win")) {
				//String addr=new String(request.getParameter("addr").getBytes(),"ISO-8859-1");
				//String brand=new String(request.getParameter("brand").getBytes(),"ISO-8859-1");
				String addr=request.getParameter("addr");
				String brand=request.getParameter("brand");
				request.setAttribute("addr", addr);
				request.setAttribute("brand", brand);
				request.getRequestDispatcher("/WEB-INF/etc/storeSerch3.jsp").forward(request, response);
				//response.sendRedirect("http://map.daum.net/?sName="+addr+"&eName="+brand);
				//request.getRequestDispatcher("http://map.daum.net/?sName="+addr+"&eName="+brand).forward(request, response);
			}else if (cmd.equals("/goInfo.win")) { // 메인페이지로 이동
				request.getRequestDispatcher("/WEB-INF/etc/information.jsp").forward(request, response);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
