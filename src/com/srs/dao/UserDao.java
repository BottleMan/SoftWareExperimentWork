package com.srs.dao;

import java.util.HashMap;

import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.srs.bean.UserObj;

/**
 * 用户信息操作DAO
 * @author Bottle
 * @date 2013-4-30 上午9:39:37
 */
public class UserDao extends SqlMapClientDaoSupport
{
	private SqlMapClientTemplate sqlMapClient = this.getSqlMapClientTemplate();

	/**
	 * 登录验证
	 * @param param
	 * @return
	 */
	public UserObj loginCheck(HashMap<String, String> param)
	{
		return (UserObj) sqlMapClient.queryForObject("checkLogin", param);
	}

	/**
	 * 添加一条用户信息
	 * @author Bottle
	 * @date 2013-5-15 上午10:53:45
	 * @param map
	 * @return 
	 */
	public boolean addUserInfor(UserObj userObj)
	{
		try
		{
			sqlMapClient.insert("addUser", userObj);
			return true;
		} catch (Exception e)
		{
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * 更新密码
	 * @author Bottle
	 * @date 2013-5-24 下午10:16:17
	 * @param map
	 * @return
	 */
	public boolean updatePassword(HashMap map)
	{
		try
		{
			sqlMapClient.update("updatePassword", map);
			return true;
		} catch (Exception e)
		{
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * 检验用户名和密码
	 * @author Bottle
	 * @date 2013-5-24 下午10:23:25
	 * @param map
	 * @return
	 */
	public boolean checkPwd(HashMap map)
	{
		int count = (Integer) sqlMapClient.queryForObject("checkPwd", map);
		if (count > 0)
		{
			return true;
		} else
		{
			return false;
		}
	}

	/**
	 * 判断是否注册
	 * @author Bottle
	 * @date 2013-5-24 下午10:40:41
	 * @param map
	 * @return
	 */
	public boolean isRegist(HashMap map)
	{
		int count = (Integer) sqlMapClient.queryForObject("isRegist", map);
		if (count > 0)
		{
			return true;
		} else
		{
			return false;
		}
	}

	/**
	 * 获取当前学期
	 * @author Bottle
	 * @date 2013-5-24 下午10:47:06
	 * @return
	 */
	public int getCurrentTerm()
	{
		return (Integer) sqlMapClient.queryForObject("getCurrentTerm");
	}

	/**
	 * 学籍是否被冻结
	 * @author Bottle
	 * @date 2013-5-28 上午10:46:29
	 * @param map
	 * @return
	 */
	public boolean isFrozen(HashMap map)
	{
		String flag = (String) sqlMapClient.queryForObject("isFrozen", map);
		if (flag.equals("0"))
		{
			return false;
		}else {
			return true;
		}
	}
}
