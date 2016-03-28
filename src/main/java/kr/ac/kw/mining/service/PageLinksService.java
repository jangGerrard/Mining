package kr.ac.kw.mining.service;

import java.util.List;

import kr.ac.kw.mining.domain.PageLink;

public interface PageLinksService {
	public List<PageLink> findPageLinkById(int id);
}
