package ex5;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CookieTestServlet
 */
@WebServlet("/CookieTestServlet2")//어노테이션 --> 여기에 들어간 것들을 실행시키겠다는 뜻임
public class CookieTestServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CookieTestServlet2() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// form 태그가 있으려면 받아와야함
		//입력 출력 인코딩 디코딩 문자셋 설정
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=euc-kr");
		
		// 출력 HTML 파일 만들기 위한 out 인스턴스 생성 -> response로 줄 부분을 기재해주는 것
		PrintWriter out = response.getWriter();
		
		// 요청들어온 브라우저로부터 쿠키 가져오기
		Cookie[] cookies = request.getCookies();

		// 쿠키가 있는지 확인
		if (cookies != null) {//jsp 시작될때 쿠키가 있는지 확인하고, 있으면 출력해라 그리고 하단은 입력을 받기위한 html 코드가 들어있는 것
			//쿠키가 있으면
			for (Cookie cookie : cookies) {
				//출력
				out.println("cookie :" + cookie.getName() + ":" + cookie.getValue() + "<br/>");
				
			}
		}
		// name과 value 입력받는 html 폼 생성 //폼을 제출할때	// form태그로 할것~action은 그때 실행되는 서블릿 이름을 알려달라는 것임
		// 서블릿 이름에 따라 행동을 취하겠다는 것이고 그렇기 때문에 현재 이 서블릿 이름을
		// 적어야함
		out.println("<form method='post' action='CookieTestServlet2'>");
		out.println("name<input type='text' name='name'/>");
		out.println("value<input type='text' name='value'/>");
		out.println("<input type='submit'/>");
		out.println("</form>");
		// 위의 것은 run on server하는 순간 브라우저에 뜨는 부분이고, 제출 시 날아오는 것은 doPost로 날아옴
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	// get해온 함수는 post로 받는다 name과 value는 doPost로 넘어오게 됨
	//post는 서버에 데이터를 입력할 때 씀
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//폼에서 post로 요청이 오면
		//request 에서 name, value 추출
		String name = request.getParameter("name");// 네임을 받아오는 것
		String value = request.getParameter("value");// value를 받아오는 것

		//쿠키로 저장
		Cookie c = new Cookie(name, value);
		response.addCookie(c);
		
		// 서블릿 doGet으로 리다이렉션
		response.sendRedirect("CookieTestServlet2");
		// 여기서 addcookie로 해서 쿠키로 저장하는 것임 doPost에서도 다시 get을 소환 가능 -> 리다이렉트
	}

}
