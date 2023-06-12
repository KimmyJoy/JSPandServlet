package controller.book;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.book.BookDAO;
import biz.book.BookVO;
import controller.all.Controller;

public class SearchbookController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
				String searchType = request.getParameter("searchType");
				String query = request.getParameter("query");
				// 검색 조건에 따라 적절한 DAO 메서드를 호출하여 검색 결과를 가져온다
				List<BookVO> bookList = null;
				BookDAO dao = new BookDAO();
				
				switch (searchType) {
					case "all":
						bookList = dao.searchallBook(query);
						break;
					case "title":
						bookList = dao.selectByTitle(query);
						break;
					case "author":
						bookList = dao.selectByWriter(query);
						break;
					case "publisher":
						bookList = dao.selectByPublisher(query);
						break;
					case "isbn":
						bookList = dao.selectByIsbn(query);
						break;
					default:
						// 예외 처리
						break;
				}
				
				// booklist.jsp로 검색 결과를 전달하기 위해 request 속성에 저장
				request.setAttribute("bookList", bookList);
				
		        return "./jsp/include/booklist.jsp";
		    }
		}