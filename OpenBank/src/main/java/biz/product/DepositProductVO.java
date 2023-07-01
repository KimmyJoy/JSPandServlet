package biz.product;

import java.math.BigDecimal;
import java.sql.Date;

public class DepositProductVO extends ProductVO {

	private BigDecimal p_d_term;
	
	public DepositProductVO() {
		super();
	}

	public DepositProductVO(String p_cd, String p_nm, String p_type, BigDecimal p_rate, BigDecimal p_min_deposit,
			String p_description, BigDecimal p_d_term) {
		super(p_cd, p_nm, p_type, p_rate, p_min_deposit, p_description);
		this.p_d_term = p_d_term;
	}
	
	public BigDecimal getP_d_term() {
		return p_d_term;
	}

	public void setP_d_term(BigDecimal p_d_term) {
		this.p_d_term = p_d_term;
	}

	@Override
	public String toString() {
		return "DepositProductVO [p_d_term=" + p_d_term + ", ProductVO=" + super.toString() +"]";
	}
	
}
