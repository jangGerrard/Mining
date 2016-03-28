package kr.ac.kw.mining.service;

import java.util.List;

import kr.ac.kw.mining.domain.YearPageCategory;

public interface YearPageCategoryService {
	
	public void modifyBCYear(YearPageCategory yearPageCategory);
	
	public List<YearPageCategory> findYearPageCategory(YearPageCategory yearPageCategory);
	
	public List<YearPageCategory> findPeopleByBirthYear(String year);
	
	public List<YearPageCategory> findBCYear ();
}
