package kr.ac.kw.mining.dao.impl;

import java.util.List;

import kr.ac.kw.mining.dao.PageLinksDao;
import kr.ac.kw.mining.dao.impl.mapper.PageLinksMapper;
import kr.ac.kw.mining.domain.PageLink;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PageLinksDaoImpl implements PageLinksDao{
	
	@Autowired
	private PageLinksMapper pageLinksMapper;
	

	@Override
	public List<PageLink> selectPageLinkById(int id) {
		return pageLinksMapper.selectPageLinkById(id);
	}

}
