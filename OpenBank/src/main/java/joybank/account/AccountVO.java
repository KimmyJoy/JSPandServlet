package joybank.account;

import java.util.Date;

public class AccountVO {

	String acc_no;
	String u_id;
	String pro_cd;
	String bank_cd;
	String acc_nm;
	int acc_pw;
	String acc_bal;
	Date acc_date;
	String acc_con;
	
	
	public AccountVO() {
		
	}
	
	public AccountVO(String acc_no, String u_id, String pro_cd, String bank_cd, String acc_nm, int acc_pw,
			String acc_bal, Date acc_date, String acc_con) {
		super();
		this.acc_no = acc_no;
		this.u_id = u_id;
		this.pro_cd = pro_cd;
		this.bank_cd = bank_cd;
		this.acc_nm = acc_nm;
		this.acc_pw = acc_pw;
		this.acc_bal = acc_bal;
		this.acc_date = acc_date;
		this.acc_con = acc_con;
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
	public String getPro_cd() {
		return pro_cd;
	}
	public void setPro_cd(String pro_cd) {
		this.pro_cd = pro_cd;
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
	public int getAcc_pw() {
		return acc_pw;
	}
	public void setAcc_pw(int acc_pw) {
		this.acc_pw = acc_pw;
	}
	public String getAcc_bal() {
		return acc_bal;
	}
	public void setAcc_bal(String acc_bal) {
		this.acc_bal = acc_bal;
	}
	public Date getAcc_date() {
		return acc_date;
	}
	public void setAcc_date(Date acc_date) {
		this.acc_date = acc_date;
	}
	public String getAcc_con() {
		return acc_con;
	}
	public void setAcc_con(String acc_con) {
		this.acc_con = acc_con;
	}
	
	@Override
	public String toString() {
		return "AccountVO [acc_no=" + acc_no + ", u_id=" + u_id + ", pro_cd=" + pro_cd + ", bank_cd=" + bank_cd
				+ ", acc_nm=" + acc_nm + ", acc_pw=" + acc_pw + ", acc_bal=" + acc_bal + ", acc_date=" + acc_date
				+ ", acc_con=" + acc_con + "]";
	}
	
}
