package biz.rental;

public class RentalVO {

	private int no;
	private String id;
	private String isbn;
	private String title;
	private String rentdate;
	private String returndate;
//	private String renewdate;
//	private String overdewdate;
//	private String latefee;
	private int daeyeo;
	

	public RentalVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
	public RentalVO(int no, String id, String isbn, String title, String rentdate, String returndate, int daeyeo) {
		super();
		this.no = no;
		this.id = id;
		this.isbn = isbn;
		this.title = title;
		this.rentdate = rentdate;
		this.returndate = returndate;
		this.daeyeo = daeyeo;
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

	public String getRentdate() {
		return rentdate;
	}

	public void setRentdate(String rentdate) {
		this.rentdate = rentdate;
	}

	public String getReturndate() {
		return returndate;
	}

	public void setReturndate(String returndate) {
		this.returndate = returndate;
	}
	
	public int getDaeyeo() {
		return daeyeo;
	}

	public void setDaeyeo(int daeyeo) {
		this.daeyeo = daeyeo;
	}



	@Override
	public String toString() {
		return "RentalVO [no=" + no + ", id=" + id + ", isbn=" + isbn + ", title=" + title + ", rentdate=" + rentdate
				+ ", returndate=" + returndate + ", daeyeo=" + daeyeo + "]";
	}

}
