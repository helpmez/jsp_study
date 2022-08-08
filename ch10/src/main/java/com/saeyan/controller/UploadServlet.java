package main.java.com.saeyan.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String savePath = "upload";
		int uploadFileSizeLimit = 5 * 1024 * 1024;
		String encType = "utf-8";
		
		ServletContext context = getServletContext();
		String uploadFilePath = context.getRealPath(savePath);
		System.out.println("서버상의 실제 디렉토리 :");
		System.out.println("uploadFilePath");
		
		try {
			MultipartRequest multi = new MultipartRequest(
					request, uploadFilePath, uploadFileSizeLimit, encType,
					new DefaultFileRenamePolicy());
			String fileName = multi.getFilesystemName("uploadFilePath");
			
			if (fileName == null) {
				System.out.println("파일이 업로드 되지않음");
			}else {
				out.print("<br>글쓴이 : " + multi.getParameter("name"));
				out.print("<br>제목 : " + multi.getParameter("title"));
				out.print("<br>파일명 : " + fileName);
			}
		}catch (Exception e) {
			System.out.println("예외발생:"+e);		
		}
	}
}


