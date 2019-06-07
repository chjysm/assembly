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

@WebServlet("*.coffeone")
public class MachineCoffee1 extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf8");
		PrintWriter out = response.getWriter();
		
		String cmd = request.getRequestURI().substring(request.getContextPath().length());
		MenuDataDAO machine = new MenuDataDAO();
		
//		int[] randomNumber = new int[] {1000, 1500, 2000, 3500, 4500, 5800, 6300, 7000};
//		int num = randomNumber[(int) (Math.floor(Math.random()*(randomNumber.length-1)+1))];
		
		if(cmd.equals("/getCode.coffeone")) {
				String personalCode = machine.personalCode();
			try {
				machine.insertGameCode(personalCode);
				request.getSession().setAttribute("personalCode", personalCode);
				request.getRequestDispatcher("/WEB-INF/game/cf_score1_2.jsp").forward(request, response);
			}catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect("error.html");
			}
		}else if(cmd.equals("/mc_mainMenu.coffeone")) {
			try {
				ArrayList<McdonaldDTO> coffee_coffees = machine.getMcInfo("coffee_coffee");
				request.setAttribute("coffee_coffees", coffee_coffees);
				request.getRequestDispatcher("/WEB-INF/game/cf_score1_3.jsp").forward(request, response);
			}catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect("error.html");
			}
		}else if(cmd.equals("/mc_sideMenu.coffeone")) {
			try {
				ArrayList<McdonaldDTO> coffee_hollys = machine.getMcInfo("coffee_holly");
				request.setAttribute("coffee_hollys", coffee_hollys);
				request.getRequestDispatcher("/WEB-INF/game/cf_score1_4.jsp").forward(request, response);
			}catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect("error.html");
			}
		}else if(cmd.equals("/mc_beverage.coffeone")) {
			try {
				ArrayList<McdonaldDTO> coffee_bakerys = machine.getMcInfo("coffee_bakery");
				request.setAttribute("coffee_bakerys", coffee_bakerys);
				request.getRequestDispatcher("/WEB-INF/game/cf_score1_5.jsp").forward(request, response);
			}catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect("error.html");
			}
		}else if(cmd.equals("/mc_slide.coffeone")) {
			try {
				McdonaldDTO dto1 = machine.joinquery("coffee_coffee", "burgerNameY", request.getSession().getAttribute("personalCode").toString());
				request.setAttribute("coffeeResult", dto1);
				McdonaldDTO dto2 = machine.joinquery("coffee_holly", "sideNameY", request.getSession().getAttribute("personalCode").toString());
				request.setAttribute("hollyResult", dto2);
				McdonaldDTO dto3 = machine.joinquery("coffee_bakery", "beverageNameY", request.getSession().getAttribute("personalCode").toString());
				request.setAttribute("bakeryResult", dto3);
				request.getRequestDispatcher("/WEB-INF/game/cf_score1_6.jsp").forward(request, response);
			}catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect("error.html");
			}
		}else if(cmd.equals("/mc_fin.coffeone")) {
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
				McdonaldDTO dto2 = machine.joinquery("coffee_holly", "sideNameY", request.getSession().getAttribute("personalCode").toString());
				request.setAttribute("hollyResult", dto2);
				McdonaldDTO dto3 = machine.joinquery("coffee_bakery", "beverageNameY", request.getSession().getAttribute("personalCode").toString());
				request.setAttribute("bakeryResult", dto3);
				request.getRequestDispatcher("/WEB-INF/game/cf_score1_7.jsp").forward(request, response);
			}catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect("error.html");
			}
		}else if(cmd.equals("/takeio.coffeone")) {
			String takeIOM = request.getParameter("key1");
			String takeIOY = request.getParameter("key2");
			int result1 = machine.updateGameStuff("takeIOM", takeIOM, request.getSession().getAttribute("personalCode").toString());
			int result2 = machine.updateGameStuff("takeIOY", takeIOY, request.getSession().getAttribute("personalCode").toString());
			if(result1>0 && result2>0) {
				out.print("다음 단계로 넘어갑니다");
			}else {
				out.print("오류발생");
			}	
		}else if(cmd.equals("/burger_value.coffeone")) {
			String burgerNameM = request.getParameter("key1");
			String burgerNameY = request.getParameter("key2");
			int result1 = machine.updateGameStuff("burgerNameM", burgerNameM, request.getSession().getAttribute("personalCode").toString());
			int result2 = machine.updateGameStuff("burgerNameY", burgerNameY, request.getSession().getAttribute("personalCode").toString());
			if(result1>0 && result2>0) {
				out.print("다음 단계로 넘어갑니다");
			}else {
				out.print("오류발생");
			}	
		}else if(cmd.equals("/snack_value.coffeone")) {
			String sideNameM = request.getParameter("key1");
			String sideNameY = request.getParameter("key2");
			int result1 = machine.updateGameStuff("sideNameM", sideNameM, request.getSession().getAttribute("personalCode").toString());
			int result2 = machine.updateGameStuff("sideNameY", sideNameY, request.getSession().getAttribute("personalCode").toString());
			if(result1>0 && result2>0) {
				out.print("다음 단계로 넘어갑니다");
			}else {
				out.print("오류발생");
			}	
		}else if(cmd.equals("/beverage_value.coffeone")) {
			String beverageNameM = request.getParameter("key1");
			String beverageNameY = request.getParameter("key2");
			int result1 = machine.updateGameStuff("beverageNameM", beverageNameM, request.getSession().getAttribute("personalCode").toString());
			int result2 = machine.updateGameStuff("beverageNameY", beverageNameY, request.getSession().getAttribute("personalCode").toString());
			if(result1>0 && result2>0) {
				out.print("다음 단계로 넘어갑니다");
			}else {
				out.print("오류발생");
			}	
		}else if(cmd.equals("/session_end.coffeone")) { //게임종료 후 세션 속성 지우기
			request.getSession().removeAttribute("personalCode");
		}
		
		//WEB-INF우회
		else if(cmd.equals("/startGame.coffeone")) {
			request.getRequestDispatcher("/WEB-INF/game/game_start.jsp").forward(request, response);
		}else if(cmd.equals("/goFirstStep.coffeone")) {
			request.getRequestDispatcher("/WEB-INF/game/cf_score1_1.jsp").forward(request, response);
		}else if(cmd.equals("/returnMain.coffeone")) {
			request.getRequestDispatcher("/WEB-INF/main.jsp").forward(request, response);
		}else if(cmd.equals("/returntakeio.coffeone")) {
			request.getRequestDispatcher("/WEB-INF/game/cf_score1_2.jsp").forward(request, response);
		}
		///////
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
