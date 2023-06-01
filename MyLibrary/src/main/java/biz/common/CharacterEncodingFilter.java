package biz.common;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 * Servlet Filter implementation class CharacterEncodingFilter
 */
@WebFilter("/CharacterEncodingFilter")
public class CharacterEncodingFilter implements Filter {

    /**
     * Default constructor. 
     */
    public CharacterEncodingFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
    //���Ϳ� �����ڰ� �����Ѵ�
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("Begin of Filter");
		
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=utf-8");
		// pass the request along the filter chain
		chain.doFilter(request, response);
		System.out.println("End of Filter");
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
