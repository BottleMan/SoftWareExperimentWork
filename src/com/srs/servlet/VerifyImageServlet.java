package com.srs.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.srs.common.ImageVerifier;

/**
 * 验证图片的Servlet
 * @author Bottle
 * @date 2013-4-24 上午11:43:05
 */
public class VerifyImageServlet extends HttpServlet
{
	private static final long serialVersionUID = 835804693638021092L;

	public VerifyImageServlet()
	{
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		processRequest(req, resp);
	}

	@Override
	public void init(ServletConfig config) throws ServletException
	{
		super.init(config);
	}

	@Override
	public void destroy()
	{
		super.destroy();
	}

	/** 
	* Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
	* @param request servlet request
	* @param response servlet response
	*/
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.reset();
		response.setContentType("image/png");
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		HttpSession sn = null;
		sn = request.getSession(true);
		//sn.setMaxInactiveInterval(60);
		sn.setAttribute("snCode", ImageVerifier.getImageString(4, "png", response.getOutputStream()));
	}
}
