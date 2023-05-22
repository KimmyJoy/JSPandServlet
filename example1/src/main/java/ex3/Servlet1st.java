package ex3;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Servlet1st
 */
@WebServlet("/Servlet1st")
public class Servlet1st extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	    /**
	     * @see HttpServlet#HttpServlet()
	     */
	    public Servlet1st() {
	        super();
	        // TODO Auto-generated constructor stub
	    }

	   /**
	    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	    */
	   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      PrintWriter out = response.getWriter();
	      out.println("<h1> I am 1st Servlet</h1>");
	      
	      RequestDispatcher rd = request.getRequestDispatcher("Servlet2nd");
			rd.include(request, response);
	   }  
//	      response.sendRedirect("Servlet2nd"); // http://localhost:8080/example1/Servlet2nd
//	      RequestDispatcher rd = request.getRequestDispatcher("Servlet2nd");
//	      rd.forward(request, response);  // http://localhost:8080/example1/Servlet1st
//	   }
	
	
//    /**
//     * @see HttpServlet#HttpServlet()
//     */
//    public Servlet1st() {
//        super();
//        // TODO Auto-generated constructor stub
//    }
//
//	/**
//	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		PrintWriter out = response.getWriter();
//		out.println("<h1>I am 1st Servlet</h1>");
//		
//		RequestDispatcher rd = request.getRequestDispatcher("Servlet2nd");
//		rd.include(request, response);

		
//		RequestDispatcher rd = request.getRequestDispatcher("Servlet2nd");
//		rd.forward(request, response);//받은걸 바탕으로 포워드함 ex 병주한테 출석하라고 시켰는데 병주는 지현이 시키고, 자기가 한 것처럼 말함

//		response.sendRedirect("Servlet2nd"); ex 병주한테 가져오라고 시켰는데 병주가 지현이한테 부탁해서 지현이가 갖다준것
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
