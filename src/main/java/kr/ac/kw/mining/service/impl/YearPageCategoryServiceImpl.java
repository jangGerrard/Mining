package kr.ac.kw.mining.service.impl;

import java.util.List;

import kr.ac.kw.mining.dao.YearPageCategoryDao;
import kr.ac.kw.mining.domain.YearPageCategory;
import kr.ac.kw.mining.service.YearPageCategoryService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class YearPageCategoryServiceImpl implements YearPageCategoryService{
	
	@Autowired
	private YearPageCategoryDao yearPageCategoryDao;
	
	public void modifyBCYear(YearPageCategory yearPageCategory){
		yearPageCategoryDao.updateBCYear(yearPageCategory);
	}
	
	@Override
	public List<YearPageCategory> findYearPageCategory(YearPageCategory yearPageCategory) {
		return yearPageCategoryDao.selectYearPageCategory(yearPageCategory);
	}
	
	public List<YearPageCategory> findPeopleByBirthYear(String year){
		return yearPageCategoryDao.selectPeopleByBirthYear(year);
	}

	public List<YearPageCategory> findBCYear (){
		return  yearPageCategoryDao.selectBCYear();
	}
}
