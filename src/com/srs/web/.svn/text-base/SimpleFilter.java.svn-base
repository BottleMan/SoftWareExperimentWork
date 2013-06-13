package com.srs.web;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Filter
 * @author Bottle
 * @date 2013-4-24 上午11:16:22
 */
public class SimpleFilter implements Filter
{
	public void destroy()
	{
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException
	{
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		HttpSession session = httpRequest.getSession();
		//得到用户的请求URI?
		String request_uri = httpRequest.getRequestURI();
		//得到Web应用程序的上下文路径
		String ctxPath = httpRequest.getContextPath();
		String uri = request_uri.substring(ctxPath.length());
		if ("/index.jsp".equals(uri) || "/servlet/verify.png".equals(uri) || "/error/sessionInvalid.jsp".equals(uri) || "/index_out.jsp".equals(uri) || "/out.action".equals(uri)
				|| "/loginCheckForInternal.action".equals(uri) || "/root/login.jsp".equals(uri) || "/error/rightError.jsp".equals(uri))
		{
			chain.doFilter(request, response);
			return;
		} else if ("/web/viewCustodyInfoForOut.action".equals(uri))
		{
			if ("true".equals(session.getAttribute("hadlogin")))
			{
				chain.doFilter(request, response);
				return;
			} else
			{
				httpResponse.sendRedirect(ctxPath + "/error/rightError.jsp");
				return;
			}
		} else
		{
			chain.doFilter(request, response);
			return;
		}
	}

	public void init(FilterConfig filterConfig) throws ServletException
	{
		// TODO Auto-generated method stub
	}
}
