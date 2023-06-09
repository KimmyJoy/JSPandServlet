package biz.book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import biz.common.ConnectionFactory;

public class BookDAO {

	public void insertBook(BookVO book) {// t_board로...하면 되는 것...

		// boardList.add(board); DB용으로 필요 없어짐 쿼리가 필요해짐 1.7버전의 try 캐치문을 쓸예정임
		StringBuilder sql = new StringBuilder();
		sql.append("insert into t_book(no, isbn, title, writer, publisher, is_rented) "); // no는 nextval로 이루어졌음...reg date는 이미 디폴을
		sql.append(" values(seq_t_book_no.nextval, ?, ?, ?, ?) ");// 내용이 어떻게 적힐지 모르는 변수는 ?임 이야아아앙... 이변수값은 board 변수가 알고 있음

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, book.getIsbn());
			pstmt.setString(2, book.getTitle());
			pstmt.setString(3, book.getWriter());
			pstmt.setString(4, book.getPublisher());
			pstmt.setInt(5, book.getIs_rented());

			pstmt.executeUpdate();// 종료하는건 쓸필요 없음...자동종료 메소드를 호출하니까

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public List<BookVO> selectAllbook() {

		List<BookVO> bookList = new ArrayList<>();// 보드 vo를 감싸안아줄 list가 필요함

		// String sql = "select * from t_board";//연월일시분초가 다 나오므로 이게 아니고 다른 형태로 해야 함
		StringBuilder sql = new StringBuilder();
		sql.append("select no, isbn, title, writer, publisher, is_rented ");
		sql.append(" from t_book ");
		sql.append(" order by title desc ");// 도서명 순으로 정령

		try (
				// 1. 접속개체를 얻어와야 함
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {

			// 익스큐트 쿼리
			ResultSet rs = pstmt.executeQuery();// 리턴타입이 rsultset임

			while (rs.next()) {
				int no 	= rs.getInt("no");//넘버 컬럼에 있는 int를 가져오면 됨 각각의 컬럼형태로 만들어야함
				String isbn = rs.getString("isbn");// 넘버 컬럼에 있는 int를 가져오면 됨 각각의 컬럼형태로 만들어야함
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				String publisher = rs.getString("publisher");
				int is_rented = rs.getInt("is_rented"); // 여기서 숫자를 쓸 수 있음...4번째 컬럼을 가져오라고 하려면 rs.getString(4)라고 해도 됨

				BookVO book = new BookVO(no, isbn, title, writer, publisher, is_rented);// 매개변수가진걸 boardvo에 만들어뒀었으므로....가져오면 됨
				/*
				 * 위가 싫으면 이렇게 하면 됨 BookVO board = new BookVO board.setNO(no);
				 * board.setTitle(title); board.setwriter(writer); board.setregDate(regDate);
				 */
//				System.out.println(board);
				bookList.add(book);// 애드해야함...

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return bookList; // 보드 vo를 감싸안을 애를 만들고 리턴해줘야함...
	}

	public BookVO selectByIsbn(String isbnno) {// isbn으로 조회

		BookVO book = null;

		StringBuilder sql = new StringBuilder();
		sql.append("select no, isbn, title, writer, publisher, is_rented ");
		sql.append(" from t_book ");
		sql.append(" where isbn = ? ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {

			pstmt.setString(1, isbnno);

			ResultSet rs = pstmt.executeQuery();// 최대 한줄이라 next가 필요 없을 것

			if (rs.next()) {// true면...

				int no = rs.getInt("no");
				String isbn = rs.getString("isbn");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				String publisher = rs.getString("publisher");
				int is_rented = rs.getInt("is_rented");

				book = new BookVO(no, isbn, title, writer, publisher, is_rented);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return book;// if를 만족하지 않으면 null값일 것
	}

	public BookVO selectByTitle(String titlef) {// 도서 검색용

		BookVO book = null;

		StringBuilder sql = new StringBuilder();
		sql.append("select no, isbn, title, writer, publisher, is_rented ");
		sql.append(" from book_board ");
		sql.append(" where instr(title, ?) !=0");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {

			pstmt.setString(1, titlef);

			ResultSet rs = pstmt.executeQuery();// 최대 한줄이라 next가 필요 없을 것

			if (rs.next()) {// true면...
				int no = rs.getInt("no");
				String isbn = rs.getString("isbn");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				String publisher = rs.getString("publisher");
				int is_rented = rs.getInt("is_rented");

				book = new BookVO(no, isbn, title, writer, publisher, is_rented);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return book;// if를 만족하지 않으면 null값일 것
	}

	public BookVO selectByWriter(String writerf) {// 저자 검색용

		BookVO book = null;

		StringBuilder sql = new StringBuilder();
		sql.append("select no, isbn, title, writer, publisher, is_rented ");
		sql.append(" from book_board ");
		sql.append(" where instr(writer, ?) !=0");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			) {

			pstmt.setString(1, writerf);

			ResultSet rs = pstmt.executeQuery();// 최대 한줄이라 next가 필요 없을 것

			if (rs.next()) {// true면...
				int no = rs.getInt("no");
				String isbn = rs.getString("isbn");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				String publisher = rs.getString("publisher");
				int is_rented = rs.getInt("is_rented");

				book = new BookVO(no, isbn, title, writer, publisher, is_rented);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return book;// if를 만족하지 않으면 null값일 것
	}

	public boolean selectByIssbn(String isb) {// isb 내용 확인용 boolean으로 하면 int로 받는거보다 훨씬 행복해진다...교체하려면 다 교체해야함!!!!!

		StringBuilder sql = new StringBuilder();
		sql.append("select instr(isbn, ?) ");// instr 때문에 전부 입력받아야함....그리고 애초에 등록이라 다 입력해야함!!
		sql.append(" from book_board ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			) {

			pstmt.setString(1, isb);

			ResultSet rs = pstmt.executeQuery();// 최대 한줄이라 next가 필요 없을 것

			while (rs.next()) {
				if (rs.getInt(1) != 0) {
					return true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;// if를 만족하지 않으면 null값일 것

	}
	//는 안되네...
	public void deleteBook(String isbn) {
		
		StringBuilder sql = new StringBuilder();
		sql.append("delete ");
		sql.append(" from book_board ");
		sql.append(" where isbn = ? ");
		
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			) {
			
			pstmt.setString(1, isbn);	
			pstmt.executeUpdate();
		
//		if(cnt == 0) {
//			return true;
//		}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
//		return false;
	}
	
}
