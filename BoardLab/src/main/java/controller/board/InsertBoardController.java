package controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.board.BoardDAO;
import biz.board.BoardVO;
import controller.Controller;

public class InsertBoardController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		
		BoardVO vo = new BoardVO();
		vo.setTitle(title);
		vo.setWriter(writer);
		vo.setContent(content);
		
		BoardDAO dao = new BoardDAO();
		dao.insertBoard(vo);
		
		// -> 요 줄까지는 내가 했던거랑 똑같았음...
		//로그인 하고 간 곳에서 게시판 리스트를 만들 예정임
		return "getBoardList.do";
	}

}
