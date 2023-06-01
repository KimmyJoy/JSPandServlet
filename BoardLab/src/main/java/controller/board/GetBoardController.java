package controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.board.BoardDAO;
import biz.board.BoardVO;
import controller.Controller;

public class GetBoardController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		//seq 값을 받아줘야함
		String seq = request.getParameter("seq");
		
		BoardVO vo = new BoardVO();
		//시퀀스를 가진 vo이고
		vo.setSeq(Integer.parseInt(seq));
		
		BoardDAO dao = new BoardDAO();
		BoardVO board = dao.getBoard(vo);
		//시퀀스로 찾아온 애
		
		request.setAttribute("board", board);
		return "getBoard.jsp";//제일 깔끔한건 handler를 거치는 형태인데 지금은 바로 연결할 예정
	}

	
}
