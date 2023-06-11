package biz.rental;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.time.LocalDate;
import java.util.Date;
import biz.common.ConnectionFactory;

public class RentalDAO {

	public void returnBook(RentalVO rent) {
		StringBuilder sql = new StringBuilder();
		sql.append("delete from T_Rent WHERE UserID = ? AND BookISBN = ? ");

		int cnt = 0;
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			
			pstmt.setString(1, rent.getId());
			pstmt.setString(2, rent.getIsbn());

			cnt = pstmt.executeUpdate();// 종료하는건 쓸필요 없음...자동종료 메소드를 호출하니까

		} catch (Exception e) {
			e.printStackTrace();
		}
		if(cnt != 0) {
			updateIs_rented(rent.getIsbn(), 1);
		}
	}

	
	// 대여시 북테이블의 대여 여부 업데이트 메소드
	public void updateIs_rented(String isbn, int a) {
		StringBuilder sql = new StringBuilder();
		sql.append("UPDATE T_Book SET is_rented = ? WHERE BookISBN = ?");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			
			pstmt.setInt(1, a);
			pstmt.setString(2, isbn);
//			int cnt = 
			pstmt.executeUpdate();// 종료하는건 쓸필요 없음...자동종료 메소드를 호출하니까
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void insertRent(RentalVO rent) {

		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO T_Rent(RentID, UserID, BookISBN, Title, RentalDate, ReturnDate) ");
		sql.append("VALUES(seq_RentID.nextval, ?, ?, ?, SYSDATE, SYSDATE + INTERVAL '14' DAY) ");

		int cnt = 0;
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			
			pstmt.setString(1, rent.getId());
			pstmt.setString(2, rent.getIsbn());
			pstmt.setString(3, rent.getTitle());

			cnt = pstmt.executeUpdate();// 종료하는건 쓸필요 없음...자동종료 메소드를 호출하니까
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(cnt != 0) {
			updateIs_rented(rent.getIsbn(), 0);
		}
	}

	public List<RentalVO> selectAll() {

		List<RentalVO> rentList = new ArrayList<RentalVO>();// 보드 vo를 감싸안아줄 list가 필요함

		// String sql = "select * from t_board";//연월일시분초가 다 나오므로 이게 아니고 다른 형태로 해야 함
		StringBuilder sql = new StringBuilder();
		 sql.append("SELECT RentID, UserID, BookISBN, Title, RentalDate, ReturnDate ");
		    sql.append("FROM T_Rent ");
		    sql.append("ORDER BY RentalDate DESC");

		try (
				// 1. 접속개체를 얻어와야 함
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {

			// 익스큐트 쿼리
			ResultSet rs = pstmt.executeQuery();// 리턴타입이 rsultset임

			while (rs.next()) {
				 int rentID = rs.getInt("RentID");
		            String userID = rs.getString("UserID");
		            String bookISBN = rs.getString("BookISBN");
		            String title = rs.getString("Title");
		            Date rentalDate = rs.getDate("RentalDate");
		            Date duedate = rs.getDate("duedate");

				RentalVO rent = new RentalVO(rentID, userID, bookISBN, title, rentalDate, duedate);// 매개변수가진걸 boardvo에 만들어뒀었으므로....가져오면 됨
				/*
				 * 위가 싫으면 이렇게 하면 됨 BookVO board = new BookVO board.setNO(no);
				 * board.setTitle(title); board.setwriter(writer); board.setregDate(regDate);
				 */
//				System.out.println(board);
				rentList.add(rent);// 애드해야함...

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return rentList; // 보드 vo를 감싸안을 애를 만들고 리턴해줘야함...
	}
	
	public List<RentalVO> selectId(String idd) {

		List<RentalVO> rentList = new ArrayList<>();// 보드 vo를 감싸안아줄 list가 필요함

		// String sql = "select * from t_board";//연월일시분초가 다 나오므로 이게 아니고 다른 형태로 해야 함
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * FROM rent_table WHERE user_id = ? ");
		// 가장최근순으로 하기 위해

		try (
				// 1. 접속개체를 얻어와야 함
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {

			pstmt.setString(1, idd);
			
			// 익스큐트 쿼리
			ResultSet rs = pstmt.executeQuery();// 리턴타입이 rsultset임

			while (rs.next()) {
				int no = rs.getInt("no");
				String isbn = rs.getString("isbn");// 넘버 컬럼에 있는 int를 가져오면 됨 각각의 컬럼형태로 만들어야함
				String id = rs.getString("id");
				String title = rs.getString("title");
				Date rentDate = rs.getDate("rentdate");
				Date dueDate = rs.getDate("duedate");
				
				RentalVO rent = new RentalVO(no, id, isbn, title, rentDate, dueDate);// 매개변수가진걸 boardvo에 만들어뒀었으므로....가져오면 됨
				/*
				 * 위가 싫으면 이렇게 하면 됨 BookVO board = new BookVO board.setNO(no);
				 * board.setTitle(title); board.setwriter(writer); board.setregDate(regDate);
				 */
//				System.out.println(board);
				rentList.add(rent);// 애드해야함...

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return rentList; // 보드 vo를 감싸안을 애를 만들고 리턴해줘야함...
	}
	
}
