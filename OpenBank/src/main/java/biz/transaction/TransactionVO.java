package biz.transaction;

import java.util.Date;

public class TransactionVO {

	private String trans_no;
	private String acc_no;
	private String send_bank_cd;
	private long trans_amount;
	private String recieve_bank_cd;
	private String reciever;
	private String trans_bal;
	private String trans_memo;
	private Date trans_date;
	private String trans_type;
	
	public TransactionVO() {
		
	}

	
	public TransactionVO(String trans_no, String acc_no, String send_bank_cd, long trans_amount, String recieve_bank_cd,
			String reciever, String trans_bal, String trans_memo, Date trans_date, String trans_type) {
		super();
		this.trans_no = trans_no;
		this.acc_no = acc_no;
		this.send_bank_cd = send_bank_cd;
		this.trans_amount = trans_amount;
		this.recieve_bank_cd = recieve_bank_cd;
		this.reciever = reciever;
		this.trans_bal = trans_bal;
		this.trans_memo = trans_memo;
		this.trans_date = trans_date;
		this.trans_type = trans_type;
	}



	public String getTrans_no() {
		return trans_no;
	}

	public void setTrans_no(String trans_no) {
		this.trans_no = trans_no;
	}

	public String getAcc_no() {
		return acc_no;
	}

	public void setAcc_no(String acc_no) {
		this.acc_no = acc_no;
	}

	public String getSend_bank_cd() {
		return send_bank_cd;
	}

	public void setSend_bank_cd(String send_bank_cd) {
		this.send_bank_cd = send_bank_cd;
	}

	public long getTrans_amount() {
		return trans_amount;
	}

	public void setTrans_amount(long trans_amount) {
		this.trans_amount = trans_amount;
	}

	public String getRecieve_bank_cd() {
		return recieve_bank_cd;
	}

	public void setRecieve_bank_cd(String recieve_bank_cd) {
		this.recieve_bank_cd = recieve_bank_cd;
	}

	public String getReciever() {
		return reciever;
	}

	public void setReciever(String reciever) {
		this.reciever = reciever;
	}

	public String getTrans_bal() {
		return trans_bal;
	}

	public void setTrans_bal(String trans_bal) {
		this.trans_bal = trans_bal;
	}

	public String getTrans_memo() {
		return trans_memo;
	}

	public void setTrans_memo(String trans_memo) {
		this.trans_memo = trans_memo;
	}

	public Date getTrans_date() {
		return trans_date;
	}

	public void setTrans_date(Date trans_date) {
		this.trans_date = trans_date;
	}


	public String getTrans_type() {
		return trans_type;
	}


	public void setTrans_type(String trans_type) {
		this.trans_type = trans_type;
	}
	
	
}
