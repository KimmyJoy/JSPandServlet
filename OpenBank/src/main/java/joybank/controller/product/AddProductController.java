package joybank.controller.product;

import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import biz.product.DepositProductVO;
import biz.product.SavingProductVO;
import biz.product.service.ProductService;
import joybank.controller.Controller;

public class AddProductController implements Controller {

    private ProductService productService = new ProductService();

    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
        String p_type = request.getParameter("p_type");

        if ("saving".equals(p_type)) {
            SavingProductVO product = createSavingProduct(request);
            boolean success = productService.addSavingProduct(product);
            // JSON 응답 생성
            JSONObject jsonResponse = new JSONObject();
            try {
                jsonResponse.put("success", success);
                jsonResponse.put("message", success ? "상품이 성공적으로 등록되었습니다" : "상품 등록에 실패했습니다");
            } catch (Exception e) {
                e.printStackTrace();
            }

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            try (PrintWriter out = response.getWriter()) {
                out.print(jsonResponse.toString());
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if ("deposit".equals(p_type)) {
            DepositProductVO product = createDepositProduct(request);
            boolean success = productService.addDepositProduct(product);
            // JSON 응답 생성
            JSONObject jsonResponse = new JSONObject();
            try {
                jsonResponse.put("success", success);
                jsonResponse.put("message", success ? "상품이 성공적으로 등록되었습니다" : "상품 등록에 실패했습니다");
            } catch (Exception e) {
                e.printStackTrace();
            }

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            try (PrintWriter out = response.getWriter()) {
                out.print(jsonResponse.toString());
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            // 유효하지 않은 상품 유형일 경우에 대한 예외 처리 로직
        	 JSONObject jsonResponse = new JSONObject();
             try {
                 jsonResponse.put("success", false);
                 jsonResponse.put("message", "유효하지 않은 상품 유형입니다");
             } catch (Exception e) {
                 e.printStackTrace();
             }

             response.setContentType("application/json");
             response.setCharacterEncoding("UTF-8");
             try (PrintWriter out = response.getWriter()) {
                 out.print(jsonResponse.toString());
             } catch (Exception e) {
                 e.printStackTrace();
             }
        }

        return null;
    }

    private SavingProductVO createSavingProduct(HttpServletRequest request) {
        SavingProductVO product = new SavingProductVO();

        // 폼 데이터를 받아와 설정하기
        String p_nm = request.getParameter("p_nm");
        String p_type = request.getParameter("p_type");
        String p_rateStr = request.getParameter("p_rate");
        String p_min_depositStr = request.getParameter("p_min_deposit");
        String p_description = request.getParameter("p_description");
        String monthly_depositStr = request.getParameter("monthly_deposit");
        String maturity_dateStr = request.getParameter("maturity_date");

        // 형변환이 필요한 것들은 싸그리 형변환
        BigDecimal p_rate = new BigDecimal(p_rateStr);
        BigDecimal p_min_deposit = new BigDecimal(p_min_depositStr);
        BigDecimal monthly_deposit = new BigDecimal(monthly_depositStr);
        Date maturity_date = Date.valueOf(maturity_dateStr);
        // valueOf java.sql.Date에서 사용하는 방식 util에서는 안됨

        product.setP_nm(p_nm);
        product.setP_type(p_type);
        product.setP_rate(p_rate);
        product.setMin_deposit(p_min_deposit);
        product.setDescription(p_description);
        product.setMonthly_deposit(monthly_deposit);
        product.setMaturity_date(maturity_date);
        
        System.out.println(product+"saving");
        return product;
    }

    private DepositProductVO createDepositProduct(HttpServletRequest request) {
        DepositProductVO product = new DepositProductVO();

        // 폼 데이터를 받아와 설정하기
        String p_nm = request.getParameter("p_nm");
        String p_type = request.getParameter("p_type");
        String p_rateStr = request.getParameter("p_rate");
        String p_min_depositStr = request.getParameter("p_min_deposit");
        String p_description = request.getParameter("p_description");
        String p_d_termStr = request.getParameter("p_d_term");

        // 형변환용 코드
        BigDecimal p_rate = new BigDecimal(p_rateStr);
        BigDecimal p_min_deposit = new BigDecimal(p_min_depositStr);
        BigDecimal p_d_term = new BigDecimal(p_d_termStr);

        product.setP_nm(p_nm);
        product.setP_type(p_type);
        product.setP_rate(p_rate);
        product.setMin_deposit(p_min_deposit);
        product.setDescription(p_description);
        product.setP_d_term(p_d_term);

        System.out.println(product + "deposit");
        return product;
    }
}
