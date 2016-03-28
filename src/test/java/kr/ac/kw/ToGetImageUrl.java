package kr.ac.kw;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import kr.ac.kw.mining.dao.ImageLinksDao;
import kr.ac.kw.mining.dao.YearPageCategoryDao;
import kr.ac.kw.mining.domain.ImageLinks;
import kr.ac.kw.mining.domain.YearPageCategory;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ToGetImageUrl {

	static ApplicationContext ctx = new ClassPathXmlApplicationContext("test-applicationContext.xml") ;		
	
	static YearPageCategoryDao ypcDao  = ctx.getBean(YearPageCategoryDao.class);
	static ImageLinksDao imageLinksDao = ctx.getBean(ImageLinksDao.class);
	
	static Document doc ;

	public static void main(String[] args) {// 여기서 각페이지 이미지의 url을 가져온다
		List<ImageLinks> imageLinks = imageLinksDao.selectIlToOrderByIlTo();

		System.out.println("start");

		for (ImageLinks imageLink : imageLinks) {
			System.out.println(imageLink.getIlTo());
			try {
				String encodeResult = URLEncoder.encode(
						/* ypc.getYpcPageTitle().trim() */"파일:"
								+ imageLink.getIlTo(), "UTF-8");
				String url = "http://ko.wikipedia.org/wiki/" + encodeResult;
				// System.out.println("url : "+url );
				doc = Jsoup.connect(url).get();
				// wiki/%EC%A0%84%ED%95%9C_%EB%AC%B4%EC%A0%9C

				Element image = doc.select("img").first();
				String imgUrl = image.absUrl("src");
				imageLink.setIlUrl(imgUrl);
				System.out.println(imgUrl);
				// Elements titles = doc.select("#mw-content-text a");
				// titles.select("img");
				System.out.println();
			} catch (IOException e) {
				imageLink.setIlUrl(null);
				e.printStackTrace();
			}
		}
//		imageLinksDao.insertImageLinksUrl();
	}
	
	
	
	static int  i = 0;
	public static void insertImageLinksThatInvolvedOurTable(String[] args){
		System.out.println("start");
		List<YearPageCategory> pageIds = ypcDao.selectYearPageCategoryDicGroupById();
		
		for (YearPageCategory yearPageCategory : pageIds) {
			
			if(i % 100 == 0){
				System.out.println(i+" / "+pageIds.size());
			}
			
			List<ImageLinks> imageLinks = imageLinksDao.selectImageLinksById(yearPageCategory.getYpcPageId());
			for (ImageLinks imageLink : imageLinks) {
				imageLinksDao.insertImageLinks(imageLink);
			}
			i++;
			
		}

		
	}
}
