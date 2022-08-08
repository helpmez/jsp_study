package com.saeyan.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saeyan.dao.ProductDAO;
import com.saeyan.dto.ProductVO;


@WebServlet("/productList.do")
public class ProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		ProductDAO pDao = ProductDAO.getInstance();
		// 싱글톤
		// 상품 리스트를 출력해야하므로 상품 정보들을 불러낼 수 있는 클래스인 
		// DAO 클래스를 참조하는 객체 생성
		List<ProductVO> productList = pDao.selectAllProducts();
		// 객체를 통해 메서드를 실행하고 그 결과를 
		// ProductVO 클래스를 참조하는 객체에 저장
		request.setAttribute("productList", productList);
		// request 객체 속성에 productList 객체를 저장
		RequestDispatcher dispatcher = request
				.getRequestDispatcher("product/productList.jsp");
		dispatcher.forward(request, response);
		// 하고 그 값을 유지하기 위해 포워딩 방식으로 jsp에 보낸다
	}


	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	
	}

}
