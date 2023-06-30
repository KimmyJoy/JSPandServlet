package biz.product;

import java.math.BigDecimal;
import java.sql.Date;

public class SavingProductVO extends ProductVO {

	private BigDecimal monthly_deposit; // 월 납입금
	private Date maturity_date;         // 만기일
	
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

	@Override
	public String toString() {
		return "SavingProductVO [monthly_deposit=" + monthly_deposit + ", maturity_date=" + maturity_date + ", ProductVO=" + super.toString() + "]";
	}
	
}
