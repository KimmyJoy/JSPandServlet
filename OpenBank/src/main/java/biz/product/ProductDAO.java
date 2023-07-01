package biz.product;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import joybank.common.ConnectionFactory;

public class ProductDAO {

	
	public void insertDepositProduct(DepositProductVO product) {
        	StringBuilder sql = new StringBuilder();
        	sql.append(" INSERT INTO product (p_cd, p_nm, p_type, p_rate, p_min_deposit, p_description, p_d_term) ");
        	sql.append(" VALUES ('PD' || TO_CHAR(product_seq.NEXTVAL), ?, ?, ?, ?, ?, ?) ");	 
        	//시퀀스에 pd 코드를 지정하기 위함
       int loc = 1;
        try (
        	 Connection conn = new ConnectionFactory().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql.toString())) {

            pstmt.setString(loc++, product.getP_nm());
            pstmt.setString(loc++, product.getP_type());
            pstmt.setBigDecimal(loc++, product.getP_rate());
            pstmt.setBigDecimal(loc++, product.getMin_deposit());
            pstmt.setString(loc++, product.getDescription());
            pstmt.setBigDecimal(loc++, product.getP_d_term());

            pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
	
	
	public void insertSavingProduct(SavingProductVO product) {
		        StringBuilder sql = new StringBuilder();
		        
		        sql.append(" INSERT INTO product (p_cd, p_nm, p_type, p_rate, p_min_deposit, p_description, monthly_deposit, maturity_date) ");
		        sql.append(" VALUES ('PD' || TO_CHAR(product_seq.NEXTVAL), ?, ?, ?, ?, ?, ?, ?) ");

		        try (
		         	 Connection conn = new ConnectionFactory().getConnection();
		             PreparedStatement pstmt = conn.prepareStatement(sql.toString())) {

		            pstmt.setString(1, product.getP_nm());
		            pstmt.setString(2, product.getP_type());
		            pstmt.setBigDecimal(3, product.getP_rate());
		            pstmt.setBigDecimal(4, product.getMin_deposit());
		            pstmt.setString(5, product.getDescription());
		            pstmt.setBigDecimal(6, product.getMonthly_deposit());
		            pstmt.setDate(7, new java.sql.Date(product.getMaturity_date().getTime()));
		            
		            pstmt.executeUpdate();

		        } catch (Exception e) {
		            e.printStackTrace();
		        }
		    }
	
	//임시 boolean 타입으로 변경
	public boolean addSavingProduct(SavingProductVO product) {
	    StringBuilder sql = new StringBuilder();
	    sql.append("INSERT INTO product (p_cd, p_nm, p_type, p_rate, p_min_deposit, p_description, monthly_deposit, maturity_date) ");
	    sql.append("VALUES ('PD' || TO_CHAR(product_seq.NEXTVAL), ?, ?, ?, ?, ?, ?, ?)");

	    try (Connection conn = new ConnectionFactory().getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql.toString())) {

	        pstmt.setString(1, product.getP_nm());
	        pstmt.setString(2, product.getP_type());
	        pstmt.setBigDecimal(3, product.getP_rate());
	        pstmt.setBigDecimal(4, product.getMin_deposit());
	        pstmt.setString(5, product.getDescription());
	        pstmt.setBigDecimal(6, product.getMonthly_deposit());
	        pstmt.setDate(7, new java.sql.Date(product.getMaturity_date().getTime()));

	        int affectedRows = pstmt.executeUpdate();
	        return affectedRows > 0; // 적어도 한 개 이상의 행이 영향을 받으면 true 반환

	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	
	
	public boolean addDepositProduct(DepositProductVO product) {
	    StringBuilder sql = new StringBuilder();
	    sql.append("INSERT INTO product (p_cd, p_nm, p_type, p_rate, p_min_deposit, p_description, p_d_term) ");
	    sql.append("VALUES ('PD' || TO_CHAR(product_seq.NEXTVAL), ?, ?, ?, ?, ?, ?)");

	    try (Connection conn = new ConnectionFactory().getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql.toString())) {

	        pstmt.setString(1, product.getP_nm());
	        pstmt.setString(2, product.getP_type());
	        pstmt.setBigDecimal(3, product.getP_rate());
	        pstmt.setBigDecimal(4, product.getMin_deposit());
	        pstmt.setString(5, product.getDescription());
	        pstmt.setBigDecimal(6, product.getP_d_term());

	        int affectedRows = pstmt.executeUpdate();
	        return affectedRows > 0; // 적어도 한 개 이상의 행이 영향을 받으면 true 반환

	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	
	//각각에 대응하는 boolean형 반환 메소드?
//	  public boolean addSavingProduct(SavingProductVO product) {
//		    try {
//		        // 상품 추가 로직 수행
//		        // ...
//
//		        return true; // 상품 추가 성공 시 true 반환
//		    } catch (Exception e) {
//		        e.printStackTrace();
//		        return false; // 상품 추가 실패 시 false 반환
//		    }
//		}
//	
	
	public List<ProductVO> getAllProducts() {
	    StringBuilder sql = new StringBuilder();
	    sql.append("SELECT * FROM product");
	    
	    List<ProductVO> productList = new ArrayList<>();

	    try (
	    	 Connection conn = new ConnectionFactory().getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql.toString())) {

	        ResultSet rs = pstmt.executeQuery();
	        while (rs.next()) {
	            String p_cd = rs.getString("p_cd");
	            String p_nm = rs.getString("p_nm");
	            String p_type = rs.getString("p_type");
	            BigDecimal p_rate = rs.getBigDecimal("p_rate");
	            BigDecimal p_min_deposit = rs.getBigDecimal("p_min_deposit");
	            String p_description = rs.getString("p_description");
	            BigDecimal monthly_deposit = rs.getBigDecimal("monthly_deposit");
	            Date maturity_date = rs.getDate("maturity_date");
	            BigDecimal p_d_term = rs.getBigDecimal("p_d_term");
	            
	            ProductVO product;
	            if ("saving".equals(p_type)) {
	                product = new SavingProductVO(p_cd, p_nm, p_type, p_rate, p_min_deposit, p_description, monthly_deposit, maturity_date);
	            } else {
	                product = new DepositProductVO(p_cd, p_nm, p_type, p_rate, p_min_deposit, p_description, p_d_term);
	            }
	            
	            productList.add(product);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return productList;
	}

	//상품 수정용
	  public void updateProduct(ProductVO product) {
		    StringBuilder sql = new StringBuilder();

		    if (product instanceof SavingProductVO) {
		        SavingProductVO savingProduct = (SavingProductVO) product;
		        sql.append("UPDATE product SET p_nm = ?, p_type = ?, p_rate = ?, p_min_deposit = ?, p_description = ?, monthly_deposit = ?, maturity_date = ? WHERE p_cd = ?");
		        int loc = 1;
		        try (Connection conn = new ConnectionFactory().getConnection();
		             PreparedStatement pstmt = conn.prepareStatement(sql.toString())) {

		            pstmt.setString(loc++, savingProduct.getP_nm());
		            pstmt.setString(loc++, savingProduct.getP_type());
		            pstmt.setBigDecimal(loc++, savingProduct.getP_rate());
		            pstmt.setBigDecimal(loc++, savingProduct.getMin_deposit());
		            pstmt.setString(loc++, savingProduct.getDescription());
		            pstmt.setBigDecimal(loc++, savingProduct.getMonthly_deposit());
		            pstmt.setDate(loc++, new java.sql.Date(savingProduct.getMaturity_date().getTime()));
		            pstmt.setString(loc++, savingProduct.getP_cd());

		            pstmt.executeUpdate();

		        } catch (Exception e) {
		            e.printStackTrace();
		        }
		    } else if (product instanceof DepositProductVO) {
		        DepositProductVO depositProduct = (DepositProductVO) product;
		        sql.append("UPDATE product SET p_nm = ?, p_type = ?, p_rate = ?, p_min_deposit = ?, p_description = ?, p_d_term = ? WHERE p_cd = ?");
		        int loc = 1; 
		        try (Connection conn = new ConnectionFactory().getConnection();
		             PreparedStatement pstmt = conn.prepareStatement(sql.toString())) {
		        	
		            pstmt.setString(loc++, depositProduct.getP_nm());
		            pstmt.setString(loc++, depositProduct.getP_type());
		            pstmt.setBigDecimal(loc++, depositProduct.getP_rate());
		            pstmt.setBigDecimal(loc++, depositProduct.getMin_deposit());
		            pstmt.setString(loc++, depositProduct.getDescription());
		            pstmt.setString(loc++, depositProduct.getP_cd());
		            pstmt.setBigDecimal(loc++, depositProduct.getP_d_term());
		            pstmt.executeUpdate();

		        } catch (Exception e) {
		            e.printStackTrace();
		        }
		    }
		}

	  
	  //상품 삭제(만료일만 삭제 가능, 가입된 사람이 있으면 삭제 불가)
	    public void deleteProduct(String p_cd) {
	        StringBuilder sql = new StringBuilder();
	        sql.append("DELETE FROM product WHERE p_cd = ?");

	        try (Connection conn = new ConnectionFactory().getConnection();
	             PreparedStatement pstmt = conn.prepareStatement(sql.toString())) {

	            pstmt.setString(1, p_cd);
	            pstmt.executeUpdate();

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	
	}
	
