package biz.product;

import java.math.BigDecimal;

public class ProductVO {

	private String p_cd; // Product ID
	private String p_nm; // Product Name
	private String p_type; // Product Type 
	private BigDecimal p_rate; // 이율
	private BigDecimal p_min_deposit; // 최소 이체금 
	private String p_description; //상품 설명

	public ProductVO() {

	}

	public ProductVO(String p_cd, String p_nm, String p_type, BigDecimal p_rate, BigDecimal p_min_deposit,
			String p_description) {
		super();
		this.p_cd = p_cd;
		this.p_nm = p_nm;
		this.p_type = p_type;
		this.p_rate = p_rate;
		this.p_min_deposit = p_min_deposit;
		this.p_description = p_description;
	}

	public String getP_cd() {
		return p_cd;
	}

	public void setP_cd(String p_cd) {
		this.p_cd = p_cd;
	}

	public String getP_nm() {
		return p_nm;
	}

	public void setP_nm(String p_nm) {
		this.p_nm = p_nm;
	}

	public String getP_type() {
		return p_type;
	}

	public void setP_type(String p_type) {
		this.p_type = p_type;
	}

	public BigDecimal getP_rate() {
		return p_rate;
	}

	public void setP_rate(BigDecimal p_rate) {
		this.p_rate = p_rate;
	}

	public BigDecimal getMin_deposit() {
		return p_min_deposit;
	}

	public void setMin_deposit(BigDecimal p_min_deposit) {
		this.p_min_deposit = p_min_deposit;
	}

	public String getDescription() {
		return p_description;
	}

	public void setDescription(String description) {
		this.p_description = description;
	}

	@Override
	public String toString() {
		return "ProductVO [p_cd=" + p_cd + ", p_nm=" + p_nm + ", p_type=" + p_type + ", p_rate=" + p_rate
				+ ", p_min_deposit=" + p_min_deposit + ", p_description=" + p_description + "]";
	}

}
