package joybank.controller.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.product.service.ProductService;
import joybank.controller.Controller;

public class DeleteProductController implements Controller {
    private ProductService productService;

    public DeleteProductController() {
        this.productService = new ProductService();
    }

    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
        String p_cd = request.getParameter("p_cd");

        productService.deleteProduct(p_cd);

        return "/adminpage.do";
    }
}