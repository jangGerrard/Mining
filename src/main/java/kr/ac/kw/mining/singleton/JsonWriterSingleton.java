package kr.ac.kw.mining.singleton;

import java.io.File;
import java.io.IOException;

import org.codehaus.jackson.JsonEncoding;
import org.codehaus.jackson.JsonFactory;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonGenerator;

public class JsonWriterSingleton {
	
	private static JsonWriterSingleton jsonWriterSingleton;
	private JsonFactory jfactory ;
	private JsonGenerator jGenerator;
	private JsonGenerator jEdgeGenerator;
	private String jsonFilePath = "C:\\Users\\Jang\\Desktop\\test.json";
	private String jsonEdgePath = "C:\\Users\\Jang\\Desktop\\edge.json";
	
	private JsonWriterSingleton(){
		jfactory = new JsonFactory();
		try {
			jGenerator = jfactory.createJsonGenerator(new File(jsonFilePath),JsonEncoding.UTF8);
			jEdgeGenerator = jfactory.createJsonGenerator(new File(jsonEdgePath),JsonEncoding.UTF8);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static  JsonWriterSingleton getInstance(){
		if(jsonWriterSingleton == null){
			jsonWriterSingleton = new JsonWriterSingleton();
		}
		return jsonWriterSingleton;
	}
	
	public void makeJsonStrBeforeWriteNode(){
		try{
			jGenerator.writeStartObject();//맨처음
			jGenerator.writeStringField("format_version", "1.0");
			jGenerator.writeStringField("generated_by", "cytoscape-3.2.0");
			jGenerator.writeStringField("target_cytoscapejs_version", "~2.1");
			
			jGenerator.writeFieldName("data");
			jGenerator.writeStartObject();							//data
			jGenerator.writeBooleanField("selected", true);
			jGenerator.writeFieldName("__Annotations");
				jGenerator.writeStartArray();
				jGenerator.writeEndArray();
			jGenerator.writeStringField("shared_name", "WineCheeseNetwork");
			jGenerator.writeFieldName("SUID");
			jGenerator.writeNumber(52);
			jGenerator.writeStringField("name", "WineCheeseNetwork");
			jGenerator.writeEndObject();							//data
			
			
			jGenerator.writeFieldName("elements");				//elements
			jGenerator.writeStartObject();
			
			jGenerator.writeFieldName("nodes");
			jGenerator.writeStartArray();							//nodes
		} catch(Exception ex){
			ex.printStackTrace();
		}
		
	}
	
	public void makeNodeJsonString(int id, String name, String nodeType, int yearBorn,
									double posX, double posY){
		try {
			/**/
			jGenerator.writeStartObject();
			
			/*data start*/
			jGenerator.writeFieldName("data");
			jGenerator.writeStartObject();
//			jGenerator.writeFieldName("id");
//			jGenerator.writeNumber(id);
			jGenerator.writeStringField("id", id+"");
			jGenerator.writeStringField("name", name);
			jGenerator.writeStringField("nodeType", nodeType);
			jGenerator.writeStringField("yearBorn", yearBorn+"");
			jGenerator.writeEndObject();
			/*data end*/
			
			/*position start*/
			jGenerator.writeFieldName("position");
			jGenerator.writeStartObject();
			jGenerator.writeFieldName("x");
			jGenerator.writeNumber(posX);
			jGenerator.writeFieldName("y");
			jGenerator.writeNumber(posY);
			jGenerator.writeEndObject();
			/*position end*/
			
			jGenerator.writeBooleanField("selected", false);
			jGenerator.writeEndObject();
			/**///여러개
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void makeBeforeWriteEdges(){
		try{
			jGenerator.writeEndArray();							//nodes end
			
			jGenerator.writeFieldName("edges");
			jGenerator.writeStartArray();							//edges
		} catch (Exception e){
			e.printStackTrace();
		}
	}
	
	public void startEdges(){
		try{
			jGenerator.writeStartObject();
			jGenerator.writeFieldName("edges");
			jGenerator.writeStartArray();							//edges
		}catch (Exception e){
			e.printStackTrace();
		}
	}
	
	public void makeEdgeJsonString(String id, String source, String target){
		try {
//			jGenerator.writeStartObject();
			
			jGenerator.writeFieldName("data");
			jGenerator.writeStartObject();
			
			jGenerator.writeStringField("id", id);
			jGenerator.writeStringField("source", source);
			jGenerator.writeStringField("target", target);
			
			jGenerator.writeEndObject();
//			jGenerator.writeEndObject();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void endEdges(){
		
		try {
			jGenerator.writeEndArray();	//edges ends
			jGenerator.writeEndObject();
			jGenerator.close();
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}						
	}
	
	public void endRemainJsonString(){
		try{
			jGenerator.writeEndArray();
			jGenerator.writeEndObject();							//elements end
			jGenerator.writeEndObject();///맨처음껏
			jGenerator.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
