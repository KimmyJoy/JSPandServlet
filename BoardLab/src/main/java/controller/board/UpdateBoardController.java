package controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.board.BoardDAO;
import biz.board.BoardVO;
import controller.Controller;
//객체 지향 사고를 키우는 것이 중요. 이게 잘되면 반복 작업이 는다
public class UpdateBoardController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		String title = request.getParameter("title");
		String seq = request.getParameter("seq");
		String content = request.getParameter("content");
		String hit = request.getParameter("hit");
		
		BoardVO vo = new BoardVO();
		vo.setTitle(title);
		vo.setContent(content);
		vo.setSeq(Integer.parseInt(seq));
		vo.setHit(Integer.parseInt(hit));
		
		
		BoardDAO dao = new BoardDAO();
		dao.updateBoard(vo);
		
//		request.setAttribute("board", dao);
		
		return "getBoardList.do";//수정하고 리스트 화면으로 넘어갈 수 있게 하는 것)
	}

}
