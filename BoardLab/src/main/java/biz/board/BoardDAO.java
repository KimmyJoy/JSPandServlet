package biz.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import biz.common.JDBCUtil;

public class BoardDAO {

	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;
	
	private static String BOARD_INSERT =
			"insert into board(seq, title, writer, content, hit) values"+"((select nvl(max(seq),0)+1 from board), ?, ?, ?, ?)";
		//null일 경우에 1을 해서
	private static String BOARD_LIST = "select * from board";//모든 보드 리스트를 리턴받는 구조
	private static String BOARD_UPDATE = 
			"update board set title=?, content=?, hit=? where seq=?";
	private static String BOARD_DELETE = "delete board where seq=?";
	private static String BOARD_GET = "select * from board where seq=?";
	//dao에서 하는 일이 뭐지??? => 사용자를 조회하고 검색해서 삭제 해야함 그럼 userdao에도 똑같이 들어가야함?
			//db에 들어가는 dao는 거의 대동소이함 그렇기 때문에 전체적인 흐름을 알아야한다
	private static String BOARD_SEARCH = "select * from board where writer=?";
	
	public void insertBoard(BoardVO vo) {
		//여기서 날아오는 vo는 table의 record 값을 가지고 있음
		try {
			//db에 날려줄 sql 쿼리문을 만들고 있는 것임
			//1. connection 가져오기
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_INSERT);
			//2. vo를 가지고 ??? 되었던 부분들을 채워주는 것임 
			stmt.setString(1, vo.getTitle());//=> 첫번째 물음표에는(title), title을 빼오라는 것 맨마지막 번+1을 한 것임
			stmt.setString(2, vo.getWriter());
			stmt.setString(3, vo.getContent());
			stmt.setInt(4, vo.getHit());//이값은 추가되면 추가해야함
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	//db를 구축하는 이유 : 우리가 원하는 데이터를 뽑기 위함임
	/*
	 * 1. db 커넥션 2. 쿼리 날리고 3. rs 돌면서 추가 ~> 이런 흐름을 잘 알아야함
	 */
	public List<BoardVO> getBoardList(BoardVO vo){
		List<BoardVO> boardList = new ArrayList<BoardVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_LIST);
			rs = stmt.executeQuery();
			//rs에는 테이블 여러개의 레코드가 다 들어가 있는 것이고
			while(rs.next()) {
				BoardVO board = new BoardVO();
				//그 중 첫번째 것에서 첫번째 것을 해서 보드시퀀스로 가지고 온 것?
				board.setSeq(rs.getInt("SEQ"));
				board.setTitle(rs.getString("TITLE"));
				board.setWriter(rs.getString("WRITER"));
				board.setContent(rs.getString("CONTENT"));
				board.setRegDate(rs.getDate("REGDATE"));
				board.setHit(rs.getInt("HIT"));
				//보드 타입화 시킨 것을 list에 집어 넣어줘야함
				boardList.add(board);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn); 
		}
		return boardList;
	}
	
	public void updateBoard(BoardVO vo) {
		//여기서 날아오는 vo는 table의 record 값을 가지고 있음
		try {
			//db에 날려줄 sql 쿼리문을 만들고 있는 것임
			//1. connection 가져오기
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_UPDATE);
			//2. vo를 가지고 ??? 되었던 부분들을 채워주는 것임 
			stmt.setString(1, vo.getTitle());//=> 첫번째 물음표에는(title), title을 빼오라는 것 맨마지막 번+1을 한 것임
			stmt.setString(2, vo.getContent());
			stmt.setInt(3, vo.getHit());
			stmt.setInt(4, vo.getSeq());
			stmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	
	public void deleteBoard(BoardVO vo) {
		//여기서 날아오는 vo는 table의 record 값을 가지고 있음
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_DELETE);
			stmt.setInt(1, vo.getSeq());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	
	
	public BoardVO getBoard(BoardVO vo) {//리턴값이 boardVO
			BoardVO board = null;
		try {
//	         조회수 증가
//			String updateQuery = "UPDATE board SET hit = hit + 1 WHERE seq = ?";
//			PreparedStatement updateStmt = conn.prepareStatement(updateQuery);
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_GET);
			stmt.setInt(1, vo.getSeq());
			rs = stmt.executeQuery();
			
			
			if(rs.next()) {
				board = new BoardVO();
				board.setSeq(rs.getInt("SEQ"));
				board.setTitle(rs.getString("TITLE"));
				board.setWriter(rs.getString("WRITER"));
				board.setContent(rs.getString("CONTENT"));
				board.setRegDate(rs.getDate("REGDATE"));
				board.setHit(rs.getInt("HIT")+1);//여기에 +1을 하면 히트수 증가가 해결이 된다 하지만 db에 적용이 안되므로 이건 멍청한 짓....타조 같은 짓...
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		updateBoard(board);
		return board;
	}
	
	public List<BoardVO> searchBoardList(BoardVO vo){
		List<BoardVO> boardList = new ArrayList<BoardVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_SEARCH);
			stmt.setString(1, vo.getWriter());
			rs = stmt.executeQuery();
			//rs에는 테이블 여러개의 레코드가 다 들어가 있는 것이고
			while(rs.next()) {
				BoardVO board = new BoardVO();
				//그 중 첫번째 것에서 첫번째 것을 해서 보드시퀀스로 가지고 온 것?
				board.setSeq(rs.getInt("SEQ"));
				board.setTitle(rs.getString("TITLE"));
				board.setWriter(rs.getString("WRITER"));
				board.setContent(rs.getString("CONTENT"));
				board.setRegDate(rs.getDate("REGDATE"));
				board.setHit(rs.getInt("HIT"));
				//보드 타입화 시킨 것을 list에 집어 넣어줘야함
				boardList.add(board);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn); 
		}
		return boardList;
	}
	
}
