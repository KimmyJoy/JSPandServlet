package joybank.controller.product;

import java.math.BigDecimal;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.product.DepositProductVO;
import biz.product.ProductVO;
import biz.product.SavingProductVO;
import biz.product.service.ProductService;
import joybank.controller.Controller;

public class EditProductController implements Controller {
	 private ProductService productService;

	    public EditProductController() {
	        this.productService = new ProductService();
	    }
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		 String p_type = request.getParameter("p_type");
	        ProductVO product;

	        // product type에 따라서 적절한 VO 객체를 생성
	        if (p_type.equals("saving")) {
	            product = new SavingProductVO();
	            ((SavingProductVO) product).setMonthly_deposit(new BigDecimal(request.getParameter("monthly_deposit")));
	            ((SavingProductVO) product).setMaturity_date(Date.valueOf(request.getParameter("maturity_date")));
	        } else if (p_type.equals("deposit")) {
	            product = new DepositProductVO();
	            ((DepositProductVO) product).setP_d_term(new BigDecimal(request.getParameter("p_d_term")));
	        } else {
	            throw new IllegalArgumentException("Invalid product type: " + p_type);
	        }

	        product.setP_cd(request.getParameter("p_cd"));
	        product.setP_nm(request.getParameter("p_nm"));
	        product.setP_rate(new BigDecimal(request.getParameter("p_rate")));
	        product.setMin_deposit(new BigDecimal(request.getParameter("min_deposit")));
	        product.setDescription(request.getParameter("description"));

	        productService.updateProduct(product);

	        return "/admin.do";
	    }
	}
