package kr.ac.kw.mining.service.impl;

import java.util.List;

import kr.ac.kw.mining.dao.CategoryLinksDao;
import kr.ac.kw.mining.domain.CategoryLinks;
import kr.ac.kw.mining.service.CategoryLinksService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryLinksServiceImpl implements CategoryLinksService {

	@Autowired
	private CategoryLinksDao categoryLinksDao;
	
	@Override
	public List<CategoryLinks> findCategoryLinksFromId(int id) {
		return categoryLinksDao.selectCategoryLinksFromId(id);
	}

}
