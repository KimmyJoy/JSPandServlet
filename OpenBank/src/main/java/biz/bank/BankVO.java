package biz.bank;

public class BankVO {

	private String bank_cd;
	private String bank_nm;
	
	
	public BankVO() {
		
	}
	
	public BankVO(String bank_cd, String bank_nm) {
		super();
		this.bank_cd = bank_cd;
		this.bank_nm = bank_nm;
	}

	public String getBank_cd() {
		return bank_cd;
	}

	public void setBank_cd(String bank_cd) {
		this.bank_cd = bank_cd;
	}

	public String getBank_nm() {
		return bank_nm;
	}

	public void setBank_nm(String bank_nm) {
		this.bank_nm = bank_nm;
	}

	@Override
	public String toString() {
		return "BankVO [bank_cd=" + bank_cd + ", bank_nm=" + bank_nm + "]";
	}
	
	
}
