package controllers;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Timer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdminDAO;
import dao.FreeBoardDAO;
import dao.QnaBoardDAO;
import dao.StudyDAO;
import dao.SupportDAO;
import dto.AdminDTO;
import dto.FreeBoardDTO;
import dto.QnaBoardDTO;

@WebServlet("*.admin")
public class AdminController extends HttpServlet {
	public static int visitCount;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = requestURI.substring(contextPath.length());
		FreeBoardDAO fb = new FreeBoardDAO();
		QnaBoardDAO qb = new QnaBoardDAO();
		DecimalFormat formatter = new DecimalFormat("###,###");
		try {
			// ========================================== 방문자 수
			// ==========================================
			if (cmd.equals("/goMain.admin")) {
				++visitCount;
				request.getServletContext().setAttribute("visitCount", visitCount);
				if (visitCount < 2) {
					Timer timer = new Timer();
					Calendar date = Calendar.getInstance();
					date.set(Calendar.HOUR_OF_DAY, 23);
					date.set(Calendar.MINUTE, 59);
					date.set(Calendar.SECOND, 50);
					date.set(Calendar.MILLISECOND, 0);
					timer.schedule(new AdminDAO(), date.getTime(), 1000 * 60 * 60 * 24);
				}
				int FreeRecordCount = 0;
				int qnaRecordCount = 0;
				try {
					FreeRecordCount = fb.recordCount();
					qnaRecordCount = qb.recordCount();
				} catch (Exception e) {
					e.printStackTrace();
				}
				if (FreeRecordCount == 0) {
					request.setAttribute("FreeRecordCount", FreeRecordCount);
				} else {
					List<FreeBoardDTO> mainFreeList = null;
					try {
						mainFreeList = fb.mainFreeBoardList(1);
					} catch (Exception e) {
						e.printStackTrace();
						response.sendRedirect("error.html");
					}
					request.setAttribute("mainFreeList", mainFreeList);
				}
				if (qnaRecordCount == 0) {// 질문 게시판 게시글이 0 일경우
					request.setAttribute("qnaRecordCount", qnaRecordCount);
				} else {
					List<QnaBoardDTO> mainQnaList = null;
					try {
						mainQnaList = qb.mainQnaBoardList(1);
					} catch (Exception e) {
						e.printStackTrace();
						response.sendRedirect("error.html");
					}
					request.setAttribute("mainQnaList", mainQnaList);
				}
				request.getRequestDispatcher("/WEB-INF/main.jsp").forward(request, response);
			}
			// ========================================== 관리자 페이지_그래프
			// ==========================================
			if (cmd.equals("/goAdmin.admin")) { // 일일 방문자
				AdminDAO vdao = new AdminDAO();
				List<AdminDTO> vList = new ArrayList<>();
				vList = vdao.visitChart();
				request.setAttribute("vList", vList);

				AdminDTO vdto = new AdminDTO(); // 성별
				vdto = vdao.genderChart();
				request.setAttribute("vdto", vdto);

				AdminDTO agedto = new AdminDTO();
				agedto = vdao.ageChart();
				request.setAttribute("agedto", agedto); // 연령대

				AdminDTO agePerdto = new AdminDTO();
				agePerdto = vdao.agePerChart();
				request.setAttribute("agePerdto", agePerdto);

				SupportDAO su = new SupportDAO();
				int donationResult = su.getMax();

				String formatterDonationResult = formatter.format(donationResult);
				request.setAttribute("donation", formatterDonationResult);// 후원 금액

				StudyDAO st = new StudyDAO();
				String study1 = "macdonald";
				int studyCount = st.getCount(study1);
				System.out.println(studyCount);
				request.setAttribute("studyCount", studyCount);
				request.getRequestDispatcher("/WEB-INF/etc/admin.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
