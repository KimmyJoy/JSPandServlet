package biz.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import joybank.common.ConnectionFactory;

	public class UserDAO {

		public void insertUser(UserVO users) throws Exception {

	        StringBuilder sql = new StringBuilder();
	        sql.append("insert into Userinfo(u_id, u_pw, u_nm, u_num, u_identy, u_email, u_add, u_role) ");
	        sql.append(" values(?, ?, ?, ?, ?, ?, ?, ?)");
	        //9
	        try (Connection conn = new ConnectionFactory().getConnection();
	             PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
	        	
	        	//숫자 다 적을 필요없이 알아서 늘어나게 하는 법....변수 지정해서 내부에서 ++하면 됨ㅠ후위라 바로 첫번째부터 ++해도 됨
	        	int loc = 1;
	            pstmt.setString(loc++, users.getU_id());
	            pstmt.setString(loc++, users.getU_pw());
	            pstmt.setString(loc++, users.getU_nm());
	            pstmt.setString(loc++, users.getU_num());
	            pstmt.setString(loc++, users.getU_identy());
	            pstmt.setString(loc++, users.getU_email());
	            pstmt.setString(loc++, users.getU_add());
	            pstmt.setInt(loc++, users.getU_role());

	            pstmt.executeUpdate();

	        } catch (Exception e) {

	        }
	    }


		  public void updateUser(UserVO user) throws Exception {
		        StringBuilder sql = new StringBuilder();
		        sql.append("update Userinfo set u_pw = ?, u_nm = ?, u_num = ?, u_identy = ?, u_email = ?, u_add = ?, sys_join = ?, u_stat = ?, u_role = ? where u_id = ?");

		        try (Connection conn = new ConnectionFactory().getConnection();
		             PreparedStatement pstmt = conn.prepareStatement(sql.toString())) {
		             
		        	int loc = 1;
		            pstmt.setString(loc++, user.getU_pw());
		            pstmt.setString(loc++, user.getU_nm());
		            pstmt.setString(loc++, user.getU_num());
		            pstmt.setString(loc++, user.getU_identy());
		            pstmt.setString(loc++, user.getU_email());
		            pstmt.setString(loc++, user.getU_add());
		            pstmt.setString(loc++, user.getU_sysjoin());
		            pstmt.setString(loc++, user.getU_stat());
		            pstmt.setInt(loc++, user.getU_role());
		            pstmt.setString(loc++, user.getU_id());

		            pstmt.executeUpdate();
		        } catch (Exception e) {
		            throw e;
		        }
		    }
	
		  
		public UserVO getUser(UserVO vo) {
	        UserVO user = null;

	        StringBuilder sql = new StringBuilder();
	        sql.append("select * from Userinfo where u_id = ? and u_pw = ?");

	        System.out.println("들어오셨나요?");
	        try (Connection conn = new ConnectionFactory().getConnection();
	             PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
	             
	            pstmt.setString(1, vo.getU_id());
	            pstmt.setString(2, vo.getU_pw());
	            
	            ResultSet rs = pstmt.executeQuery();
	            //그냥 가져온 데이터를 set 하는 것이라서 아래와 같은 방식이 오류를 조금 더 줄여줄 수 있고 코드가 직관적이됨
	            if(rs.next()) {
	            	 user = new UserVO(
	                         rs.getString("u_id"), 
	                         rs.getString("u_pw"), 
	                         rs.getString("u_nm"), 
	                         rs.getString("u_num"), 
	                         rs.getString("u_identy"), 
	                         rs.getString("u_email"), 
	                         rs.getString("u_add"), 
	                         rs.getString("sys_join"), 
	                         rs.getString("u_stat"), 
	                         rs.getInt("u_role"));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return user;
	    }
	
	
		/*
		 * public UserVO getuserByid(String iD) {// 특정 아이디 검색이 가능한 쿼리실행
		 * 
		 * UserVO user = null; StringBuilder sql = new StringBuilder();
		 * sql.append("select id, password, name, phonenum, email, role ");
		 * sql.append(" from t_users "); sql.append(" where id= ? ");
		 * 
		 * try (Connection conn = new ConnectionFactory().getConnection();
		 * PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
		 * 
		 * System.out.println(iD); pstmt.setString(1, iD);
		 * 
		 * ResultSet rs = pstmt.executeQuery();// 최대 한줄이라 while(rs.next())가 필요 없을 것
		 * 
		 * if (rs.next()) {// true면... String id = rs.getString("id"); String password =
		 * rs.getString("password"); String name = rs.getString("name"); String phonenum
		 * = rs.getString("phonenum"); String email = rs.getString("email"); String role
		 * = rs.getString("role");
		 * 
		 * user = new UserVO(id, password, name, phonenum, email, role); } } catch
		 * (Exception e) { e.printStackTrace(); } return user;// if를 만족하지 않으면 null값일 것 }
		 */
	
	//0.회원가입/로그인1단계-ID 중복 검색하는 메소드.
			public boolean isDuplicatedId(String id) {
				
				StringBuilder sql = new StringBuilder();
				sql.append("SELECT INSTR(U_ID, ?), ID FROM Userinfo ");
				
				try(
					Connection conn = new ConnectionFactory().getConnection();
					PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				) {
					
					pstmt.setString(1, id);
					ResultSet rs = pstmt.executeQuery();
					
					//쿼리를 실행하고 결과가 있으면
					while(rs.next()) {
						//입력받은 문자와 비교하고 같으면 true
						if(rs.getString("U_ID").equalsIgnoreCase(id))
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
				sql.append("SELECT * FROM Userinfo WHERE U_ID = ? AND U_PW = ? ");
				
				try(
					Connection conn = new ConnectionFactory().getConnection();
					PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				) {
					pstmt.setString(1, id);
					pstmt.setString(2, password);
					
					ResultSet rs = pstmt.executeQuery();
					 System.out.println("Query executed, checking results...");
					//쿼리를 실행하고 정보가 둘 다 일치하면
					while(rs.next()) {
						 String dbId = rs.getString("u_id");
					        String dbPw = rs.getString("u_pw");
					        System.out.println("DB ID: " + dbId + ", DB PW: " + dbPw);
						if(rs.getString("u_id").equalsIgnoreCase(id) && rs.getString("u_pw").equals(password))
							return true;
					}
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				//다르면 false 반환
				return false;
			}
	
	
			  public List<UserVO> getAllUsers() throws Exception {
			        List<UserVO> users = new ArrayList<>();
			        String sql = "select * from Userinfo";

			        try (Connection conn = new ConnectionFactory().getConnection();
			             PreparedStatement pstmt = conn.prepareStatement(sql);
			             ResultSet rs = pstmt.executeQuery()) {
			             
			            while(rs.next()) {
			                UserVO user = new UserVO();
			                user.setU_id(rs.getString("u_id"));
			                user.setU_pw(rs.getString("u_pw"));
			                user.setU_nm(rs.getString("u_nm"));
			                user.setU_num(rs.getString("u_num"));
			                user.setU_identy(rs.getString("u_identy"));
			                user.setU_email(rs.getString("u_email"));
			                user.setU_add(rs.getString("u_add"));
			                user.setU_sysjoin(rs.getString("sys_join"));
			                user.setU_stat(rs.getString("u_stat"));
			                user.setU_role(rs.getInt("u_role"));
			                users.add(user);
			            }
			        } catch (Exception e) {
			            throw e;
			        }
			        return users;
			    }
	
	
			  public void deleteUser(UserVO user) throws Exception {
			        StringBuilder sql = new StringBuilder();
			        sql.append("delete from UserInfo where u_id = ?");

			        try (Connection conn = new ConnectionFactory().getConnection();
			             PreparedStatement pstmt = conn.prepareStatement(sql.toString())) {
			             
			            pstmt.setString(1, user.getU_id());
			            pstmt.executeUpdate();
			        } catch (Exception e) {
			        }
			    }
	
}
