package ex17;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MvcControl
 */
@WebServlet("/Control.do")//여긴 애(어)노테이션이라고 함
public class MvcControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MvcControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("Password");
		
		ModelBeans beans = new ModelBeans();
		beans.setId(id);
		beans.setPassword(pw);
		//로그인이 된거라 세션에도 알려줘야함
		//하단을 통해 세션에 저장
		HttpSession session = request.getSession();
		session.setAttribute("login", beans);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ex17/mvcView.jsp");
		dispatcher.forward(request, response);
		
	}

}
