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
@WebServlet("/CookieTestServlet2")//������̼� --> ���⿡ �� �͵��� �����Ű�ڴٴ� ����
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
		// form �±װ� �������� �޾ƿ;���
		//�Է� ��� ���ڵ� ���ڵ� ���ڼ� ����
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=euc-kr");
		
		// ��� HTML ���� ����� ���� out �ν��Ͻ� ���� -> response�� �� �κ��� �������ִ� ��
		PrintWriter out = response.getWriter();
		
		// ��û���� �������κ��� ��Ű ��������
		Cookie[] cookies = request.getCookies();

		// ��Ű�� �ִ��� Ȯ��
		if (cookies != null) {//jsp ���۵ɶ� ��Ű�� �ִ��� Ȯ���ϰ�, ������ ����ض� �׸��� �ϴ��� �Է��� �ޱ����� html �ڵ尡 ����ִ� ��
			//��Ű�� ������
			for (Cookie cookie : cookies) {
				//���
				out.println("cookie :" + cookie.getName() + ":" + cookie.getValue() + "<br/>");
				
			}
		}
		// name�� value �Է¹޴� html �� ���� //���� �����Ҷ�	// form�±׷� �Ұ�~action�� �׶� ����Ǵ� ���� �̸��� �˷��޶�� ����
		// ���� �̸��� ���� �ൿ�� ���ϰڴٴ� ���̰� �׷��� ������ ���� �� ���� �̸���
		// �������
		out.println("<form method='post' action='CookieTestServlet2'>");
		out.println("name<input type='text' name='name'/>");
		out.println("value<input type='text' name='value'/>");
		out.println("<input type='submit'/>");
		out.println("</form>");
		// ���� ���� run on server�ϴ� ���� �������� �ߴ� �κ��̰�, ���� �� ���ƿ��� ���� doPost�� ���ƿ�
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	// get�ؿ� �Լ��� post�� �޴´� name�� value�� doPost�� �Ѿ���� ��
	//post�� ������ �����͸� �Է��� �� ��
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//������ post�� ��û�� ����
		//request ���� name, value ����
		String name = request.getParameter("name");// ������ �޾ƿ��� ��
		String value = request.getParameter("value");// value�� �޾ƿ��� ��

		//��Ű�� ����
		Cookie c = new Cookie(name, value);
		response.addCookie(c);
		
		// ���� doGet���� �����̷���
		response.sendRedirect("CookieTestServlet2");
		// ���⼭ addcookie�� �ؼ� ��Ű�� �����ϴ� ���� doPost������ �ٽ� get�� ��ȯ ���� -> �����̷�Ʈ
	}

}
