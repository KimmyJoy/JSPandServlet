package com.example.demo;

public class User {
	private String name;
	private String address;
	private String email;
	//vo랑 dao를 여기다 넣으면 된다...? beans 이면서 ??역할을 함
	public User(String name, String address, String email) {
		super();
		this.name = name;
		this.address = address;
		this.email = email;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
