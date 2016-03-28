package kr.ac.kw.mining.domain;

import java.io.InputStream;

public class Page {
	private int pageId;
	private int pageNamespace;
//	private InputStream pageTitle;
	private String pageTitle;
	private String pageRestrictions;
	private int pageCounter;
	private int pageIsRedirect;
	private int pageIsNew;
	private double pageRandom;
	private String pageTouched;
	private String pageLinksUpdated;
	private int pageLatest;
	private int pageLen;
	private String pageContentModel;
//	public InputStream getPageTitle() {
//		return pageTitle;
//	}
//	public void setPageTitle(InputStream pageTitle) {
//		this.pageTitle = pageTitle;
//	}
	private String pageText;
	
	public int getPageId() {
		return pageId;
	}
	public void setPageId(int pageId) {
		this.pageId = pageId;
	}
	public int getPageNamespace() {
		return pageNamespace;
	}
	public void setPageNamespace(int pageNamespace) {
		this.pageNamespace = pageNamespace;
	}
	public String getPageTitle() {
		return pageTitle;
	}
	public void setPageTitle(String pageTitle) {
		this.pageTitle = pageTitle;
	}
	public String getPageRestrictions() {
		return pageRestrictions;
	}
	public void setPageRestrictions(String pageRestrictions) {
		this.pageRestrictions = pageRestrictions;
	}
	public int getPageCounter() {
		return pageCounter;
	}
	public void setPageCounter(int pageCounter) {
		this.pageCounter = pageCounter;
	}
	public int getPageIsRedirect() {
		return pageIsRedirect;
	}
	public void setPageIsRedirect(int pageIsRedirect) {
		this.pageIsRedirect = pageIsRedirect;
	}
	public int getPageIsNew() {
		return pageIsNew;
	}
	public void setPageIsNew(int pageIsNew) {
		this.pageIsNew = pageIsNew;
	}
	public double getPageRandom() {
		return pageRandom;
	}
	public void setPageRandom(double pageRandom) {
		this.pageRandom = pageRandom;
	}
	public String getPageTouched() {
		return pageTouched;
	}
	public void setPageTouched(String pageTouched) {
		this.pageTouched = pageTouched;
	}
	public String getPageLinksUpdated() {
		return pageLinksUpdated;
	}
	public void setPageLinksUpdated(String pageLinksUpdated) {
		this.pageLinksUpdated = pageLinksUpdated;
	}
	public int getPageLatest() {
		return pageLatest;
	}
	public void setPageLatest(int pageLatest) {
		this.pageLatest = pageLatest;
	}
	public int getPageLen() {
		return pageLen;
	}
	public void setPageLen(int pageLen) {
		this.pageLen = pageLen;
	}
	public String getPageContentModel() {
		return pageContentModel;
	}
	public void setPageContentModel(String pageContentModel) {
		this.pageContentModel = pageContentModel;
	}
	public String getPageText() {
		return pageText;
	}
	public void setPageText(String pageText) {
		this.pageText = pageText;
	}

}
