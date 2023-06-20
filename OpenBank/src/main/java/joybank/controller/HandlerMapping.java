package joybank.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.lang.reflect.Constructor;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

public class HandlerMapping {

	
	 private Map<String, Controller> mappings;

	   public HandlerMapping(String propLoc) {
	      mappings = new HashMap<>();
	      Properties prop = new Properties();

	      try {
	         InputStream is = new FileInputStream(propLoc);
	         prop.load(is);
	         
	         Set<Object> keys = prop.keySet();
	         for(Object key : keys) {
	            System.out.println("key : " + key);
	            String className = prop.getProperty(key.toString());
	            System.out.println(key + " : " + className);
	            

	            Class<?> clz = Class.forName(className);
	            Constructor<?> constructor = clz.getConstructor();
	            
	            Controller ctrl = (Controller)constructor.newInstance();
	            
	            mappings.put(key.toString(), ctrl);
	         }
	         
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }

	   }
	   
	   public Controller getController(String uri) {
	      
	      //key만 꺼내는 게 get메소드!ㅋㅋㅋ
	      //uri로 login.do가 들어오면, 걔의 밸류인 LoginController를 뽑!
	      return mappings.get(uri);
	      
	   }


	}
	
