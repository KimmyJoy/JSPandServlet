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

	 public String getP_cd() {
	        return super.getP_cd();
	    }

	    public void setP_cd(String p_cd) {
	        super.setP_cd(p_cd);
	    }

	    public String getP_nm() {
	        return super.getP_nm();
	    }

	    public void setP_nm(String p_nm) {
	        super.setP_nm(p_nm);
	    }

	    public String getP_type() {
	        return super.getP_type();
	    }

	    public void setP_type(String p_type) {
	        super.setP_type(p_type);
	    }

	    public BigDecimal getP_rate() {
	        return super.getP_rate();
	    }

	    public void setP_rate(BigDecimal p_rate) {
	        super.setP_rate(p_rate);
	    }

	    public BigDecimal getP_min_deposit() {
	        return super.getMin_deposit();
	    }

	    public void setP_min_deposit(BigDecimal p_min_deposit) {
	        super.setMin_deposit(p_min_deposit);
	    }

	    public String getP_description() {
	        return super.getDescription();
	    }

	    public void setP_description(String p_description) {
	        super.setDescription(p_description);
	    }
	
	@Override
	public String toString() {
		return "DepositProductVO [p_d_term=" + p_d_term + ", ProductVO=" + super.toString() +"]";
	}
	
}
