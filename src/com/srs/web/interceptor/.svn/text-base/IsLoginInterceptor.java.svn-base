package com.srs.web.interceptor;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class IsLoginInterceptor extends AbstractInterceptor
{
	private static final long serialVersionUID = 639155903092566315L;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception
	{
		//取得请求相关的ActionContext实例
		ActionContext act = invocation.getInvocationContext();
		//获取Session
		Map session = act.getSession();
		//从Session中获取用户
		String userRealName = (String) session.get("userRealName");
		//判断用户是否登录
		/*	if(userRealName==null){
				//未登录，返回重新登录
				return Action.NONE;
			}*///暂时注掉，为了调式方便。
			//执行该拦截器的下一个拦截器，如没有，执行Action被请求的相应方法
		return invocation.invoke();
	}
}
