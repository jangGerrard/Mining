package kr.ac.kw.mining.dao;

import java.util.List;

import kr.ac.kw.mining.domain.PageLink;

public interface PageLinksDao {
	public List<PageLink> selectPageLinkById(int id);
}
