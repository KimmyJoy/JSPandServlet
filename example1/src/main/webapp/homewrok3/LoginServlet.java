package homewrok3;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.FileReader;
/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String id = request.getParameter("id");
	        String password = request.getParameter("password");
	        
	        boolean isValid = validateCredentials(id, password);

	        // 텍스트 파일에서 저장된 ID/PW 정보를 검색
	        if (isValid) {
	        	// 세션을 생성
	            HttpSession session = request.getSession();
	            
	            // 사용자의 아이디 값을 세션에 저장
	            session.setAttribute("id", id);
	        	response.sendRedirect(request.getContextPath() + "/homework3_230523/main.jsp");
	        	
	        	// isValid가 false인 경우
	        } else {
	        	response.sendRedirect(request.getContextPath() + "/homework3_230523/error.jsp");
	        }
	}

	
	private boolean validateCredentials(String id, String pw) throws IOException {
		
		// logindata.txt 파일에 저장되어있는 id와 pw값을 가져와 사용
		String filePath = getServletContext().getRealPath("/WEB-INF/IDPW.txt");
		
		BufferedReader reader = new BufferedReader(new FileReader(filePath));
        String line;
		
        // 파일을 한 줄씩 읽어오면서 ID와 비밀번호를 비교
        while ((line = reader.readLine()) != null) {
        	// ,를 기준으로 분리
            String[] data = line.split(",");
            String savedId = data[0].trim();
            String savedPassword = data[1].trim();

            // 입력한 ID와 비밀번호와 저장된 ID와 비밀번호를 비교
            if (id.equals(savedId) && pw.equals(savedPassword)) {
            	reader.close();
            	return true;
            }
        }
        // 같지 않다면 false를 반환
        reader.close();
        return false;
        
    }
	
		
}
