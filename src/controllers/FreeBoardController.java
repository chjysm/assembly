package controllers;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import dao.FreeBoardDAO;
import dto.FreeBoardDTO;






@WebServlet("*.board01")
public class FreeBoardController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pw = response.getWriter();
		
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());

		System.out.println(command);


		FreeBoardDAO dao = new FreeBoardDAO();



	

		if(command.equals("/list.board01")) {//자유게시판 목록페이지로
			try {
				List<FreeBoardDTO> freeList = dao.FreeList();
				request.setAttribute("freeList", freeList);

			}catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect("error.html");
			}
			request.getRequestDispatcher("/WEB-INF/board/freeList.jsp").forward(request, response);
			//---------------------------------------------------------------------------------------------------------------------
		}else if(command.equals("/freeWrite.board01")) {//자유게시판 글작성 페이지로
			System.out.println("왔어");
			request.getRequestDispatcher("/WEB-INF/board/freeWrite.jsp").forward(request, response);;
			//---------------------------------------------------------------------------------------------------------------------			
		}else if(command.equals("/imageUpload.board01")) {//서버에 이미지 업로드
			String rootPath = this.getServletContext().getRealPath("/"); // 서블릿에 대한 환경정보 꺼내옴 -> getRealPath: 코드가 실행되는 진짜 경로
			System.out.println(rootPath);
			String nickForderPath = rootPath + (String)request.getSession().getAttribute("email");
			String dateForderPath = new SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
			String filePath = nickForderPath +"/"+ dateForderPath; // 파일이 업로드될 경로
			System.out.println(filePath);



			File uploadPath = new File(filePath);
			if(!uploadPath.exists()) {// 폴더 생성
				uploadPath.mkdir();
				System.out.println("폴더 생성");
			}
			DiskFileItemFactory diskFactory = new DiskFileItemFactory();
			diskFactory.setRepository(new File(rootPath + "/WEB-INF/temp")); // 임시폴더 생성

			ServletFileUpload sfu = new ServletFileUpload(diskFactory);
			sfu.setSizeMax(10 * 1024 * 1024);

			try {
				List<FileItem> items = sfu.parseRequest(request);
				for(FileItem fi : items) {
					if(fi.getSize() == 0 ) {continue;} // 파일사이즈가 0이라면(파일이 없다면) continue
					String tempFileName = null;
					while(true) {
						try {
							long tempTime = System.currentTimeMillis(); // 
							tempFileName = tempTime + "_" + fi.getName(); //파일이름설정
							fi.write(new File(filePath + "/" + tempFileName)); // 경로에 파일 저장
							System.out.println("파일이름 저장 완료");
							break;
						}catch(Exception e) {
							System.out.println("파일 이름 재설정");
							break;
						}
					}
					response.setCharacterEncoding("utf8");
					response.getWriter().append((String)request.getSession().getAttribute("email") +"/"+ dateForderPath + "/" + tempFileName);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}

//---------------------------------------------------------------------------------------------------------------------

		}else if(command.equals("/freeBaord.board01")) {//등록버튼 누르면
			request.getSession().setAttribute("flag", "true");
			String title = request.getParameter("title");
			String content = request.getParameter("summernote");
			String email = (String)request.getSession().getAttribute("email");

			Pattern p = Pattern.compile("^[a-z0-9]*");
			Matcher m = p.matcher(email);
			if(m.find()) {
				System.out.println(m.group());
			}
			String ip = request.getRemoteAddr();

			int id = (int)request.getSession().getAttribute("id");



			FreeBoardDTO dto = null;
			try {
				dto = new FreeBoardDTO(0, title, content, m.group(), 0, ip, null, id, email );
			}catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect("error.html");
			}




			int result = 0;
			try {
				result = dao.insert(dto); // 데이터베이스에 게시물 정보 담기
			}catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect("error.html");
			}
			request.setAttribute("result", result);
			if(result > 0) {
				System.out.println("입력됨 ㅠ");
				response.sendRedirect("list.board01");
			}else {System.out.println("입력안됨");}
			//---------------------------------------------------------------------------------------------------------------------			
		}else if(command.equals("/deleteFile.board")){//서버에 있는 파일 삭제
			String rootPath = this.getServletContext().getRealPath("/");
			try {Thread.sleep(1000);}catch(Exception e) {e.printStackTrace();}
			String flag = (String)request.getSession().getAttribute("flag");
			System.out.println(flag);
			if(flag.equals("false")) {
				String imgPath = request.getParameter("img");
				System.out.println(imgPath);

				File file = new File(rootPath + imgPath);

				if(file.exists()) { // 이미지가 서버에 존재 할 경우
					if(file.delete()) {
						pw.write("파일삭제 성공");
						System.out.println("파일삭제 성공");
					}else {
						pw.write("파일삭제 실패");
						System.out.println("파일삭제 실패");
					}
				}else {
					System.out.println("파일존재 안함");
				}
			}
			request.getSession().setAttribute("flag", "false");
			//---------------------------------------------------------------------------------------------------------------------
		}else if(command.equals("/freeContent.board01")) {//글 내용보기
			int seq = Integer.parseInt(request.getParameter("seq"));
			System.out.println(seq);
			try {
				int viewCount = dao.viewCount(seq); //조회수 올리기
			}catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect("error.html");
			}
			FreeBoardDTO content = null;
			try {
				content = dao.content(seq);
			}catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect("error.html");
			}
			request.setAttribute("content", content);
			request.getRequestDispatcher("/WEB-INF/board/freeContent.jsp").forward(request, response);
			//---------------------------------------------------------------------------------------------------------------------
		}else if(command.equals("/deleteContent.board01")) {
			int seq = Integer.parseInt(request.getParameter("seq"));
			int result = 0;
			try {
				result = dao.deleteContent(seq);
			}catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect("error.html");
			}
			if(result > 0) {
				System.out.println("삭제");
			}else {System.out.println("삭제 ㄴ");}
			request.getRequestDispatcher("list.board01").forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
