package biz.account;

import java.util.Date;

public class SavingAccountVO {

	private String bank_cd;
	private String acc_no;
	private String u_id;
	private String acc_nm;
	private String acc_pw;
	private long acc_bal;
	private Date acc_op_date;
	private double rate;
	private String acc_stat;
	
	
	public SavingAccountVO() {
		
	}
	
	
	public SavingAccountVO(String bank_cd, String acc_no, String u_id, String acc_nm, String acc_pw, long acc_bal,
			Date acc_op_date, double rate, String acc_stat) {
		super();
		this.bank_cd = bank_cd;
		this.acc_no = acc_no;
		this.u_id = u_id;
		this.acc_nm = acc_nm;
		this.acc_pw = acc_pw;
		this.acc_bal = acc_bal;
		this.acc_op_date = acc_op_date;
		this.rate = rate;
		this.acc_stat = acc_stat;
	}


	public String getAcc_no() {
		return acc_no;
	}
	public void setAcc_no(String acc_no) {
		this.acc_no = acc_no;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getBank_cd() {
		return bank_cd;
	}
	public void setBank_cd(String bank_cd) {
		this.bank_cd = bank_cd;
	}
	public String getAcc_nm() {
		return acc_nm;
	}
	public void setAcc_nm(String acc_nm) {
		this.acc_nm = acc_nm;
	}
	public String getAcc_pw() {
		return acc_pw;
	}
	public void setAcc_pw(String acc_pw) {
		this.acc_pw = acc_pw;
	}
	public long getAcc_bal() {
		return acc_bal;
	}
	public void setAcc_bal(long acc_bal) {
		this.acc_bal = acc_bal;
	}
	
	public Date getAcc_op_date() {
		return acc_op_date;
	}

	public void setAcc_op_date(Date acc_op_date) {
		this.acc_op_date = acc_op_date;
	}


	public double getRate() {
		return rate;
	}

	public void setRate(double rate) {
		this.rate = rate;
	}


	public String getAcc_stat() {
		return acc_stat;
	}
	public void setAcc_stat(String acc_stat) {
		this.acc_stat = acc_stat;
	}


	@Override
	public String toString() {
		return "SavingAccountVO [bank_cd=" + bank_cd + ", acc_no=" + acc_no + ", u_id=" + u_id + ", acc_nm=" + acc_nm
				+ ", acc_pw=" + acc_pw + ", acc_bal=" + acc_bal + ", acc_op_date=" + acc_op_date + ", rate=" + rate
				+ ", acc_stat=" + acc_stat + "]";
	}
	
	
}
