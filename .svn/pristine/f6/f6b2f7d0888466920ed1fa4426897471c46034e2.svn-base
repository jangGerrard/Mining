package kr.ac.kw;

import kr.ac.kw.mining.dao.PageLinksDao;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class PagelinksDaoTest {
	static ApplicationContext ctx = new ClassPathXmlApplicationContext("test-applicationContext.xml") ;		
	
	public static void main(String[] args) {
		PageLinksDao dao = ctx.getBean(PageLinksDao.class);
		long start = System.currentTimeMillis();
		dao.selectPageLinkById(5);
		long end = System.currentTimeMillis();

		System.out.println( "실행 시간 : " + ( end - start )/1000.0 ); 

	}
}
