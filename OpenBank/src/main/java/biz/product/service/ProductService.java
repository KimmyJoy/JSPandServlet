package biz.product.service;

import java.util.List;

import biz.product.DepositProductVO;
import biz.product.ProductDAO;
import biz.product.ProductVO;
import biz.product.SavingProductVO;

public class ProductService {

	private ProductDAO prod;

	public ProductService() {
		prod = new ProductDAO();
	}
	
	public boolean addSavingProduct(SavingProductVO product) {
		return prod.addSavingProduct(product);
	}

	public void updateProduct(ProductVO product) {
		prod.updateProduct(product);
	}
	
	public boolean addDepositProduct(DepositProductVO product) {
		return prod.addDepositProduct(product);
	}
	
	  public List<ProductVO> getSavingProducts() {
	        return prod.getAllSavingProducts();
	    }

	    public List<ProductVO> getDepositProducts() {
	        return prod.getAllDepositProducts();
	    }

	public void deleteProduct(String p_cd) {
		prod.deleteProduct(p_cd);
	}
}

