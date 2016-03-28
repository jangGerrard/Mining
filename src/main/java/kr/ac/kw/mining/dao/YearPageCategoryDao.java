package kr.ac.kw.mining.dao;

import java.util.List;

import kr.ac.kw.mining.domain.QueryObject;
import kr.ac.kw.mining.domain.TimeLineQueryObject;
import kr.ac.kw.mining.domain.Word2Vec;
import kr.ac.kw.mining.domain.YearPageCategory;
import kr.ac.kw.mining.domain.YearPageCategoryDic;

public interface YearPageCategoryDao {
	
	public void insertYearPageCategory(YearPageCategory yearPageCategory);
	
	public void insertYearPageCategoryDic(YearPageCategoryDic yearPageCategoryDic);
	
	public void updateBCYear(YearPageCategory yearPageCategory);
	
	public void updatePerson(Integer ypcId);
	
	public List<YearPageCategory> selectYearPageCategory(YearPageCategory yearPageCategory);
	
	public List<YearPageCategory> selectPeopleByBirthYear(String year );
	
	public List<YearPageCategory> selectBCYear ();
	
	public List<YearPageCategory> selectYearPageCategorys();
	
	public List<Integer> selectYpcPageIds();
	
	public List<YearPageCategory> selectYearPageCategorysByPageId(int pageId);
	
	public List<YearPageCategory> selectYpcDicBtnYear(TimeLineQueryObject tqo);
	
	public List<YearPageCategory> selectYpcDic();

	public List<YearPageCategory> selectYearPageCategoryDicGroupById();
	
	public List<YearPageCategory> selectFindIdByTitle(String title);
	
	public String selectYearPageCategoryDicByPageId(int id);
	
	public List<Word2Vec> selectWord2VecByTitle(String title);
	
	public List<YearPageCategory> selectRelatedPagesJoinCategorylinksById(QueryObject query);
	
	public List<YearPageCategory> selectRelatedPagesJoinCategorylinksByIds(List<Integer> ids);
	
	public List<YearPageCategory> selectBornAndDeadList();
	
	public List<String> selectYpcCatTitles();
	
	public List<YearPageCategory> selectPageIdsByPagelinks(QueryObject query);
	
}