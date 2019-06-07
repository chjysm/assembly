package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MenuDataDAO;
import dto.McFinalDTO;
import dto.McdonaldDTO;

@WebServlet("*.coffesec")
public class MachineCoffee2 extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf8");
		PrintWriter out = response.getWriter();
		
		String cmd = request.getRequestURI().substring(request.getContextPath().length());
		MenuDataDAO machine = new MenuDataDAO();
		
		if(cmd.equals("/getCode.coffesec")) {
				String personalCode = machine.personalCode();
			try {
				machine.insertGameCode(personalCode);
				request.getSession().setAttribute("personalCode", personalCode);
				request.getRequestDispatcher("/WEB-INF/game/cf_score2_takeio.jsp").forward(request, response);
			}catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect("error.html");
			}
		}else if(cmd.equals("/takeio.coffesec")) {
			String takeIOY = request.getParameter("key2");
			int result = machine.updateGameStuff("takeIOY", takeIOY, request.getSession().getAttribute("personalCode").toString());
			if(result>0) {
				out.print("다음 단계로 넘어갑니다");
			}else {
				out.print("오류발생");
			}	
		}else if(cmd.equals("/mc_allMenu.coffesec")) {
			try {
				ArrayList<McdonaldDTO> coffee_coffees = machine.getMcInfo("coffee_coffee");
				request.setAttribute("coffee_coffees", coffee_coffees);
				ArrayList<McdonaldDTO> coffee_lattes = machine.getMcInfo("coffee_latte");
				request.setAttribute("coffee_lattes", coffee_lattes);
				ArrayList<McdonaldDTO> coffee_hollys = machine.getMcInfo("coffee_holly");
				request.setAttribute("coffee_hollys", coffee_hollys);
				ArrayList<McdonaldDTO> coffee_teas = machine.getMcInfo("coffee_tea");
				request.setAttribute("coffee_teas", coffee_teas);
				ArrayList<McdonaldDTO> coffee_bakerys = machine.getMcInfo("coffee_bakery");
				request.setAttribute("coffee_bakerys", coffee_bakerys);
				request.getRequestDispatcher("/WEB-INF/game/cf_score2_slider.jsp").forward(request, response);
			}catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect("error.html");
			}
		}else if(cmd.equals("/burger_value.coffesec")) {
			String burgerNameY = request.getParameter("key2");
			int result = machine.updateGameStuff("burgerNameY", burgerNameY, request.getSession().getAttribute("personalCode").toString());	
		}else if(cmd.equals("/snack_value.coffesec")) {
			String sideNameY = request.getParameter("key2");
			int result = machine.updateGameStuff("sideNameY", sideNameY, request.getSession().getAttribute("personalCode").toString());
		}else if(cmd.equals("/beverage_value.coffesec")) {
			String beverageNameY = request.getParameter("key2");
			int result = machine.updateGameStuff("beverageNameY", beverageNameY, request.getSession().getAttribute("personalCode").toString());	
		}else if(cmd.equals("/cafe_value.coffesec")) {
			String cafeNameY = request.getParameter("key2");
			int result = machine.updateGameStuff("cafeNameY", cafeNameY, request.getSession().getAttribute("personalCode").toString());	
		}else if(cmd.equals("/desert_value.coffesec")) {
			String desertNaemY = request.getParameter("key2");
			int result = machine.updateGameStuff("desertNaemY", desertNaemY, request.getSession().getAttribute("personalCode").toString());	
		}else if(cmd.equals("/mc_slide.coffesec")) {
			try {
				McdonaldDTO dto1 = machine.joinquery("coffee_coffee", "burgerNameY", request.getSession().getAttribute("personalCode").toString());
				request.setAttribute("coffeeResult", dto1);
				McdonaldDTO dto2 = machine.joinquery("coffee_latte", "sideNameY", request.getSession().getAttribute("personalCode").toString());
				request.setAttribute("latteResult", dto2);
				McdonaldDTO dto3 = machine.joinquery("coffee_holly", "beverageNameY", request.getSession().getAttribute("personalCode").toString());
				request.setAttribute("hollyResult", dto3);
				McdonaldDTO dto4 = machine.joinquery("coffee_tea", "cafeNameY", request.getSession().getAttribute("personalCode").toString());
				request.setAttribute("teaResult", dto4);
				McdonaldDTO dto5 = machine.joinquery("coffee_bakery", "desertNaemY", request.getSession().getAttribute("personalCode").toString());
				request.setAttribute("bakeryResult", dto5);
				request.getRequestDispatcher("/WEB-INF/game/cf_score2_almostdone.jsp").forward(request, response);
			}catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect("error.html");
			}
		}else if(cmd.equals("/mc_fin.coffesec")) {
			try {
				machine.updateEnd(request.getSession().getAttribute("personalCode").toString());
				McFinalDTO dto = machine.selectMcFinal(request.getSession().getAttribute("personalCode").toString());
				request.setAttribute("dto", dto);
				long timeLast = dto.getEnd()-dto.getBegin();
				String time = null;
					if(0 < timeLast && timeLast < 60000) {
						time = timeLast / 1000 + "초 걸림";
					}else if(60000 < timeLast){
						time = timeLast / (1000 * 60) + "분 걸림";
					}
				request.setAttribute("time", time);
				McdonaldDTO dto1 = machine.joinquery("coffee_coffee", "burgerNameY", request.getSession().getAttribute("personalCode").toString());
				request.setAttribute("coffeeResult", dto1);
				McdonaldDTO dto2 = machine.joinquery("coffee_latte", "sideNameY", request.getSession().getAttribute("personalCode").toString());
				request.setAttribute("latteResult", dto2);
				McdonaldDTO dto3 = machine.joinquery("coffee_holly", "beverageNameY", request.getSession().getAttribute("personalCode").toString());
				request.setAttribute("hollyResult", dto3);
				McdonaldDTO dto4 = machine.joinquery("coffee_tea", "cafeNameY", request.getSession().getAttribute("personalCode").toString());
				request.setAttribute("teaResult", dto4);
				McdonaldDTO dto5 = machine.joinquery("coffee_bakery", "desertNaemY", request.getSession().getAttribute("personalCode").toString());
				request.setAttribute("bakeryResult", dto5);
				request.getRequestDispatcher("/WEB-INF/game/cf_score2_done.jsp").forward(request, response);
			}catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect("error.html");
			}
		}
		
		
		//WEB-INF우회
		else if(cmd.equals("/startGame.coffesec")) {
			request.getRequestDispatcher("/WEB-INF/game/game_start.jsp").forward(request, response);
		}else if(cmd.equals("/goSecStep.coffesec")) {
			request.getRequestDispatcher("/WEB-INF/game/cf_score2_start.jsp").forward(request, response);
		}else if(cmd.equals("/returnMain.kiosk")) {
			request.getRequestDispatcher("/WEB-INF/main.jsp").forward(request, response);
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
