package joybank.controller.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import biz.product.ProductVO;
import biz.product.service.ProductService;
import joybank.controller.Controller;

public class GetProductListController implements Controller {

    private ProductService productService = new ProductService();

    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
    	List<ProductVO> productList = productService.getAllProducts();
        
        request.setAttribute("productList", productList);
        System.out.println(productList);
        return "/product.jsp";
    }
}
        /*List<ProductVO> productList = productService.getAllProducts();

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        JSONArray jsonArray = new JSONArray();
        for (ProductVO product : productList) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("p_cd", product.getP_cd());
            jsonObject.put("p_nm", product.getP_nm());
            jsonObject.put("p_type", product.getP_type());
            jsonObject.put("p_rate", product.getP_rate());
            jsonObject.put("p_min_deposit", product.getMin_deposit());
            jsonObject.put("p_description", product.getDescription());

            if (product instanceof SavingProductVO) {
                SavingProductVO savingProduct = (SavingProductVO) product;
                jsonObject.put("monthly_deposit", savingProduct.getMonthly_deposit());
                jsonObject.put("maturity_date", savingProduct.getMaturity_date());
                jsonObject.put("p_d_term", "-");
            } else if (product instanceof DepositProductVO) {
                DepositProductVO depositProduct = (DepositProductVO) product;
                jsonObject.put("monthly_deposit", "-");
                jsonObject.put("maturity_date", "-");
                jsonObject.put("p_d_term", depositProduct.getP_d_term());
            }

            jsonArray.put(jsonObject);
        }

        try (PrintWriter out = response.getWriter()) {
            out.print(jsonArray.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}
	*/
	/*
	 * @Override public String handleRequest(HttpServletRequest request,
	 * HttpServletResponse response) {
	 * 
	 * // DAO를 사용하여 상품 리스트를 가져오는 로직을 추가하세요. List<ProductVO> productList =
	 * productService.getAllProducts(); // 상품 리스트를 request attribute에 저장합니다.
	 * request.setAttribute("productList", productList);
	 * 
	 * // product.jsp로 이동하는 뷰 이름을 반환합니다. return "/adminpage.do"; }
	 */

