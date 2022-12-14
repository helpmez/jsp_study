package com.saeyan.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.saeyan.dao.ProductDAO;
import com.saeyan.dto.ProductVO;


@WebServlet("/productUpdate.do")
public class ProductUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String code = request.getParameter("code"); 
		// jsp에서 넘겨온 상품 코드 
		ProductDAO pDao = ProductDAO.getInstance();
		ProductVO pVo = pDao.selectProductByCode(code);
		// 코드로 검색된 상품 정보를 저장
		request.setAttribute("product", pVo);
		// 그 정보를 request 속성에 저장
		RequestDispatcher dispatcher = request
				.getRequestDispatcher("product/productUpdate.jsp");
		dispatcher.forward(request, response);
		// 그 값을 유지하며 jsp에 전달하기 위해 포워딩 방식으로 전달
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		ServletContext context = getServletContext();
		String path = context.getRealPath("upload");
		String encType = "UTF-8";
		int sizeLimit = 20 * 1024 * 1024;
		MultipartRequest multi = new MultipartRequest(request, path, sizeLimit,
				encType, new DefaultFileRenamePolicy());
		String code = multi.getParameter("code");
		String name = multi.getParameter("name");
		int price = Integer.parseInt(multi.getParameter("price"));
		String description = multi.getParameter("description");
		String pictureUrl = multi.getFilesystemName("pictureUrl");
		if (pictureUrl == null) {
			pictureUrl = multi.getParameter("nonmakeImg");
		} // 이미지를 등록하지 않았다면, 파일명을 원래 사진의 파일명으로 지정
		ProductVO pVo = new ProductVO();
		pVo.setCode(Integer.parseInt(code));
		pVo.setName(name);
		pVo.setPrice(price);
		pVo.setDescription(description);
		pVo.setPictureUrl(pictureUrl);
		ProductDAO pDao = ProductDAO.getInstance();
		pDao.updateProduct(pVo);
		response.sendRedirect("productList.do");
	}

}
