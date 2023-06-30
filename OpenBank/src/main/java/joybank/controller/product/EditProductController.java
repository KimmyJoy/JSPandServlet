package joybank.controller.product;

import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.product.ProductVO;
import biz.product.service.ProductService;
import joybank.controller.Controller;

public class EditProductController implements Controller {
	 private ProductService productService;

	    public EditProductController() {
	        this.productService = new ProductService();
	    }
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		 String viewPage = null;
		 
	        // action이라는 파라미터를 이용하여 어떤 동작인지 판별
	        String action = request.getParameter("action");

	        if (action.equals("updateProduct")) {
	            ProductVO product = new ProductVO();
	            
	            // HttpServletRequest 객체를 이용해 수정된 상품 정보를 가져옴
	            product.setP_cd(request.getParameter("p_cd"));
	            product.setP_nm(request.getParameter("p_nm"));
	            product.setP_type(request.getParameter("p_type"));
	            product.setP_rate(new BigDecimal(request.getParameter("p_rate")));
	            product.setMin_deposit(new BigDecimal(request.getParameter("min_deposit")));
	            product.setDescription(request.getParameter("description"));
	            
	            // ProductDAO의 updateProduct 메소드를 호출하여 상품 정보를 업데이트
	            productService.updateProduct(product);
	            
	            // 뷰 페이지를 지정
	            viewPage = "productUpdated.jsp";
	        }

	        return viewPage;
	    }

}
