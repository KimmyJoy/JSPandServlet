package joybank.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import joybank.common.ConnectionFactory;


public class UserDAO {
	
	public void insertUser(UserVO users) {// t_user로...하면 되는 것...

		// boardList.add(board); DB용으로 필요 없어짐 쿼리가 필요해짐 1.7버전의 try 캐치문을 쓸예정임
		StringBuilder sql = new StringBuilder();
		sql.append("insert into t_users(id, password, name, phonenum, email, role) "); // no는 nextval로 이루어져있고 trigger처리 하여 넣지 않아도 됨
		sql.append(" values(?, ?, ?, ?, ?, ?) ");// 내용이 어떻게 적힐지 모르는 변수는 ?임 이야아아앙... 이변수값은 board
																		// 변수가 알고 있음

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			int role = users.getRole_cd();
//			if (role == 0) {
//				role = "true";
//			}
			pstmt.setString(1, users.getU_id());
			pstmt.setString(2, users.getU_pw());
			pstmt.setString(3, users.getU_nm());
			pstmt.setString(4, users.getU_num());
			pstmt.setString(5, users.getU_identy());
			pstmt.setString(6, users.getU_email());
			pstmt.setString(7, users.getU_address());
			pstmt.setString(8, users.getU_sysjoin());
			pstmt.setString(9, users.getU_birth());

			pstmt.executeUpdate();// 종료하는건 쓸필요 없음...자동종료 메소드를 호출하니까

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public UserVO getUser(UserVO vo) {
		UserVO user = null;
		
		StringBuilder sql = new StringBuilder();
		sql.append("select* from t_users where id = ? and password = ?");
		
		try (Connection conn = new ConnectionFactory().getConnection();
			 PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPassword());
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				user = new UserVO();
				user.setId(rs.getString("ID"));
				user.setPassword(rs.getString("PASSWORD"));
				user.setName(rs.getString("NAME"));
				user.setPhonenum(rs.getString("PHONENUM"));
				user.setEmail(rs.getString("EMAIL"));
				user.setRole(rs.getString("ROLE"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return user;
	}
	
	
	public UserVO getuserByid(String iD) {// 특정 아이디 검색이 가능한 쿼리실행

		UserVO user = null;
		StringBuilder sql = new StringBuilder();
		sql.append("select id, password, name, phonenum, email, role ");
		sql.append(" from t_users ");
		sql.append(" where id= ? ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {

			System.out.println(iD);
			pstmt.setString(1, iD);

			ResultSet rs = pstmt.executeQuery();// 최대 한줄이라 while(rs.next())가 필요 없을 것

			if (rs.next()) {// true면...
				String id = rs.getString("id");
				String password = rs.getString("password");
				String name = rs.getString("name");
				String phonenum = rs.getString("phonenum");
				String email = rs.getString("email");
				String role = rs.getString("role");

				user = new UserVO(id, password, name, phonenum, email, role);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;// if를 만족하지 않으면 null값일 것
	}
	
	//0.회원가입/로그인1단계-ID 중복 검색하는 메소드.
			public boolean isDuplicatedId(String id) {
				
//				MemberVO mem = null;
				
				StringBuilder sql = new StringBuilder();
				sql.append("SELECT INSTR(ID, ?), ID FROM t_users ");
				
				try(
					Connection conn = new ConnectionFactory().getConnection();
					PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				) {
					
					pstmt.setString(1, id);
					ResultSet rs = pstmt.executeQuery();
					
					//쿼리를 실행하고 결과가 있으면
					while(rs.next()) {
						//입력받은 문자와 비교하고 같으면 true
						if(rs.getString("ID").equalsIgnoreCase(id))
							return true;
					}
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				//다르면 false 반환
				return false;
			}
	
	
	//0. 로그인2단계-ID&PW 둘다일치 확인하는 메소드.
			public boolean isEqauls(String id, String password) {
				
				StringBuilder sql = new StringBuilder();
				sql.append("SELECT * FROM t_users WHERE ID = ? AND PASSWORD = ? ");
				
				try(
					Connection conn = new ConnectionFactory().getConnection();
					PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				) {
					pstmt.setString(1, id);
					pstmt.setString(2, password);
					
					ResultSet rs = pstmt.executeQuery();
					//쿼리를 실행하고 정보가 둘 다 일치하면
					while(rs.next()) {
						if(rs.getString("ID").equalsIgnoreCase(id) && rs.getString("PASSWORD").equals(password))
							return true;
					}
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				//다르면 false 반환
				return false;
			}
	
	
	
	public List<UserVO> selectAllusers() {// 관리자에게 회원관리번호를 포함하여 출력하는 메소드

		List<UserVO> userList = new ArrayList<>();// 보드 vo를 감싸안아줄 list가 필요함

		// String sql = "select * from t_board";//연월일시분초가 다 ㄴ나오므로 이게 아니고 다른 형태로 해야 함
		StringBuilder sql = new StringBuilder();
		sql.append("select id, password, name, phonenum, email, role ");
		sql.append(" from t_users ");
		sql.append(" order by no desc ");// 가장최근순으로 하기 위해

		try (
				// 1. 접속개체를 얻어와야 함
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {

			// 익스큐트 쿼리
			ResultSet rs = pstmt.executeQuery();// 리턴타입이 rsultset임

			while (rs.next()) {
				String id = rs.getString("id");
				String password = rs.getString("password");
				String name = rs.getString("name");
				String phonenum = rs.getString("phonenum");
				String email = rs.getString("email");
				String role = rs.getString("role"); // 여기서 숫자를 쓸 수 있음...4번째 컬럼을 가져오라고 하려면 rs.getString(4)라고 해도 됨

				UserVO user = new UserVO(id, password, name, phonenum, email, role);// 매개변수가진걸 boardvo에
																								// 만들어뒀었으므로....가져오면 됨
				/*
				 * 위가 싫으면 이렇게 하면 됨 BookVO board = new BookVO board.setNO(no);
				 * board.setTitle(title); board.setwriter(writer); board.setregDate(regDate);
				 */
//				System.out.println(board);
				userList.add(user);// 애드해야함...

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return userList; // 보드 vo를 감싸안을 애를 만들고 리턴해줘야함...
	}
	
	
	public void deleteUser(String id) {

		StringBuilder sql = new StringBuilder();
		sql.append("delete ");// instr 때문에 전부 입력받아야함....그리고 애초에 등록이라 다 입력해야함!!
		sql.append(" from t_users ");
		sql.append(" where id = ? ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {

			pstmt.setString(1, id);
			pstmt.executeUpdate();

//		if(cnt == 0) {
//			return true;
//		}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
