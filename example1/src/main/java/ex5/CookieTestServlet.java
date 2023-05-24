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
		
		for(int i = 0; cookies != null && i < cookies.length; i++){//��Ű�� �������� �� �����ϱ� for�� ���
			//�ַ� �迭 Ȥ�� �޸𸮸� ����� ���� �ܺο��� ���� �����ö����� null üũ�� �ݵ�� �ؾ��Ѵ�
			//���� ó�� �ڵ忡 �Ű��� ���� �����
			//for�� ������ ���Դٴ� �Ҹ��� ��Ű�� �ִٴ� �̾߱�
			cnt = Integer.parseInt(cookies[i].getValue());//���ڷ� ��ȯ�ϱ� ���� integer�� ���
			//���⼭ ���Ǵ� get�� �޼ҵ���� �̹� ���ǰ� �� ���� -> ���̵� �ް� �ʹ� �ϸ� cookies[i].getValue().equals("id");��� �ϸ� �ű⿡ �ش��ϴ� ��鸸 ������ ��???
			break;
		}
		//���� �湮Ƚ���� ����� ���̰� ���縦 �ݿ��ϱ����� �Ʒ��� ���� ���� 1ȸ �÷���
		cnt++;
		
		Cookie c = new Cookie("count", cnt+"");//count��� �ʵ�� cnt�� �����Ѵٴ� �̾߱�
		c.setMaxAge(0);//여기는 쿠키 존재 시간임
		response.addCookie(c);
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("<h1>�湮 Ƚ�� : "+cnt+"</h1>");
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
