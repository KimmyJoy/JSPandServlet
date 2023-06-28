package biz.user.service;

import biz.user.UserDAO;
import biz.user.UserVO;

public class UserService {

	private static UserService instance = null;
	private UserDAO udao;
	
	private UserService() {
		udao = new UserDAO();
	}

	    public static UserService getInstance() {
	    	if(instance == null) {
	    		instance = new UserService();
	    }
	    return instance;
	    }
	    
	    public void updateUser(UserVO user) {
	    
	    	try {
				udao.updateUser(user);
			} catch (Exception e) {
				e.printStackTrace();
			}
	    }

	    
	}
	

