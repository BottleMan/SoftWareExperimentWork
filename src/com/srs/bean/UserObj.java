package com.srs.bean;

/**
 * 用户信息实体Bean
 * 
 * @author Bottle
 * @date 2013-4-29 下午6:22:29
 */
public class UserObj
{
	private String userName;
	private String password;
	private String role;

	public String getUserName()
	{
		return userName;
	}

	public void setUserName(String userName)
	{
		this.userName = userName;
	}

	public String getPassword()
	{
		return password;
	}

	public void setPassword(String password)
	{
		this.password = password;
	}

	public String getRole()
	{
		return role;
	}

	public void setRole(String role)
	{
		this.role = role;
	}
}
