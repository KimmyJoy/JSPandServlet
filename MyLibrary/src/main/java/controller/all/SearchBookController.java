package controller.all;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import biz.book.BookDAO;
import biz.book.BookVO;
import controller.all.Controller;


public class SearchBookController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String searchType = request.getParameter("searchType");
        String query = request.getParameter("query");

        // API 호출을 위한 설정
        String clientId = "YOUR_CLIENT_ID"; // 네이버 API 클라이언트 ID
        String clientSecret = "YOUR_CLIENT_SECRET"; // 네이버 API 클라이언트 시크릿
        int display = 10; // 검색 결과 수

        try {
            query = URLEncoder.encode(query, "UTF-8"); // 검색어 URL 인코딩

            // API 호출 URL 생성
            String apiUrl = "https://openapi.naver.com/v1/search/book.json?query=" + query + "&display=" + display;

            // API 호출을 위한 연결 설정
            URL url = new URL(apiUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("X-Naver-Client-Id", clientId);
            conn.setRequestProperty("X-Naver-Client-Secret", clientSecret);

            // API 호출 결과 읽기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = br.readLine()) != null) {
                sb.append(line);
            }
            br.close();

            // API 호출 결과를 적절히 처리하여 BookVO에 저장
            // 예시로서 첫 번째 검색 결과만 사용
            String responseJson = sb.toString();
            JSONObject jsonObject = new JSONObject(responseJson);
            JSONArray items = jsonObject.getJSONArray("items");
            if (items.length() > 0) {
                JSONObject item = items.getJSONObject(0);

                // 도서 정보 추출
                String isbn = item.getString("isbn");
                String title = item.getString("title");
                String author = item.getString("author");
                String publisher = item.getString("publisher");

                // BookVO에 저장
                BookVO book = new BookVO();
                book.setIsbn(isbn);
                book.setTitle(title);
                book.setWriter(author);
                book.setPublisher(publisher);

                // BookDAO를 통해 도서 정보 저장
                BookDAO dao = new BookDAO();
                dao.insertBook(book);
            }

            // 원하는 작업 수행 (예: 다른 페이지로 이동)
            return "/jsp/bookManagement.jsp"; // 적절한 URL로 변경

        } catch (Exception e) {
            e.printStackTrace();
        }

        // 검색 실패 시 적절한 페이지로 반환
        return "/jsp/searchError.jsp"; // 예시로 "/jsp/searchError.jsp"를 반환
    }

}
