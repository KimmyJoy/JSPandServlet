package controller.book;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.book.BookDAO;
import biz.book.BookVO;
import biz.rental.RentalDAO;
import biz.rental.RentalVO;
import biz.user.lib.UserVO;
import controller.all.Controller;

public class RentalController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		String isbn = request.getParameter("isbn");
		System.out.println(isbn+"제대로 들어왔나요?");
		BookDAO dao = new BookDAO();
		RentalDAO rentDao = new RentalDAO();
		
		if (session.getAttribute("loginUser") != null) {
	            // 로그인한 유저인 경우
            List<BookVO> bookList = dao.selectByIsbn(isbn);
            
            if (bookList != null && !bookList.isEmpty()) {
                BookVO book = bookList.get(0); // 첫 번째 도서 정보를 사용
            
            if (book.getIs_rented() == 1) {
                // 책이 존재하고 대여 가능한 상태인 경우
            	RentalVO rent = new RentalVO();
                rent.setId(((UserVO) session.getAttribute("loginUser")).getId());
                rent.setIsbn(book.getIsbn());
                rent.setTitle(book.getTitle());

                // 대여 처리
                rentDao.insertRent(rent);

                String query = request.getParameter("query");
                if (query == null) {
                    query = ""; // query가 null인 경우 빈 문자열로 대체
                }
                String searchType = request.getParameter("searchType");
                String redirectUrl = "redirect:/rentprocess.do?searchType=" + searchType + "&query=" + URLEncoder.encode(query, "UTF-8");

                return redirectUrl; // 대여 성공 후 검색 결과 페이지로 리다이렉트
            }
        }
    }
        return null; // 로그인 페이지로 리다이렉트
    }
}
