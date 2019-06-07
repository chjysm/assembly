package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;



@WebServlet("*.go")
public class Translate extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf8");
		PrintWriter pw = response.getWriter();
		String cmd = request.getRequestURI().substring(request.getContextPath().length());
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
			}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
