package kr.ac.kw;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.ac.kw.mining.dao.YearPageCategoryDao;
import kr.ac.kw.mining.domain.YearPageCategory;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import edu.jhu.nlp.wikipedia.PageCallbackHandler;
import edu.jhu.nlp.wikipedia.WikiPage;
import edu.jhu.nlp.wikipedia.WikiXMLParser;
import edu.jhu.nlp.wikipedia.WikiXMLParserFactory;

public class YpcDicPagesExtractPageText {
	
	public static final String resultPathPrefix = "C:\\Users\\Jang\\Desktop\\mining\\YpcDicPages1\\";
	public static final String wikixmlPath = "C:\\Users\\Jang\\Desktop\\mining\\kowiki-20150602-pages-articles-multistream.xml";
	
	static ApplicationContext ctx = new ClassPathXmlApplicationContext("test-applicationContext.xml") ;
	static YearPageCategoryDao ypcDao = ctx.getBean(YearPageCategoryDao.class);
	static Map<Integer,String> maps = new HashMap<Integer ,String>();
	static Map<Integer,String> errorPages = new HashMap<Integer,String>();
	static int i =0;
	static int addedPage = 0;
	
	public static void main(String[] args) {
		
		List<YearPageCategory> yearPageCategorys = ypcDao.selectYearPageCategoryDicGroupById();
		
		for (YearPageCategory ypc : yearPageCategorys) {
			maps.put(ypc.getYpcPageId(), ypc.getYpcPageTitle());
		}
		
		//여기서 xml순차적으로 읽어가면서 만약에 원하는 것이면.
		//파일에 쓰는 것을 한다.
		
		
		WikiXMLParser wxsp = WikiXMLParserFactory.getSAXParser(wikixmlPath);
		try {

			wxsp.setPageCallback(new PageCallbackHandler() {

				public void process(WikiPage page) {
					if(maps.get(Integer.parseInt(page.getID())) != null){
						try {
//							System.out.println(resultPath);
//							System.out.println("pageTitle : "+page.getTitle().trim().trim() + ", maps : "+maps.get(Integer.parseInt(page.getID())));
//							if(page.getTitle().trim().trim().equals(maps.get(Integer.parseInt(page.getID())))){
//								String resultPath = resultPathPrefix+Integer.parseInt(page.getID().trim())+"_"+maps.get(Integer.parseInt(page.getID()))+".txt";
								String resultPath = resultPathPrefix+Integer.parseInt(page.getID().trim())+".txt";
								
								if(page.getID().equals("34"))
								{
									System.out.println("pageId : "+page.getID() );
									System.out.println("title : "+page.getTitle());
									System.out.println("maps : "+ maps.get(Integer.parseInt(page.getID())));
								}
								BufferedWriter out = new BufferedWriter(new FileWriter(resultPath,true));
//								out.write(page.getID() + "__" + page.getTitle());
//								out.write(page.getText());
//								out.flush();
//								out.close();
//							} else{
//								errorPages.put(Integer.parseInt(page.getID()), page.getTitle());
//								
//								String resultPath = resultPathPrefix+"000_error_"+Integer.parseInt(page.getID().trim())+"_"+maps.get(Integer.parseInt(page.getID()))+".txt";
//
//								BufferedWriter out = new BufferedWriter(new FileWriter(resultPath));
//								
//								out.write(page.getID() + "__" + page.getTitle());
//								out.write(page.getText());
//								out.flush();
//								out.close();
							
//							}
							
							addedPage++;
							if(addedPage % 1000 == 0){
								System.out.println("addedPage : "+addedPage);
							}
						} catch (IOException e) {
							e.printStackTrace();
						}
							
					}

					if (i % 10000 == 0) {
						System.out.println("processed : "+i );
					}
					i++;

				}
			});

			wxsp.parse();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
