package exam5;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet("/TestServlet")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
//		response.getWriter().append("Result: ").append(request.getContextPath());
		response.setContentType("text/html;charset=utf-8");
		
		String num1 = request.getParameter("num1");
		String num2 = request.getParameter("num2");
		String operator = request.getParameter("cal");
		
		double operand1 = Double.parseDouble(num1);
		double operand2 = Double.parseDouble(num2);
		
		double result = Calculator.calculate(operand1, operand2, operator);

		
		
		PrintWriter out = response.getWriter();
		out.println("<h1>연산 결과</h1>");
		out.println(num1+" ");
		out.println(operator+" ");
		out.println(num2);
		out.println("<br>");
		
		if (result == (int)result) {
		out.println("= "+ (int)result);
		} else {
			out.println("= " + result);
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
