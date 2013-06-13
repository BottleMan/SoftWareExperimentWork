package com.srs.action;

import java.util.HashMap;

import com.srs.bean.UserObj;
import com.srs.service.UserService;

/**
 * @author Bottle
 * @date 2013-4-30 上午10:41:16
 */
public class SystemAction extends AbstractAction
{
	private static final long serialVersionUID = 703894426251902029L;
	private static final int STUDENT = 0;//身份为学生
	private static final int DEAN = 1;//身份为教务处管理员
	private static final int DEPARTMENT = 2;//身份为学院管理员
	// Service
	private UserService userService;//用户服务

	public UserService getUserService()
	{
		return userService;
	}

	public void setUserService(UserService userService)
	{
		this.userService = userService;
	}

	//内网登录验证
	public String loginCheckForInternal() throws Exception
	{
		String verifyCode = request.getParameter("verifyCode");
		if (!verifyCode.equals(session.get("snCode"))) //验证码错误
		{
			request.setAttribute("content", "验证码错误！");
			request.setAttribute("InternalLogin", "InternalLogin");
			return "loginError";
		}
		HashMap<String, String> paraMap = new HashMap<String, String>();
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		paraMap.put("userName", userName);
		paraMap.put("password", password);
		UserObj obj = userService.loginCheck(paraMap);
		if (obj != null)
		{
			session.put("userName", obj.getUserName());//帐号
			session.put("role", obj.getRole());
			session.put("isLogon", "true");
			return SUCCESS;
		} else
		{
			request.setAttribute("content", "用户名或密码错误！");
			request.setAttribute("InternalLogin", "InternalLogin");
			return "loginError";
		}
	}

	/**
	 * 身份识别
	 * @return 根据用户身份返回不同结果
	 */
	public String main()
	{
		switch (Integer.valueOf((String) session.get("role")))
		{
			case STUDENT:
				return doStuLogin();
			case DEAN:
				return "dean";
			case DEPARTMENT:
				return "department";
			default:
				return ERROR;
		}
	}

	/**
	 * 执行学生身份登录的判断
	 * @author Bottle
	 * @date 2013-5-24 下午10:44:07
	 * @return
	 */
	private String doStuLogin()
	{
		String userName = session.get("userName").toString();
		HashMap map = new HashMap();
		map.put("userName", userName);
		
		boolean isFrozen = userService.isFrozen(map);
		if (isFrozen)
		{
			request.setAttribute("content", "同学，你的学籍被冻结，不能使用选课系统；<br>请到教务处管理员处进行解冻操作。");
			request.setAttribute("InternalLogin", "InternalLogin");
			return "loginError";
		}
		
		int currentTerm = userService.getCurrentTerm();
		String term = "";
		switch (currentTerm)
		{
			case 1:
				map.put("FirstRegister", 1);
				break;
			case 2:
				map.put("SecondRegister", 1);
				break;
			case 3:
				map.put("ThirdRegister", 1);
				break;
			case 4:
				map.put("FourthRegister", 1);
				break;
			default:
				break;
		}
		
		boolean isRegist = userService.isRegist(map);
		if (isRegist)
		{
			return "student";
		} else
		{
			request.setAttribute("content", "同学，你本学期没有注册，不能使用选课系统；<br>请到教务处管理员处进行注册操作。");
			request.setAttribute("InternalLogin", "InternalLogin");
			return "loginError";
		}
	}
}
