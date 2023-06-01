package controller.all;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DispathcerServlet
 */
//모든걸 다 처리하기 위해서는 어노테이션을 지워야 함
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private HandlerMapping mapping;
	
	public DispatcherServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	@Override
	//초기화 해주는 메소드를 만들었는데 이것은 오버라이드 하여 만드는 것
	public void init() throws ServletException {
		mapping = new HandlerMapping();
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	//어디로 들어오든 단 process로 처리 할 예정
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		process(request, response);
		//서블릿에서 들어오는 url에서 uri를 뽑아내고 명령어를 처리하고 html이나 jsp로 보여줌 클래스한테 명령어를 줘야함???
		//
	}

	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//uri 추출
		String uri = request.getRequestURI();
		String path = uri.substring(uri.lastIndexOf("/"));
		//역슬래쉬 뒤에 나오는 것이 추출됨
		
		Controller ctrl = mapping.getController(path);
		String viewPage = ctrl.handleRequest(request, response);
		
		RequestDispatcher rd = request.getRequestDispatcher(viewPage);
		rd.forward(request, response);
		
	}
}
