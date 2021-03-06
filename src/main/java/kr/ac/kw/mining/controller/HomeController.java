package kr.ac.kw.mining.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Queue;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import kr.ac.kw.mining.dao.YearPageCategoryDao;
import kr.ac.kw.mining.domain.Edge;
import kr.ac.kw.mining.domain.Event;
import kr.ac.kw.mining.domain.Node;
import kr.ac.kw.mining.domain.QueryObject;
import kr.ac.kw.mining.domain.TimeLineQueryObject;
import kr.ac.kw.mining.domain.TimeStamp;
import kr.ac.kw.mining.domain.YearPageCategory;
import kr.ac.kw.mining.service.TimeStampService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private TimeStampService timeStampService;
	
	@Autowired
	private YearPageCategoryDao yearPageCategoryDao;
	
	private Queue<Integer> integers;
	
   @RequestMapping(value="login", method=RequestMethod.GET)
	public String home(Locale locale, Model model) {
		System.out.println("home");
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		return "coxTest";
	}
   
   @RequestMapping(value="main", method=RequestMethod.GET)
	public String jang(Locale locale, Model model) {
		System.out.println("jang.do");
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		return "jang";
	}
   
   @ResponseBody
   @RequestMapping(value="json", method=RequestMethod.GET)
   public Map<String,String> json(Locale locale, Model model){
	   Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		Map<String,String> maps = new HashMap<String,String>();
		maps.put("jang","jang");
		maps.put("park","park");
		maps.put("shin","shin");
		maps.put("cho","cho");
		return maps;
   }
   
   @ResponseBody
   @RequestMapping(value = "timestamp", method=RequestMethod.GET)
   public Map<String ,Object> timeLineJson(//centerYear
		   @RequestParam("yearSelection") double doubleYearSelection,
		   @RequestParam("expandValue") int expandValue,   //table을 수정해야 할것 같아  id가 없어서.
		   Locale locale, 
		   Model model){
	   int yearSelection = (int)doubleYearSelection;
	   System.out.println("yearSelection : "+yearSelection+", expandValue : "+ expandValue);
	   List<Event> events = new ArrayList<Event>();
//	   List<TimeStamp> timeStamps = timeStampService.findTimeStamps();
	   List<TimeStamp> timeStamps = timeStampService.selectTimeStampsByBetweenCenterYear(yearSelection);
	   Pattern pattern = Pattern.compile("[0-9]*");
		Matcher matcher;
		String tempTime = "";
		String time ="";
		String title ="";
//		System.out.println("timeStamps size : "+ timeStamps.size());
		for (int i = 0; i < timeStamps.size(); i++) {
			Event event = new Event(); 
			TimeStamp timeStamp = timeStamps.get(i);
			matcher = pattern.matcher(timeStamp.getYear().trim());
			if(matcher.find()){
				tempTime = matcher.group();
//				System.out.println("tempTime : " + tempTime+" , length : "+tempTime.length());
//				time = matcher.group();
				if(tempTime.length() < 4){
					int tempLen = tempTime.length();
					for(int j  = 0 ; j< 4 - tempLen ; j++){
						tempTime = "0"+tempTime;
					}
				}
//				System.out.println("resutl  time : "+tempTime);
				time = tempTime;
			}
			time += ("-"+ (timeStamp.getMonth().trim().length() == 1 ? "0"+timeStamp.getMonth().trim():timeStamp.getMonth().trim()) );
			time += ("-"+ (timeStamp.getDate().trim().length() == 1 ? "0"+timeStamp.getDate().trim() : timeStamp.getDate().trim()) );
			int lengthContent = timeStamp.getContent().length();
//			title += "";
//			title += timeStamp.getContent().substring( ( lengthContent >= 10 ?   lengthContent-10 : 0)      , lengthContent);
//			title += timeStamp.getCategory();
			title = timeStamp.getContent();
			event.setStart(time);
			if(title.length() > 15){
				title = (title.substring(0, 15) + "...");
			}
			event.setTitle(title);
			event.setDescription(timeStamp.getContent());
			events.add(event);
		}
		
//		'dateTimeFormat': 'iso8601',
//		'wikiURL': "http://simile.mit.edu/shelf/",
//		'wikiSection': "Simile Cubism Timeline",
	   
	   
	   Map<String,Object> maps = new HashMap<String,Object>();
	   maps.put("dateTimeFormat", "iso8601");
	   maps.put("wikiURL", "http://simile.mit.edu/shelf");
	   maps.put("wikiSection", "Simile Cubism Timeline");
	   maps.put("events",events);
	   
	   return maps;
   }
   
   @RequestMapping(value="vertical", method=RequestMethod.GET)
  	public String verticalTimeline(Locale locale, Model model) {
  		System.out.println("verticalTimeline Controller");
  		Date date = new Date();
  		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
  		String formattedDate = dateFormat.format(date);
  		model.addAttribute("serverTime", formattedDate );
  		return "verticalTimeline";
  	}
   
   @ResponseBody
   @RequestMapping(value = "koreanTimeLine", method=RequestMethod.GET)
   public Map<String ,Object> KoreanHistoryJson(//centerYear
		   @RequestParam("yearSelection") double dYearSelection,
		   @RequestParam("classify") int classify,   //table을 수정해야 할것 같아  id가 없어서.
		   Locale locale, 
		   Model model){
	   System.out.println("koreanTimeLine"+dYearSelection);
	   
	   int yearSelection = (int) dYearSelection;
	   TimeLineQueryObject tqo = new TimeLineQueryObject();
	   tqo.setYearSelection(yearSelection);
	   String person ="";
	   switch(classify){
	   case 1:
		   person = "한국";
		   break;
	   case 2:
		   person = "인물";
		   break;
	   case 3:
		   person = "기관";
		   break;
	   case 4:
		   person = "문화";
		   break;
	   case 5:
		   person = "시사";
		   break;
	   case 6:
		   person ="국제";
		   break;
	   case 7:
		   person="재난";
		   break;
	   case 8:
		   person="스포츠";
		   break;
	   }
	   tqo.setPersonString(person);
	   
	    
	   
	   List<YearPageCategory> ypcs = yearPageCategoryDao.selectYpcDicBtnYear(tqo); //query select events
	   Map<String,Event> eventMaps = new HashMap<String,Event>();
	   List<Event> events = new ArrayList<Event>();
	   for (YearPageCategory ypc : ypcs) {
		   Event event = new Event();
		   
		   if(eventMaps.get(ypc.getYpcPageTitle()) == null){
		   	   event.setStart(yearStringMaker(ypc.getYear()));
			   
			   //title
			   event.setTitle(ypc.getYpcPageTitle().replace("_", " "));
			   event.setLink("http://ko.wikipedia.org/wiki/"+ypc.getYpcPageTitle());
			   event.setDescription(ypc.getYpcCatTitle().replace("_"," "));
			   event.setImage("imageURl");
//			   events.add(event);
			   eventMaps.put(ypc.getYpcPageTitle(),event);
		   } else if(eventMaps.get(ypc.getYpcPageTitle()) != null){
			  event = eventMaps.get(ypc.getYpcPageTitle());
			  if(event.getEnd() == null){
				  event.setEnd(yearStringMaker(ypc.getYear()));
			  } else {
				  Integer currentYear = ypc.getYear();
				  Integer startYear = Integer.parseInt(event.getStart().split("-")[0]);//일반적인것.
				  Integer endYear = Integer.parseInt(event.getEnd().split("-")[0]);
				  
				  if(event.getStart().charAt(0) == '-'){
					  startYear = Integer.parseInt(event.getStart().split("-")[1]);//BC.
				  }if(event.getEnd().charAt(0) == '-'){
					  endYear = Integer.parseInt(event.getEnd().split("-")[1]);//BC.
				  }
				  
				  List<Integer> lists = new ArrayList<Integer>();
				  lists.add(currentYear); lists.add(startYear); lists.add(endYear);
				  //lists.sort();
				  Collections.sort(lists);
				 //event.setStart(yearStringMaker(min));
				  //event.setEnd(yearStringMaker(max));
			  }
		   }
	}
	   
		Map<String, Object> maps = new HashMap<String, Object>();
		maps.put("dateTimeFormat", "iso8601");
		maps.put("wikiURL", "http://localhost:11000/kw"); // discuss
		maps.put("wikiURL", "http://52.69.115.102:8080/Mining"); // discuss
		maps.put("wikiSection", "/nodeView.do?title=");
		events = new ArrayList<Event>(eventMaps.values());
		maps.put("events", events);
		
		return maps;
   }
   
   public String yearStringMaker(int y){
	   boolean bcYear=false;
	   Integer year = y;
	   if(year < 0){
		   year = -year;
		   bcYear  = true;
	   }
	   
	   String tempTime =  year.toString();
	   if(tempTime.length() < 4){
		   int tempLen = tempTime.length();
		   for(int j  = 0 ; j< 4 - tempLen ; j++){
			   tempTime = "0"+tempTime;
		   }
	   }
	   if(bcYear){
		   tempTime = "-"+tempTime;
		   bcYear = false;
	   }
	   tempTime = tempTime + "-01-02";
	   return tempTime;
   }
   
   @ResponseBody
   @RequestMapping(value="cytoscapeJson", method=RequestMethod.GET)
	public Map<String ,Object> nodeDisplayJson(
			@RequestParam("id") int id,
			Locale locale, 
			Model model) {
	   
	   System.out.println("nodesEdgesss");
	   integers = new LinkedList<Integer>();
	   
		Map<String,Object> maps = new HashMap<String,Object>();
		maps.put("format_version", "1.0");
		maps.put("generated_by", "cytoscape-3.2.0");
		maps.put("target_cytoscapejs_version","~2.1");
		Map<String,Object> data = new HashMap<String,Object>();
		data.put("selected", true);
		data.put("__Annotations",new ArrayList<Object>());
		data.put("shared_name", "WineCheeseNetwork");
		data.put("SUID", 52);
		data.put("name","WineCheeseNetwork");
		maps.put("data",data);
		Map<String,Object> elements = new HashMap<String,Object>();
		List<Node> nodes;
		List<Edge> edges;
		Map<Integer ,Node> nodeMap = new HashMap<Integer, Node>();
		Map<String,Edge> edgeMap = new HashMap<String,Edge>();
		
		/*
		 * 
		 *  TODO word2vec wait until finished
		 *  
		String title = yearPageCategoryDao.selectYearPageCategoryDicByPageId(id);
		
		List<Word2Vec> word2Vecs = yearPageCategoryDao.selectWord2VecByTitle(title);
		for(int i = 0 ; i < word2Vecs.size();i++){
			Word2Vec word2Vec = word2Vecs.get(i);
			System.out.println("word2vec\n"+word2Vec.getTitle()+","+word2Vec.getNumWords()+"\n");
		}
		*
		*
		*/
		
		
		QueryObject qo = new QueryObject();
		qo.setId(id);
		qo.setLimit(50);
		List<YearPageCategory>ypcs  = yearPageCategoryDao.selectPageIdsByPagelinks(qo);
		
		for(int i = 0 ; i < ypcs.size(); i++){
//			Node 
			Node node = new Node().setNode(ypcs.get(i).getYpcPageId(), i * 100  , 0 ,ypcs.get(i).getYpcPageTitle(),false);
			nodeMap.put(ypcs.get(i).getYpcPageId(),node);
			//setNodesAndEdges(nodeMap,edgeMap ,qo, 0,new Point(1,1));
			setNodesAndEdges(nodeMap,edgeMap,node,0);
		}
		
		edges = new ArrayList<Edge>(edgeMap.values());
		nodes = new ArrayList<Node>(nodeMap.values());
		elements.put("nodes", nodes);
		elements.put("edges", edges);
		maps.put("elements",elements);
		return maps;
	}
   
   private void setNodesAndEdges(Map<Integer, Node> nodeMap,
		Map<String, Edge> edgeMap, Node node, int depth) {
	   
//	   List<YearPageCategory>ypcs  = yearPageCategoryDao.selectPageIdsByPagelinks(qo);
   }
   
//   public void setNodesAndEdges(Map<Integer ,Node> nodeMap,Map<String,Edge> edgeMap ,QueryObject qo, int depth,Point point){
//	  
//	   if(depth < 2){
//		   
//		   List<YearPageCategory>ypcs  = yearPageCategoryDao.selectPageIdsByPagelinks(qo);
//		   System.out.println("queryFinished at depth : "+depth +"qo : "+qo.getId() + " , ");
//		   
//		   for(int i = 0 ; i < ypcs.size(); i++){
//			   int x=1;  int y=1;
//			   if(depth == 0){
//				   x = 100*i;
//				   y =1;
//			   }
//			   if(depth == 1){
//				   x = point.getX();
//				   y = point.getY() * i * 100;
//			   }
//			   
//			   nodeMap.put(ypcs.get(i).getYpcPageId(),new Node().setNode(ypcs.get(i).getYpcPageId(),x , y,ypcs.get(i).getYpcPageTitle(),false));
//			   edgeMap.put(qo.getId()+"."+ypcs.get(i).getYpcPageId() , new Edge().setEdge(qo.getId()+"."+ypcs.get(i).getYpcPageId(), qo.getId(), ypcs.get(i).getYpcPageId(), false));
//			   
//			   
//			   
//			   QueryObject subQo = new QueryObject();
//			   subQo.setId(ypcs.get(i).getYpcPageId());
//			   subQo.setLimit(5);
//			   
//			   setNodesAndEdges(nodeMap, edgeMap, subQo, depth +1,new Point(x,y));
//		   }
//	   }
//   }
   


@RequestMapping(value="nodeView", method=RequestMethod.GET)
	public String nodeView(
			Locale locale, 
			Model model,
			@RequestParam("title") String title,
			HttpSession session) {
		System.out.println("nodeView.do");
		System.out.println("title : "+title);
		List<YearPageCategory> yearPageCategorys = yearPageCategoryDao.selectFindIdByTitle(title);
		int id = 0;
		for(int i = 0 ; i < yearPageCategorys.size();i++){
			id = yearPageCategorys.get(i).getYpcPageId();
		}
		System.out.println("nodeView id : "+id);
		session.setAttribute("pageId", id);
		return "graph";
	}

	@RequestMapping(value="cox", method=RequestMethod.GET)
	public String cox(Locale locale, Model model) {
		System.out.println("home");
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		return "coxText";
	}

   
	
}


class YpcOrderByYear implements Comparator<YearPageCategory>{

	@Override
	public int compare(YearPageCategory o1, YearPageCategory o2) {
		if( o1.getYear() > o2.getYear()){
			return 1;
		} else if( o1.getYear() < o2.getYear()){
			return -1;
		}
		return 0;
	}
	
}

class Point{
	private int x;
	private int y;
	
	public Point(int x, int y ){
		this.x = x;
		this.y = y;
	}
	public int getX() {
		return x;
	}
	public void setX(int x) {
		this.x = x;
	}
	public int getY() {
		return y;
	}
	public void setY(int y) {
		this.y = y;
	}
}