package com.srs.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.srs.bean.StudentObj;
import com.srs.bean.UserObj;

/**
 * 学生信息操作DAO
 * @author Bottle
 * @date 2013-5-1 下午12:56:23
 */
public class StudentDao extends SqlMapClientDaoSupport
{
	private SqlMapClientTemplate sqlMapClient = this.getSqlMapClientTemplate();

	/**
	 * 添加一条学生信息
	 * @param studentObj 学生信息实体
	 * @return 插入成功返回true，否则，返回false
	 */
	public boolean addStuInfor(StudentObj studentObj)
	{
		try
		{
			sqlMapClient.insert("studentAdd", studentObj);
			return true;
		} catch (Exception e)
		{
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * 获取所有学生信息
	 * @return
	 */
	public List<HashMap> getStudentInforList(StudentObj studentObj)
	{
		return getSqlMapClientTemplate().queryForList("getStuSearchList", studentObj);
	}

	/**
	 * 获取学生信息数量
	 * @param studentObj 
	 * @return
	 */
	public int getStudentInforCount(StudentObj studentObj)
	{
		Integer count = (Integer) sqlMapClient.queryForObject("stuSearchCount", studentObj);
		return count;
	}

	/**
	 * 删除
	 * @param studentId
	 * @return
	 */
	public boolean deleteStudentInfor(String studentId)
	{
		try
		{
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("studentId", studentId);
			sqlMapClient.delete("studentDelete", map);
			sqlMapClient.delete("studentUserDelete", map);
			return true;
		} catch (Exception e)
		{
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * 根据学号获取学生信息
	 * @param map
	 * @return
	 */
	public StudentObj getStudentInforById(HashMap map)
	{
		return (StudentObj) sqlMapClient.queryForList("queryStudentByID", map).get(0);
	}

	/**
	 * 更新学生信息
	 * @param studentObj
	 * @return
	 */
	public boolean studentInforUpdate(StudentObj studentObj)
	{
		try
		{
			sqlMapClient.update("studentUpdate", studentObj);
			return true;
		} catch (Exception e)
		{
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * 学期注册
	 * @param rtString 
	 * @param studentId 
	 * @return
	 */
	public boolean studentRegister(String studentId, String rtString)
	{
		HashMap<String, String> hashMap = new HashMap<String, String>();
		hashMap.put("studentId", studentId);
		hashMap.put(rtString, "1");
		try
		{
			sqlMapClient.update("studentRegister", hashMap);
			return true;
		} catch (Exception e)
		{
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * 查询是否有此学号的学生
	 * @param studentId
	 * @return
	 */
	public boolean hadStudent(String studentId)
	{
		HashMap map = new HashMap();
		map.put("studentId", studentId);
		if (sqlMapClient.queryForObject("hadStudent", map).equals(1))
		{
			return true;
		} else
		{
			return false;
		}
	}

	/**
	 * 学生【休学处理】
	 * @author Bottle
	 * @date 2013-5-22 下午4:26:05
	 * @param map
	 * @return
	 */
	public boolean studentDrop(HashMap map)
	{
		try
		{
			sqlMapClient.update("studentDrop", map);
			return true;
		} catch (Exception e)
		{
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * 添加用户账号
	 * @author Bottle
	 * @date 2013-5-24 下午9:56:03
	 * @param userObj
	 * @return
	 */
	public boolean addUserInfor(UserObj userObj)
	{
		try
		{
			sqlMapClient.update("addUserStu", userObj);
			return true;
		} catch (Exception e)
		{
			e.printStackTrace();
			return false;
		}
	}
}
