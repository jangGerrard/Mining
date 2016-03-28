package kr.ac.kw.mining.domain;

import java.util.Date;

public class CategoryLinks {
	private int clFrom;
	private String clTo;
	private String clSortkey;
	private Date clTimeStamp;
	private String clSortKeyPrefix;
	private String clCollection;
	private ClType clType;
	
	public int getClFrom() {
		return clFrom;
	}
	public void setClFrom(int clFrom) {
		this.clFrom = clFrom;
	}
	public String getClTo() {
		return clTo;
	}
	public void setClTo(String clTo) {
		this.clTo = clTo;
	}
	public String getClSortkey() {
		return clSortkey;
	}
	public void setClSortkey(String clSortkey) {
		this.clSortkey = clSortkey;
	}
	public Date getClTimeStamp() {
		return clTimeStamp;
	}
	public void setClTimeStamp(Date clTimeStamp) {
		this.clTimeStamp = clTimeStamp;
	}
	public String getClSortKeyPrefix() {
		return clSortKeyPrefix;
	}
	public void setClSortKeyPrefix(String clSortKeyPrefix) {
		this.clSortKeyPrefix = clSortKeyPrefix;
	}
	public String getClCollection() {
		return clCollection;
	}
	public void setClCollection(String clCollection) {
		this.clCollection = clCollection;
	}
	public ClType getClType() {
		return clType;
	}
	public void setClType(ClType clType) {
		this.clType = clType;
	}
}
