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
@WebServlet("/CookieTestServlet")
public class CookieTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CookieTestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cnt = 0;
		Cookie[] cookies = request.getCookies();
		
		for(int i = 0; cookies != null && i < cookies.length; i++){//쿠키가 여러개일 수 있으니까 for문 사용
			//주로 배열 혹은 메모리를 만들고 나서 외부에서 값을 가져올때에는 null 체크를 반드시 해야한다
			//예외 처리 코드에 신경을 많이 써야함
			//for문 안으로 들어왔다는 소리는 쿠키가 있다는 이야기
			cnt = Integer.parseInt(cookies[i].getValue());//숫자로 변환하기 위해 integer를 사용
			break;
		}
		//이전 방문횟수만 저장된 것이고 현재를 반영하기위해 아래와 같이 값을 1회 늘려줌
		cnt++;
		
		Cookie c = new Cookie("count", cnt+"");//count라는 필드명에 cnt를 저장한다는 이야기
		response.addCookie(c);
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("<h1>방문 횟수 : "+cnt+"</h1>");
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
