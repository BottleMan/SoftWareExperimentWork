package com.srs.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletResponseAware;

import com.srs.bean.UserObj;
import com.srs.service.UserService;

/**
 * @author Bottle
 * @date 2013-4-30 上午10:18:03
 */
public class UserAction extends AbstractAction implements ServletResponseAware
{
	private static final long serialVersionUID = -3775801981884701476L;
	private HttpServletResponse response;
	private UserService userService;
	private List<HashMap<String, String>> userList;//用户信息列表
	private String successMessage;//成功信息
	private String errorMessage;//失败信息
	private UserObj userObj;//内部用户
	private String userName;//用户ID号
	private String passwordString;//密码
	private String oldPassword;//旧密码
	private String newPassword;//新密码

	public UserObj getUserObj()
	{
		return userObj;
	}

	public void setUserObj(UserObj userObj)
	{
		this.userObj = userObj;
	}

	public String getUserName()
	{
		return userName;
	}

	public void setUserName(String userName)
	{
		this.userName = userName;
	}

	public String getOldPassword()
	{
		return oldPassword;
	}

	public void setOldPassword(String oldPassword)
	{
		this.oldPassword = oldPassword;
	}

	public String getNewPassword()
	{
		return newPassword;
	}

	public void setNewPassword(String newPassword)
	{
		this.newPassword = newPassword;
	}

	public String getPasswordString()
	{
		return passwordString;
	}

	public void setPasswordString(String passwordString)
	{
		this.passwordString = passwordString;
	}

	public UserObj getUserinfo()
	{
		return userObj;
	}

	public void setUserinfo(UserObj userObj)
	{
		this.userObj = userObj;
	}

	public UserService getUserService()
	{
		return userService;
	}

	public void setUserService(UserService userService)
	{
		this.userService = userService;
	}

	public List<HashMap<String, String>> getUserList()
	{
		return userList;
	}

	public void setUserList(List<HashMap<String, String>> userList)
	{
		this.userList = userList;
	}

	public String getSuccessMessage()
	{
		return successMessage;
	}

	public void setSuccessMessage(String successMessage)
	{
		this.successMessage = successMessage;
	}

	public String getErrorMessage()
	{
		return errorMessage;
	}

	public void setErrorMessage(String errorMessage)
	{
		this.errorMessage = errorMessage;
	}

	/**
	 * 添加一条用户信息
	 * @author Bottle
	 * @date 2013-5-15 上午10:52:54
	 * @param map
	 */
	public void addUserInfor(UserObj userObj)
	{
		userService.addUserInfor(userObj);
	}

	/**
	 * 修改密码
	 * @author Bottle
	 * @date 2013-5-24 下午10:18:42
	 * @throws IOException
	 */
	public void updatePassword() throws IOException
	{
		String userName1 = (String) session.get("userName");
		HashMap map = new HashMap();
		map.put("userName", userName1);
		map.put("oldPassword", oldPassword);
		map.put("password", newPassword);
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");//防止弹出的信息出现乱码
		PrintWriter out = response.getWriter();
		if (!userService.checkPwd(map))
		{
			out.print("<script>alert('原密码不正确！')</script>");
		} else
		{
			boolean registerSuccess = userService.updatePassword(map);
			if (registerSuccess)
			{
				out.print("<script>alert('修改成功！')</script>");
			} else
			{
				out.print("<script>alert('修改失败！')</script>");
			}
		}
		out.print("<script>window.close()</script>");
		out.flush();
		out.close();
	}

	@Override
	public void setServletResponse(HttpServletResponse arg0)
	{
		this.response = arg0;
	}
}
