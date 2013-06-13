package com.srs.service;

import java.util.HashMap;

import com.srs.bean.UserObj;
import com.srs.dao.UserDao;

/**
 * 
 * @author Bottle
 * @date 2013-4-30 上午10:22:00
 */
public class UserService
{
	public UserDao userDao;

	public void setUserDao(UserDao userDao)
	{
		this.userDao = userDao;
	}
	
	/**
	 * 登录验证
	 * @param param 用户名和密码的hashMap
	 * @return 成功返回true，否则，返回false；
	 */
	public UserObj loginCheck(HashMap<String, String> param)
	{
		return userDao.loginCheck(param);
	}

	/**
	 * 添加一条用户信息
	 * @author Bottle
	 * @date 2013-5-15 上午10:53:20
	 * @param map
	 * @return 
	 */
	public boolean addUserInfor(UserObj userObj)
	{
		return userDao.addUserInfor(userObj);
	}

	/**
	 * 更新密码
	 * @author Bottle
	 * @date 2013-5-24 下午10:15:52
	 * @param map
	 * @return
	 */
	public boolean updatePassword(HashMap map)
	{
		return userDao.updatePassword(map);
	}

	/**
	 * 验证用户名和密码
	 * @author Bottle
	 * @date 2013-5-24 下午10:23:01
	 * @param map
	 * @return
	 */
	public boolean checkPwd(HashMap map)
	{
		return userDao.checkPwd(map);
	}

	/**
	 * 判断该学期是否已经注册
	 * @author Bottle
	 * @date 2013-5-24 下午10:40:10
	 * @param map
	 * @return
	 */
	public boolean isRegist(HashMap map)
	{
		return userDao.isRegist(map);
	}

	/**
	 * 获取当前学期
	 * @author Bottle
	 * @date 2013-5-24 下午10:43:28
	 * @return
	 */
	public int getCurrentTerm()
	{
		return userDao.getCurrentTerm();
	}

	/**
	 * 学籍是否被冻结
	 * @author Bottle
	 * @date 2013-5-28 上午10:45:55
	 * @param map
	 * @return
	 */
	public boolean isFrozen(HashMap map)
	{
		return userDao.isFrozen(map);
	}
}
