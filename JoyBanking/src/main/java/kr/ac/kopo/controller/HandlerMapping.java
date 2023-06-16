package kr.ac.kopo.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.lang.reflect.Constructor;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
//mvc 패턴에서는 안고치는 부분들은 블랙박스라고 명시한다(->dispatcherservlet/handlermapping)
//handlermapping은 딱 한번만 만들어지면 되기 때문에 dispatchersevlet에 init 메소드로 활용되어야하는 것이다. 이런 이유 때문에 생명 주기를 잘 알아야하는 것.
/*
public class HandlerMapping {

	//어떤 어떤 uri를 줄테니, 어떤 컨트롤러를 달라
	//실제 작업 수행하는 애들은 handlerequest로 쓰겠다
//	-> 인터페이스로 딱 고정하여 표준화 시킴 무조건 핸들리퀘스트로 오는 작업만 수행하게 하겠다..=> 인터페이스 컨트롤러를 생성

	private Map<String, Controller> mappings;
	//string이 들어와야 함
	//컨트롤러 이름을 알야함 그래서 , 뒤에 컨트롤러가 들어오는 것임

	public HandlerMapping() {
		//요청이 계속 들어올 것임....객체 만드는 행위는 생성자에서 해야함
		mappings = new HashMap<>();
		//객체를 만들어야 소환 할 수 있으니까.....그래서 new 하고 만들었었음 근데 원래는 handler의 내부 내용을 고치는게 아닌데 이전 프로젝트에서는 여기에 겁나 추가했었음
		//=> 그래서 우리는 .properties인 파일을 만들것임 name=value로 데이터가 들어있는 것임 이 두개 정도를 한쌍으로 저장하는 것임 parameter할때 
		// /login.do = LoginConteroller /member/mypage=Mypage???? 처럼 하려고 함...
//		mappings.put("/login.do", LoginController);
//		mappings.put("/member/mypage.do", MypageController);
		Properties prop = new Properties();
		//프로퍼티스 안s에 있는 것을 기존에 위에 적는 것 대신에 하는 것임 
		//집에서 하는건 아래 경로 고쳐야할것!!!
		try {
		InputStream is = new FileInputStream("C:\\Users\\User\\eclipse-workspaceJSP\\MyBanking\\bean.properties");
		prop.load(is);
		
		Set<Object> keys = prop.keySet();//keySet은 object로 받아진다
		//앞에 있는 name 만 추출할 수 있음
		for(Object key : keys) {
			System.out.println(key);
			String className = prop.getProperty(key.toString());
			System.out.println(key+ " : " + className);//여긴 스트링형으로 들어온다)
			//우리는 set에 받을 때 object로 받았으므로 string으로 변환해줄 필요가 있기 때문에 toString을 사용해준다
			//(String)으로 하는 명시적 형변환은 서로 상속관계에 있을 때만 씀 다만 올바른 형태는 아님....저 객체가 string이라는 보장이 없음
			//new로 인스턴스객체를 가져와야 하는데 우리는 클래스 이름만 앎
			//프로그램을 시행하고 있는 와중에 사용자가 원하는 클래스명에 해당하는 객체를 만들어야하는 상황임 -> reflection이라고 표현함(:동적으로 객체를 만들거나 메소드를 만들거나 하는 것을 의미)
//		mappings.put("/member/mypage.do", MypageController);
			//-> 우리는 궁극적으로 이 자리에 mapping으로 얻었던 값 주소가 들어오게 하고 싶은 것임 따라서
			Class<?> clz = Class.forName(className);
			Constructor<?> constructor = clz.getConstructor();
			//근데 들어오는 value가 object 형이기 때문에 아래처럼 적으면 오류가 남
//			mappings.put(key, constructor.newInstance());
			mappings.put(key.toString(), (Controller)constructor.newInstance());
//			mappings.put(className, null)
		}
		
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	public Controller getController(String uri) {
		
		//get으로 옮겨줌.....어떤때는 login/ 어떤때는 logout으로 전달 됨...
		//묵시적 형변환이 여기에 쓰인다....
		return mappings.get(uri);
		//key에 해당하는 value 값을 가져오는 것이 get메소드임....아니면 keyset이고 enddset은 맴엔트리를 셋형으로 반환해주는 거다...???
	}
	
	/*설명을 위한 부분임
	public static void main(String[] args) throws Exception {
//		java.util.Random r = new java.util.Random();
//		System.out.println(r.nextInt());
		
		//어떤 클래스를 만들줄 모르므로 ?로 되어있음 뭐든지 받겠다는 이야기
		Class<?> clz = Class.forName("java.util.Random");
		
//		Object obj = clz.newInstance();
//		//이걸 통해서 new random으로 인스턴스 객체를 만들고 싶은것 newInstanc(object)임 근데 이건 이제 곧 사라질 문법이라 아래처럼 쓰이게 됨
		Constructor<?> constructor = clz.getConstructor();
		Object obj = constructor.newInstance();
		//이젠 아예 constructor(생성자)클래스를 이용해서 내부적으로 인스턴스 객체를 만들게 한다
		//reflection의 약속
		//1. forname을 통해 클래스의 정보를 읽어오고
		//2. 생성자를 만들고
		//3. 생성자를 통해서 객체를 만듬
		System.out.println("난수 : " + ((java.util.Random)obj).nextInt());
	}
	*/
//}
public class HandlerMapping {

//	private Map<String, Controller> mappings;
//	
//	public HandlerMapping() {
//		mappings = new HashMap<>();
//		//property를 불러오는 내장...객체?
//		Properties prop = new Properties();
//		
//		try {
//			// prop.load로 파일을 불러와야 하는데 () 안의 타입은 InputStream이니까 이거 절대경로로 가져와주고,
//			//try~catch로 감싸줌.
//			InputStream is = new FileInputStream("C:\\Users\\User\\eclipse-workspaceJSP\\JoyBanking\\bean.properties");
//			prop.load(is);
//			
//			//properties의 한 쌍에서 name만 뽑아올 수 있음!
//			//그렇다면 value를 뽑아내는건? getProperty()라는 메소드를 씀.
//			//Object가 String이라는 보장이 없기 때문에 (String)으로 명시적 형변환하는 것은 옳은 방법은 아님!
//			Set<Object> keys = prop.keySet();
//			for(Object key : keys) {
//				System.out.println("key : " + key);
//				String className = prop.getProperty(key.toString());
//				System.out.println(key + " : " + className);
//				
//				// reflection : 프로그램을 실행하는 와중에 객체를 관리하려고 하는 것. 메소드 호출이라던가 유동적으로 바뀌도록...
//				// 동적으로 객체 생성, 메소드 호출, 정보 알아오게 하는 그런 모든 것들을 리플렉션이라고 합니다.
//				// 스프링은 모두 리플렉션 방식임.
//				// 커넥션팩토리에서 classForName 어쩌고 있었는데 그게 리플렉션임.
//				
//				Class<?> clz = Class.forName(className);
//				Constructor<?> constructor = clz.getConstructor();
//				//object타입이니까 Controller로 명시적 형변환해주기!
//				Controller ctrl = (Controller)constructor.newInstance();
//				
//				mappings.put(key.toString(), ctrl);
//			}
//			
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		// 근데 이 uri를 여따가 다 써?? 100개면 다 써??
//		// 파일 하나에 몰아주자!
//		// .properties 라는 파일을 만들어
//		// 항상 name = value 이렇게 쌍의 형태로 저장을 할 것임.
//		// /login.do=LoginController
//		// /member/mypage = MyPageController 이런식으로 저장이 되겠지.
//		// 근데 동명의 LoginController가 있을수 있기 때문에 패키지를 포함한 이름을 써야함.
//		// 단 쌍의 중간에 스페이스 안됨!! 엔터로 공간을 줘서도 안됨!!!
//		
////	      mappings.put("/login.do", new LoginController);
////	      mappings.put("/member/mypage.do", new MyPageController);
//	}
	   private Map<String, Controller> mappings;

	   public HandlerMapping(String propLoc) {
	      mappings = new HashMap<>();
	      //property를 불러오는 내장...객체?
	      Properties prop = new Properties();

	      try {
	         // prop.load로 파일을 불러와야 하는데 () 안의 타입은 InputStream이니까 이거 절대경로로 가져와주고,
	         //try~catch로 감싸줌.
	         InputStream is = new FileInputStream(propLoc);
	         prop.load(is);
	         
	         //properties의 한 쌍에서 name만 뽑아올 수 있음!
	         //그렇다면 value를 뽑아내는건? getProperty()라는 메소드를 씀.
	         //Object가 String이라는 보장이 없기 때문에 (String)으로 명시적 형변환하는 것은 옳은 방법은 아님!
	         Set<Object> keys = prop.keySet();
	         for(Object key : keys) {
	            System.out.println("key : " + key);
	            String className = prop.getProperty(key.toString());
	            System.out.println(key + " : " + className);
	            
	            // reflection : 프로그램을 실행하는 와중에 객체를 관리하려고 하는 것. 메소드 호출이라던가 유동적으로 바뀌도록...
	            // 동적으로 객체 생성, 메소드 호출, 정보 알아오게 하는 그런 모든 것들을 리플렉션이라고 합니다.
	            // 스프링은 모두 리플렉션 방식임.
	            // 커넥션팩토리에서 classForName 어쩌고 있었는데 그게 리플렉션임.

	            Class<?> clz = Class.forName(className);
	            Constructor<?> constructor = clz.getConstructor();
	            //object타입이니까 Controller로 명시적 형변환해주기!
	            Controller ctrl = (Controller)constructor.newInstance();
	            
	            mappings.put(key.toString(), ctrl);
	         }
	         
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }

	      // 근데 이 uri를 여따가 다 써?? 100개면 다 써??
	      // 파일 하나에 몰아주자!
	      // .properties 라는 파일을 만들어
	      // 항상 name = value 이렇게 쌍의 형태로 저장을 할 것임.
	      // /login.do=LoginController
	      // /member/mypage = MyPageController 이런식으로 저장이 되겠지.
	      // 근데 동명의 LoginController가 있을수 있기 때문에 패키지를 포함한 이름을 써야함.
	      // 단 쌍의 중간에 스페이스 안됨!! 엔터로 공간을 줘서도 안됨!!!

//	      mappings.put("/login.do", new LoginController);
//	      mappings.put("/member/mypage.do", new MyPageController);
	   }
	   
	   public Controller getController(String uri) {
	      
	      //key만 꺼내는 게 get메소드!ㅋㅋㅋ
	      //uri로 login.do가 들어오면, 걔의 밸류인 LoginController를 뽑!
	      return mappings.get(uri);
	      
	   }

	   /*
	   public static void main(String[] args) throws Exception{
	   //   java.util.Random r = new java.util.Random();
	   //   System.out.println(r.nextInt());
	      
	      //클래스 내용을 가져와서
	      Class<?> clz = Class.forName("java.util.Random");

	      //생성자를 만들고 나서
//	      Object obj = clz.newInstance(); 얘는 이제 deprecated 된 애...
	      Constructor<?> constructor = clz.getConstructor();
	      
	      //인스턴스 객체를 만들 수 있음.
	      Object obj = constructor.newInstance();
	      System.out.println("난수 : " + ((java.util.Random)obj).nextInt());
	   }
	   
	   */

	}