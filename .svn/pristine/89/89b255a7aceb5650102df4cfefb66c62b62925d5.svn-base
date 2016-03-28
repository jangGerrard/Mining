package kr.ac.kw.mining.dao.impl;

import java.util.List;

import kr.ac.kw.mining.dao.YearPageCategoryDao;
import kr.ac.kw.mining.dao.impl.mapper.YearPageCategoryMapper;
import kr.ac.kw.mining.domain.QueryObject;
import kr.ac.kw.mining.domain.TimeLineQueryObject;
import kr.ac.kw.mining.domain.Word2Vec;
import kr.ac.kw.mining.domain.YearPageCategory;
import kr.ac.kw.mining.domain.YearPageCategoryDic;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class YearPageCategoryDaoImpl implements YearPageCategoryDao{

	@Autowired
	private YearPageCategoryMapper yearPageCategoryMapper;
	
	
	@Override
	public void insertYearPageCategory(
			YearPageCategory yearPageCategory) {
		yearPageCategoryMapper.insertYearPageCategory(yearPageCategory);
	}
	
	public void insertYearPageCategoryDic(YearPageCategoryDic yearPageCategoryDic){
		yearPageCategoryMapper.insertYearPageCategoryDic(yearPageCategoryDic);
	}
	
	public void updateBCYear(YearPageCategory yearPageCategory){
		yearPageCategoryMapper.updateBCYear(yearPageCategory);
	}
	
	public void updatePerson(Integer ypcId){
		yearPageCategoryMapper.updatePerson(ypcId);
	}

	public List<YearPageCategory> selectYearPageCategory(YearPageCategory yearPageCategory){
		return yearPageCategoryMapper.selectYearPageCategory(yearPageCategory);
	}

	@Override
	public List<YearPageCategory> selectPeopleByBirthYear(String year) {
		return yearPageCategoryMapper.selectPeopleByBirthYear(year);
	}
	
	public List<YearPageCategory> selectBCYear (){
		return yearPageCategoryMapper.selectBCYear();
	}

	@Override
	public List<YearPageCategory> selectYearPageCategorys() {
		return yearPageCategoryMapper.selectYearPageCategorys();
	}
	
	public List<Integer> selectYpcPageIds(){
		return yearPageCategoryMapper.selectYpcPageIds();
	}
	
	public List<YearPageCategory> selectYearPageCategorysByPageId(int pageId){
		return yearPageCategoryMapper.selectYearPageCategorysByPageId(pageId);
	}
	
	public List<YearPageCategory> selectYpcDicBtnYear(TimeLineQueryObject tqo){
		return yearPageCategoryMapper.selectYpcDicBtnYear(tqo);
	}
	
	public List<YearPageCategory> selectYpcDic(){
		return yearPageCategoryMapper.selectYpcDic();
	}
	
	public List<YearPageCategory> selectYearPageCategoryDicGroupById(){
		return yearPageCategoryMapper.selectYearPageCategoryDicGroupById();
	}
	
	public List<YearPageCategory> selectFindIdByTitle(String title){
		return yearPageCategoryMapper.selectFindIdByTitle(title);
	}
	
	public String selectYearPageCategoryDicByPageId(int id){
		return yearPageCategoryMapper.selectYearPageCategoryDicByPageId(id);
	}
	
	public List<Word2Vec> selectWord2VecByTitle(String title){
		return yearPageCategoryMapper.selectWord2VecByTitle(title);
	}
	
	public List<YearPageCategory> selectRelatedPagesJoinCategorylinksById(QueryObject query){
		return yearPageCategoryMapper.selectRelatedPagesJoinCategorylinksById(query);
	}
	
	public List<YearPageCategory> selectRelatedPagesJoinCategorylinksByIds(List<Integer> ids){
		return yearPageCategoryMapper.selectRelatedPagesJoinCategorylinksByIds(ids);
	}
	
	public List<YearPageCategory> selectBornAndDeadList(){
		return yearPageCategoryMapper.selectBornAndDeadList();
	}
	
	public List<String> selectYpcCatTitles(){
		return yearPageCategoryMapper.selectYpcCatTitles();
	}
	
	public List<YearPageCategory> selectPageIdsByPagelinks(QueryObject query){
		return yearPageCategoryMapper.selectPageIdsByPagelinks(query);
	}
}
