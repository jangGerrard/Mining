package kr.ac.kw;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import kr.ac.kw.mining.dao.YearPageCategoryDao;
import kr.ac.kw.mining.domain.YearPageCategory;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ExtractYpcCatTitle {
	static ApplicationContext ctx = new ClassPathXmlApplicationContext("test-applicationContext.xml") ;		
	static YearPageCategory ypc = new YearPageCategory();
	public static void main(String[] args){
		YearPageCategoryDao ypcDao = ctx.getBean(YearPageCategoryDao.class);
		List<YearPageCategory> yearPageCategorys = ypcDao.selectBCYear();
		
		Pattern p = Pattern.compile("[0-9]+년_(.*)");
		Matcher m ;
		
		
		
		Map<String,String> maps = new HashMap<String,String>();
		
		
		
		
		List<String> temp = ypcDao.selectYpcCatTitles();
		for (String string : temp) {
//			System.out.println("string : " + string);
			m = p.matcher(string);
			while(m.find()){
				String founded = m.group(1);
				if(maps.get(founded) == null){
					maps.put(founded, founded);
					System.out.println(founded);
				}
			}
		}
		
//		for(int i =0  ; i < maps.size(); i++){
//			System.out.println(maps.get(i));
//		}
		
		System.out.println("end of main , size : "+maps.size());
		
	}
}
