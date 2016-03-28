package kr.ac.kw.mining.service.impl;

import java.util.List;

import kr.ac.kw.mining.dao.PageLinksDao;
import kr.ac.kw.mining.domain.PageLink;
import kr.ac.kw.mining.service.PageLinksService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PageLinksServiceImpl implements PageLinksService {
	
	@Autowired
	private PageLinksDao pageLinksDao;

	@Override
	public List<PageLink> findPageLinkById(int id) {
		return pageLinksDao.selectPageLinkById(id);
	}
	
}
