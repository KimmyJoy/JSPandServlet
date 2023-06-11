package biz.rental;

import java.time.LocalDate;
import java.util.Date;

public class RentalVO {

	private int no;
	private String id;
	private String isbn;
	private String title;
	private Date rentdate;
	private Date duedate;
//	private String renewdate;
//	private String overdewdate;
//	private String latefee;
//	private int is_rented;
	

	public RentalVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
	public RentalVO(int no, String id, String isbn, String title, Date rentdate, Date duedate) {
		super();
		this.no = no;
		this.id = id;
		this.isbn = isbn;
		this.title = title;
		this.rentdate = rentdate;
		this.duedate = duedate;
	}



	public int getNo() {
		return no;
	}
	
	public void setNo(int no) {
		this.no = no;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getIsbn() {
		return isbn;
	}
	
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}

	public Date getRentdate() {
		return rentdate;
	}

	public void setRentdate(Date rentdate) {
		this.rentdate = rentdate;
	}

	public Date getDuedate() {
		return duedate;
	}

	public void setDuedate(Date duedate) {
		this.duedate = duedate;
	}
	
//	public int getDaeyeo() {
//		return daeyeo;
//	}
//
//	public void setDaeyeo(int daeyeo) {
//		this.daeyeo = daeyeo;
//	}



	@Override
	public String toString() {
		return "RentalVO [no=" + no + ", id=" + id + ", isbn=" + isbn + ", title=" + title + ", rentdate=" + rentdate
				+ ", duedate=" + duedate + "]";
	}

}
