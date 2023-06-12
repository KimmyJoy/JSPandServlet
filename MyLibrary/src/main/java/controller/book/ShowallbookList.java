package controller.book;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.book.BookDAO;
import biz.book.BookVO;
import controller.all.Controller;

public class ShowallbookList implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		BookDAO dao = new BookDAO();
		List<BookVO> bookList = dao.selectAllbook();
		//book list를 받아오기 위한 코드(get은 필요 없이 set만 필요함)
		request.setAttribute("bookList", bookList);
		
		return "./jsp/include/booklist.jsp";
	}
	
}
