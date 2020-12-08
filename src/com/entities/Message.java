package com.entities;

public class Message {

	private String content;
	private String type;
	private String cssContent;
	
	
	public Message(String content, String type, String cssContent) {
		super();
		this.content = content;
		this.type = type;
		this.cssContent = cssContent;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public String getCssContent() {
		return cssContent;
	}


	public void setCssContent(String cssContent) {
		this.cssContent = cssContent;
	}
	
	//getters and setters

	
}
