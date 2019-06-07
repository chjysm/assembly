package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import dao.MenuDataDAO;
import dao.WebApiDAO;
import dto.McdonaldDTO;



@WebServlet("*.go")
public class Translate extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf8");
		PrintWriter pw = response.getWriter();
		String cmd = request.getRequestURI().substring(request.getContextPath().length());
		MenuDataDAO machine = new MenuDataDAO();
		
			if(cmd.equals("/papago.go")) {
				JsonParser parser = new JsonParser();
				String msg = request.getParameter("source");
				WebApiDAO p = new WebApiDAO();
				String rst = p.translate(msg, "ko", "en");
				System.out.println(rst);
				String translate = null;
				try {
					JsonObject root = parser.parse(rst).getAsJsonObject();
					JsonObject message = root.get("message").getAsJsonObject();
					JsonObject result = message.get("result").getAsJsonObject();
					translate = result.get("translatedText").toString();
					
					String rst2 = p.translate(msg, "en", "ko");
					JsonObject root2 = parser.parse(rst2).getAsJsonObject();
					JsonObject message2 = root2.get("message").getAsJsonObject();
					JsonObject result2 = message2.get("result").getAsJsonObject();
					translate = result2.get("translatedText").toString();
					pw.append(translate);
				}catch(Exception e) {
					pw.print("잘못된 접근입니다. 다시 입력하세요.");
				}
			}else if(cmd.equals("/menupapago.go")) {
				JsonParser parser = new JsonParser();
				String msg = request.getParameter("key");
				WebApiDAO p = new WebApiDAO();
				String rst = p.translate(msg, "ko", "en");
				String translate = null;
				try {
					JsonObject root = parser.parse(rst).getAsJsonObject();
					JsonObject message = root.get("message").getAsJsonObject();
					JsonObject result = message.get("result").getAsJsonObject();
					translate = result.get("translatedText").toString();
					
					String rst2 = p.translate(msg, "en", "ko");
					JsonObject root2 = parser.parse(rst2).getAsJsonObject();
					JsonObject message2 = root2.get("message").getAsJsonObject();
					JsonObject result2 = message2.get("result").getAsJsonObject();
					translate = result2.get("translatedText").toString();
					pw.append(translate);
				}catch(Exception e) {
					pw.print("잘못된 접근입니다. 다시 입력하세요."+"<br>");
				}
			}else if(cmd.equals("/translateMenu.go")) {
				try {
					ArrayList<McdonaldDTO> burgers = machine.getMcInfo("burger");
					request.setAttribute("burgers", burgers);
					ArrayList<McdonaldDTO> set_menus = machine.getMcInfo("set_menu");
					request.setAttribute("set_menus", set_menus);
					ArrayList<McdonaldDTO> mc_mornings = machine.getMcInfo("mc_morning");
					request.setAttribute("mc_mornings", mc_mornings);
					ArrayList<McdonaldDTO> happys = machine.getMcInfo("happy");
					request.setAttribute("happys", happys);
					ArrayList<McdonaldDTO> happy_meals = machine.getMcInfo("happy_meal");
					request.setAttribute("happy_meals", happy_meals);
					ArrayList<McdonaldDTO> snack_sides = machine.getMcInfo("snack_side");
					request.setAttribute("snack_sides", snack_sides);
					ArrayList<McdonaldDTO> mc_cafes = machine.getMcInfo("mc_cafe");
					request.setAttribute("mc_cafes", mc_cafes);
					ArrayList<McdonaldDTO> beverages = machine.getMcInfo("beverage");
					request.setAttribute("beverages", beverages);
					ArrayList<McdonaldDTO> deserts = machine.getMcInfo("desert");
					request.setAttribute("deserts", deserts);
					request.getRequestDispatcher("/WEB-INF/game/translateMenu.jsp").forward(request, response);
				}catch(Exception e) {
					e.printStackTrace();
					response.sendRedirect("error.html");
				}
			}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
