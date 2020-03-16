package com.team.project.shop.dto;

public class ShopDto {
	private int code;
	private String name;
	private int price;
	private String content;
	private String id;
	
	public ShopDto() {}

	public ShopDto(int code, String name, int price, String content, String id) {
		super();
		this.code = code;
		this.name = name;
		this.price = price;
		this.content = content;
		this.id = id;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
