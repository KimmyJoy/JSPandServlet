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
//.do에 대한 요청을 받는 애(콜센터 대표번호 같은 애) => hadler에 넘겨주고 handler는 시킨다
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
	//어디로 들어오든 다 process로 처리 할 예정
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		process(request, response);
		//서블릿에서 들어오는 url에서 uri를 뽑아내고 명령어를 처리하고 html이나 jsp로 보여줌 클래스한테 명령어를 줘야함???
		//
	}

	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//uri 추출
		try {
		String uri = request.getRequestURI();
		System.out.println("uri : " + uri);
//		String path = uri.substring(uri.lastIndexOf("/"));//얘처럼 하면 /WebText/login.do 이 부분이 다 들어가버림 중복이 되면...
		String path = uri.substring(request.getContextPath().length());
		//역슬래쉬 뒤에 나오는 것이 추출됨
		
		Controller ctrl = mapping.getController(path);
		String viewPage = ctrl.handleRequest(request, response);
		
		if(viewPage != null) {
		RequestDispatcher rd = request.getRequestDispatcher(viewPage);
		rd.forward(request, response);
		}
		} catch (Exception e) {
			throw new IOException(e);
		}
	}
}
