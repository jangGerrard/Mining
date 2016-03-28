package kr.ac.kw;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import kr.ac.kw.mining.dao.TimeStampDao;
import kr.ac.kw.mining.domain.Event;
import kr.ac.kw.mining.domain.TimeStamp;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TimeStampDaoTEst {
	
	static Event event = new Event();
	
	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("test-applicationContext.xml") ;		
		TimeStampDao timeStampDao = ctx.getBean(TimeStampDao.class);
		
		List<TimeStamp> timeStamps = timeStampDao.selectTimeStampsByBetweenCenterYear(1000);
		Pattern pattern = Pattern.compile("[0-9]*");
		Matcher matcher;
		for (int i = 0; i < timeStamps.size(); i++) {
			TimeStamp timeStamp = timeStamps.get(i);
			matcher = pattern.matcher(timeStamp.getYear().trim());
			if(matcher.find()){
				event.setStart(matcher.group());
				System.out.println("group() : "+event.getStart());
			}
			
			System.out.println("timeStamp content : "+ timeStamp.getContent());
			System.out.println("============================");
		}
		System.out.println("timeStamps size : "+ timeStamps.size());
	}
}
