package joybank.util;

import java.util.Random;
import java.util.Properties;
import java.io.FileInputStream;

//유지보수성을 높이기 위해 별도 유틸클래스로 분리
public class AccountNumUtil {

//	    public static String generateAccountNumber() {
//	    	
//	        String bank_cd = getBankCodeFromProperties();//프로퍼티에서 은행코드 가져오기 ~ 불안정성으로 인해 보류
	public static String generateAccountNumber(String bank_cd) {        
        Random random = new Random();
        int part2 = random.nextInt(9000) + 1000;
        int part3 = random.nextInt(90000) + 10000;

        return new StringBuilder()
            .append(bank_cd)
            .append("-")
            .append(part2)
            .append("-")
            .append(part3)
            .toString();
    }
	    
		/*
		 * //유연성을 높이기 위해 프로퍼티에서 은행코드 가져오기..를 하려고 했으나 불안정성 때문에 보류
		 * private static String getBankCodeFromProperties() { 
		 * Properties prop = new Properties(); String
		 * bank_cd = "";
		 * 
		 * try ( FileInputStream input = new FileInputStream("config.properties") ) {
		 * prop.load(input); bank_cd = prop.getProperty("bank_cd"); } catch (Exception
		 * e) { e.printStackTrace(); }
		 * 
		 * return bank_cd; }
		 */
	}
	
