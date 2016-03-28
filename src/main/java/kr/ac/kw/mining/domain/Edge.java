package kr.ac.kw.mining.domain;

import java.util.HashMap;
import java.util.Map;

public class Edge {
	private Map<String,Object> data;
	private boolean selected ;
	
	public Edge(){
		data = new HashMap<String,Object>();
		selected = false;
	}
	
	public Edge(Map<String, Object> data, boolean selected) {
		this();
		
		this.data = data;
		this.selected = selected;
	}
	
	public Map<String, Object> getData() {
		return data;
	}
	public void setData(Map<String, Object> data) {
		this.data = data;
	}
	public boolean isSelected() {
		return selected;
	}
	public void setSelected(boolean selected) {
		this.selected = selected;
	}
	
	public Edge setDummyEdge(int edgeId,int source, int target){
		this.data.put("id", edgeId+"");
		this.data.put("source", source+"");
		this.data.put("target", target+"");
		this.data.put("selected", false);
		this.data.put("interaction", "cc");
		this.selected = false;
		return this;
	}
	
	public Edge setEdge(String edgeId, int source, int target, boolean selected){
		this.data.put("id", "e"+edgeId);
		this.data.put("source", source+"");
		this.data.put("target", target+"");
		this.data.put("selected", selected);
		this.data.put("interaction", "cc");
		this.selected = selected;
		return this;
	}
	
	
}
