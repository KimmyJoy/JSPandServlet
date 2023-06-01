package controller.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.board.BoardDAO;
import biz.board.BoardVO;
import controller.Controller;

public class SearchBoardController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		//title 값을 받아줘야함
		String writer = request.getParameter("writer");
		
		BoardVO vo = new BoardVO();
		//시퀀스를 가진 vo이고
		vo.setWriter(writer);
		
		BoardDAO dao = new BoardDAO();
		List<BoardVO> boardList = dao.searchBoardList(vo);//보드 dao에서 서치보드리스트 메소드를 만들어야함
		//시퀀스로 찾아온 애
		
		request.setAttribute("boardList", boardList);
		return "getBoardList.jsp";//제일 깔끔한건 handler를 거치는 형태인데 지금은 바로 연결할 예정
	}

	
	
}
