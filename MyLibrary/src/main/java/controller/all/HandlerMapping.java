package controller.all;

import java.util.HashMap;
import java.util.Map;

import controller.admin.AdminpageController;
import controller.book.RentalController;
import controller.book.SearchbookController;
import controller.book.ShowallbookList;
import controller.user2.InsertUserController;
import controller.user2.InsertUserProcessController;
//import controller.user.InsertUserController;
import controller.user2.LoginController;
import controller.user2.LoginProcessController;
import controller.user2.LogoutController;
import controller.user2.MypageController;

public class HandlerMapping {
	
	private Map<String, Controller> mappings;
	//여기에 쓰인 Controller는 우리가 인터페이스로 만든 컨트롤러임
	public HandlerMapping() {
		mappings = new HashMap<String, Controller>();
//		mappings.put("/insertUser.do", new InsertUserController());
		mappings.put("/login.do", new LoginController()); //해쉬 맵에 들어가는 key, 객체값
		mappings.put("/logout.do", new LogoutController()); //해쉬 맵에 들어가는 key, 객체값
		mappings.put("/main.do", new GotomainController());
		mappings.put("/loginprocess.do", new LoginProcessController());
		mappings.put("/adminpage.do", new AdminpageController());
		mappings.put("/Mypage.do", new MypageController());
		mappings.put("/insertuser.do", new InsertUserController());
		mappings.put("/insertuserprocess.do", new InsertUserProcessController());
		mappings.put("/searchbook.do", new SearchbookController());
		mappings.put("/rentprocess.do", new RentalController());
		mappings.put("/showallbook.do", new ShowallbookList());
		System.out.println("지금 이게 되고 있나요?");
	}
	public Controller getController(String path) {
		return mappings.get(path);
		//나중에 클라이언트 측에서 요청이 들어올때 url로 요청이 들어올 것(ex login?id="ooo"&pw="oooo" 이런식) 그 로그인 값에 해당하는 것을 반환해주고 시행하게 하는 것
	}
}
