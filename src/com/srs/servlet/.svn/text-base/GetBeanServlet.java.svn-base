package com.srs.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

/**
 * 
 * @author Bottle
 * @date 2013-4-24 上午11:35:15
 */
public class GetBeanServlet extends HttpServlet
{
	private static final long serialVersionUID = 6831368987930104430L;
	private static WebApplicationContext context;

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy()
	{
		super.destroy(); // Just puts "destroy" string in log
		System.out.print("=========================");
		// Put your code here
	}

	/**
	 * Initialization of the servlet. <br>
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException
	{
		context = WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
	}

	public static Object getBean(String id)
	{
		Object bean = context.getBean(id);
		return bean;
	}
}
