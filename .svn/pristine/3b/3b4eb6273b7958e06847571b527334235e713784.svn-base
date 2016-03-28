package kr.ac.kw.mining.service.impl;

import java.util.List;

import kr.ac.kw.mining.dao.CategoryDao;
import kr.ac.kw.mining.domain.Category;
import kr.ac.kw.mining.service.CategoryService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	private CategoryDao categoryDao; 
	
	@Override
	public List<Category> findPagesLikeTitle(String like) {
		return categoryDao.selectPagesLikeTitle(like);
	}

}
