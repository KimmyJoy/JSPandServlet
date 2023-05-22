package exam5;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet("/CalculatorServlet")
public class CalculatorServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");

        PrintWriter out = response.getWriter();
        printHTML(out); // 공통 HTML 코드 출력

        out.println("<h2>계산 이력</h2>");
        out.println("<ul id=\"history\">");

        HttpSession session = request.getSession();
        List<String> history = (List<String>) session.getAttribute("history");
        if (history != null) {
            for (String calculation : history) {
                out.println("<li>" + calculation + "</li>");
            }
        }
        
        out.println("</ul>");

        out.println("<script>");
        //서블릿에서 계산 결과와 계산 이력 값을 받아와서 출력하는 함수
        out.println("  function showResult(result, history) {");
        out.println("    var resultElement = document.getElementById(\"result\");");
        out.println("    var historyElement = document.getElementById(\"history\");");
        out.println("");
        // 계산 결과 출력
        out.println("    resultElement.textContent = result;");
        out.println("");
        // 계산 이력 출력
        out.println("    historyElement.innerHTML = \"\";");
        out.println("    history.forEach(function (calculation) {");
        out.println("      var li = document.createElement(\"li\");");
        out.println("      li.textContent = calculation;");
        out.println("      historyElement.appendChild(li);");
        out.println("    });");
        out.println("  }");
        out.println("</script>");
        out.println("</body>");
        out.println("</html>");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String num1 = request.getParameter("num1");
        String num2 = request.getParameter("num2");
        String operator = request.getParameter("cal");

        double operand1 = Double.parseDouble(num1);
        double operand2 = Double.parseDouble(num2);

        double result = Calculator.calculate(operand1, operand2, operator);
        String calculation = num1 + " " + operator + " " + num2 + " = " + formatResult(result);

        HttpSession session = request.getSession();
        List<String> history = (List<String>) session.getAttribute("history");
        if (history == null) {
            history = new ArrayList<>();
            session.setAttribute("history", history);
        }

        history.add(calculation);

        response.sendRedirect(request.getContextPath() + "/CalculatorServlet"); // doGet으로 리다이렉션
    }

    //공통 부분을 뺴기 위한 메소드
    private void printHTML(PrintWriter out) {
        out.println("<html>");
        out.println("<head>");
        out.println("<link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">");
        out.println("<link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>");
        out.println("<link href=\"https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap\" rel=\"stylesheet\">");
        out.println("<meta charset=\"UTF-8\">");
        out.println("<script src=\"https://code.jquery.com/jquery-3.6.4.js\" integrity=\"sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=\" crossorigin=\"anonymous\"></script>");
        out.println("<title>사칙연산 계산기</title>");
        out.println("<style>");
        out.println("body {");
        out.println("  font-family: 'Nanum Gothic', sans-serif;");
        out.println("  text-align: center;");
        out.println("}");
        out.println("select {");
        out.println("  text-align: center;");
        out.println("}");
        out.println("fieldset {");
        out.println("  background-color: #9496ffc2;");
        out.println("}");
        out.println("legend {");
        out.println("  font-weight: bold;");
        out.println("  background-color: #9c63bb;");
        out.println("  border: 2px solid;");
        out.println("}");
        out.println("ul {");
        out.println("  list-style: none;");
        out.println("}");
        out.println("</style>");
        out.println("</head>");
        out.println("<body>");
        out.println("<form method=\"post\" action=\"/example1/CalculatorServlet\">");
        out.println("<fieldset>");
        out.println("  <legend>사칙 연산 계산기</legend><br>");
        out.println("  연산을 진행할 숫자와 기호를 입력해주세요<br><br>");
        out.println("  <input type=\"number\" name=\"num1\" placeholder=\"숫자를 입력해주세요\">");
        out.println("  <select name=\"cal\">");
        out.println("    <option value=\"\" disabled selected=\"true\">--연산 기호 선택--</option>");
        out.println("    <option id=\"add\">+</option>");
        out.println("    <option id=\"subtract\">-</option>");
        out.println("    <option id=\"multiply\">*</option>");
        out.println("    <option id=\"divide\">/</option>");
        out.println("  </select>");
        out.println("  <input type=\"number\" name=\"num2\" placeholder=\"숫자를 입력해주세요\"><br><br>");
        out.println("  <input type=\"submit\" value=\"계산하기\"/>");
        out.println("</fieldset>");
        out.println("</form>");
    }
    
    private String formatResult(double result) {
        if (result == (long) result) {
            return String.format("%d", (long) result);
        } else {
            return String.format("%f", result);
        }
    }
    
}

