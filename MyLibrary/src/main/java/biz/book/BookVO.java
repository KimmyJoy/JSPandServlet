package biz.book;

public class BookVO {
	private int no;
	private String isbn;
	private String title;
	private String writer;
	private String publisher;
	private int is_rented;
	
	public BookVO() {
		super();
	}
	
	public BookVO(int no, String isbn, String title, String writer, String publisher, int is_rented) {
		super();
		this.no = no;
		this.isbn = isbn;
		this.title = title;
		this.writer = writer;
		this.publisher = publisher;
		this.is_rented = is_rented;
	}


	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getIs_rented() {
		return is_rented;
	}

	public void setIs_rented(int is_rented) {
		this.is_rented = is_rented;
	}
	

	public String getPublisher() {
		return publisher;
	}
	
	
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	@Override
	public String toString() {
		return "BookVO [no=" + no + ", isbn=" + isbn + ", title=" + title + ", writer=" + writer + ", publisher="
				+ publisher + ", is_rented=" + is_rented + "]";
	}
	
}

