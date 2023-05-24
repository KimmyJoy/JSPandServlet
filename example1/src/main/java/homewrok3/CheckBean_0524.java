package homewrok3;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class CheckBean_0524 {

	private String id;
	private String password;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
//	
//	
//private boolean validateCredentials(String id, String pw) throws IOException {
//		
//		// logindata.txt 파일에 저장되어있는 id와 pw값을 가져와 사용
//		String filePath = getServletContext().getRealPath("/WEB-INF/IDPW.txt");
//		
//		BufferedReader reader = new BufferedReader(new FileReader(filePath));
//        String line;
//		
//        // 파일을 한 줄씩 읽어오면서 ID와 비밀번호를 비교
//        while ((line = reader.readLine()) != null) {
//        	// ,를 기준으로 분리
//            String[] data = line.split(",");
//            String savedId = data[0].trim();
//            String savedPassword = data[1].trim();
//
//            // 입력한 ID와 비밀번호와 저장된 ID와 비밀번호를 비교
//            if (id.equals(savedId) && pw.equals(savedPassword)) {
//            	reader.close();
//            	return true;
//            }
//        }
//        // 같지 않다면 false를 반환
//        reader.close();
//        return false;
//        
//    }
//	
//	
}
