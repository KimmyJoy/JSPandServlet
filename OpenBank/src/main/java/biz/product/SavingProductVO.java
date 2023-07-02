package biz.product;

import java.math.BigDecimal;
import java.sql.Date;

public class SavingProductVO extends ProductVO {

	private BigDecimal monthly_deposit; // 월 납입금 
	private Date maturity_date; //만기일

	public SavingProductVO() { 
		
	super(); 
	
	}

	public SavingProductVO(String p_cd, String p_nm, String p_type, BigDecimal p_rate, BigDecimal p_min_deposit,
			String p_description, BigDecimal monthly_deposit, Date maturity_date) {
		super(p_cd, p_nm, p_type, p_rate, p_min_deposit, p_description);
		this.maturity_date = maturity_date;
		this.monthly_deposit = monthly_deposit;
	}

	public BigDecimal getMonthly_deposit() {
		return monthly_deposit;
	}

	public void setMonthly_deposit(BigDecimal monthly_deposit) {
		this.monthly_deposit = monthly_deposit;
	}

	public Date getMaturity_date() {
		return maturity_date;
	}

	public void setMaturity_date(Date maturity_date) {
		this.maturity_date = maturity_date;
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
		return "SavingProductVO [monthly_deposit=" + monthly_deposit + ", maturity_date=" + maturity_date
				+ ", ProductVO=" + super.toString() + "]";
	}

}
