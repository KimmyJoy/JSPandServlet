package joybank.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DispatcherServlet
 */
@WebServlet("/DispatcherServlet")
public class DispatcherServlet extends HttpServlet {
	private HandlerMapping mappings;
       
	
    @Override
	public void init(ServletConfig config) throws ServletException {
		String propLoc = config.getInitParameter("propLoc");
		System.out.println(propLoc);
		
		mappings = new HandlerMapping(propLoc);
	}

    @Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI();
		uri = uri.substring(request.getContextPath().length());
		
		Controller ctrl = mappings.getController(uri);//여기가 수행하는 것은 dispatcher <-> handlermapping을 수행 한 것
		//init에서 만들어진 객체를 service에서도 같이 쓰고 싶음 ==> 멤버 변수면 됨!!!!
		String callPage = ctrl.handleRequest(request, response);
		System.out.println("jsp : " + callPage);
		
		/*
		 * if (ctrl != null) { String viewPage = ctrl.handleRequest(request, response);
		 * 사실 ctrl이 null 일 경우가 없음
		 * if(viewPage.startsWith("redirect:")) { String viewUrl =
		 * viewPage.substring("redirect:".length());
		 * response.sendRedirect(request.getContextPath() + viewUrl); } else {
		 * RequestDispatcher rd = request.getRequestDispatcher(viewPage);
		 * rd.forward(request, response); } }
		 */
		
		
		if(callPage.startsWith("redirect:")) {//만약 callpage의 서두가 redirect로 시작되면 아래 문장 수행하고 아니면 else 뒤의 문장 수행해
			response.sendRedirect(request.getContextPath() +callPage.substring("redirect:".length()));
			//근데 날아오는건 앞에 우리가 추가한 "redirect:"가 존재하니까 이걸 없애달라고 요청하는 것
		} else {
		RequestDispatcher dispatcher = request.getRequestDispatcher(callPage);
		//포워드 시켜주는게 목적이라서 포워드 시키려는 주소가 ()안에 들어가야 함
		//request와 response를 다 받아야 함....포워드-> 떠넘기는 것
		dispatcher.forward(request, response);
		//요청과 응답을 처리하는 것은 무조건 request와 response가 있어야 함 요청 작업은 다 controller가 하므로 걔가 request와 response를 다 알아야해서 떠넘겨주는것
		}
		}

}
