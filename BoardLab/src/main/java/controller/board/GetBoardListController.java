package controller.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.board.BoardDAO;
import biz.board.BoardVO;
import controller.Controller;

public class GetBoardListController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		// 이 친구에게 필요한 것은 어떤 리퀘스트를 받아 db에 저장하는 것이 아니기 때문에
		 BoardVO vo = new BoardVO();
		 BoardDAO dao = new BoardDAO();
		 List<BoardVO> boardList = dao.getBoardList(vo);
		 request.setAttribute("boardList", boardList);
		 //view 한테 넘겨줘야 함
		//소프트웨어의 결합도와 응집도는....결합도는 낮추고 응집도는 올려야하는데 만약 이처럼 직접 부르면(결합시키면) 좋지 않음
		 return "getBoardList.jsp";
	}
	
}
