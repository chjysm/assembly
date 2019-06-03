package controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Timer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.VisitDAO;
import dto.VisitDTO;

@WebServlet("*.admin")
public class AdminController extends HttpServlet {
	public static int visitCount;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = requestURI.substring(contextPath.length());

	
		try {
			// ========================================== 방문자 수 ==========================================
			if(cmd.equals("/goMain.admin")) {
				++visitCount;
				request.getServletContext().setAttribute("visitCount", visitCount);	
				if(visitCount<2) {						
					Timer timer = new Timer();
					Calendar date = Calendar.getInstance();
					date.set(Calendar.HOUR_OF_DAY, 23);
					date.set(Calendar.MINUTE, 59);
					date.set(Calendar.SECOND, 50);
					date.set(Calendar.MILLISECOND, 0);
					timer.schedule(
							new VisitDAO(),
							date.getTime(),
							1000 * 60 * 60 * 24
							);
				}
				request.getRequestDispatcher("/WEB-INF/main.jsp").forward(request, response);
			} 
			// ========================================== 관리자 페이지_그래프 ==========================================
			if(cmd.equals("/goAdmin.admin")) {
				VisitDAO vdao = new VisitDAO();
				List<VisitDTO> vdto = new ArrayList<>();
				vdto = vdao.VisitChart();
				
				request.setAttribute("vdto", vdto);
				request.getRequestDispatcher("/WEB-INF/etc/admin.jsp").forward(request, response);
			} 
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
