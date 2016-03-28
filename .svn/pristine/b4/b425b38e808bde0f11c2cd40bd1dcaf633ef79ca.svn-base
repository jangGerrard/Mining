package kr.ac.kw.mining.domain;

import java.util.HashMap;
import java.util.Map;

public class Node {
	private Map<String,Object> data;
	private Map<String,Object> position;
	private boolean selected;
	
	public Node()
	{
		data = new HashMap<String,Object>();
		position = new HashMap<String,Object>();
		selected = false;
	}
	
	public Node(Map<String,Object> data ,Map<String,Object>position,boolean selected ){
		this();
		
		this.data = data;
		this.position = position;
		this.selected = selected;
	}
	
	public Map<String, Object> getData() {
		return data;
	}
	public void setData(Map<String, Object> data) {
		this.data = data;
	}
	public Map<String, Object> getPosition() {
		return position;
	}
	public void setPosition(Map<String, Object> position) {
		this.position = position;
	}
	public boolean isSelected() {
		return selected;
	}
	public void setSelected(boolean selected) {
		this.selected = selected;
	}
	
	public Node setDummyNode(int id, int posX,int posY){
		this.data.put("id", id+"");
		this.data.put("selected", false);
		this.data.put("Type", "분쟁");
		this.data.put("nodeType", "Event");
		this.data.put("name", "임진왜란"+id);
		this.data.put("Country", "조선");
		this.position.put("x", posX);
		this.position.put("y",posY);
		this.selected = false;
		
		return this;
	}
	
	public Node setNode(int id, int posX, int posY, String name, boolean selected){
		this.data.put("id", id+"");
		this.position.put("x", posX);
		this.position.put("y",posY);
		this.data.put("name", name);
		this.data.put("selected", selected);
		
		return this;
	}
	
}
