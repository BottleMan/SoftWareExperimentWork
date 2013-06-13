package com.srs.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.srs.bean.CourseObj;

/**
 * 课程信息操作DAO
 * @author Bottle
 * @date 2013-4-30 下午7:35:11
 */
public class CourseDao extends SqlMapClientDaoSupport
{
	private SqlMapClientTemplate sqlMapClient = this.getSqlMapClientTemplate();

	/**
	 * 根据学期和专业查找课程
	 * @param param
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<CourseObj> queryCourseBySemAndMajor(HashMap<String, String> param)
	{
		return sqlMapClient.queryForList("queryCourseBySemesterAndMajor", param);
	}

	/**
	 * 查询所有课程信息
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<CourseObj> queryCourseAll()
	{
		return sqlMapClient.queryForList("queryCourseAll");
	}

	/**
	 * 添加课程信息
	 * @param courseObj
	 */
	public boolean addCourse(CourseObj courseObj)
	{
		try
		{
			sqlMapClient.insert("courseAdd", courseObj);
			return true;
		} catch (Exception e)
		{
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * 更新课程信息
	 * @param courseObj
	 */
	public void updateCourse(CourseObj courseObj)
	{
		sqlMapClient.update("courseUpdate", courseObj);
	}

	/**
	 * 删除课程信息
	 * @param id 课程id
	 */
	public void deleteCourse(HashMap id)
	{
		sqlMapClient.delete("courseDelete", id);
	}

	/**
	 * 判断是否有此编号的课程
	 * @param courseId
	 * @return
	 */
	public boolean hadCourse(String courseId)
	{
		HashMap<String, String> hashMap = new HashMap<String, String>();
		hashMap.put("courseId", courseId);
		int num = (Integer) sqlMapClient.queryForObject("hadCourse", hashMap);
		if (num != 0)
		{
			return true;
		} else
		{
			return false;
		}
	}

	/**
	 * 获取课程数量
	 * @param courseObj 
	 * @return
	 */
	public int getCourseCount(CourseObj courseObj)
	{
		return (Integer) sqlMapClient.queryForObject("courseSearchCount", courseObj);
	}

	/**
	 * 获取课程信息
	 * @param courseObj 
	 * @return
	 */
	public List<HashMap> getCourseList(CourseObj courseObj)
	{
		return sqlMapClient.queryForList("courseSearch", courseObj);
	}
	
	/**
	 * 根据课程编号查询课程信息
	 * @author Bottle
	 * @date 2013-5-15 上午9:31:38
	 * @param map
	 * @return
	 */
	public CourseObj getCourseInforById(HashMap map)
	{
		return (CourseObj) sqlMapClient.queryForObject("getCourseInforById", map);
	}

	/**
	 * 更新课程基本信息
	 * @author Bottle
	 * @date 2013-5-15 上午10:23:30
	 * @param courseObj
	 * @return
	 */
	public boolean courseInforUpdate(CourseObj courseObj)
	{
		try
		{
			sqlMapClient.update("courseUpdate", courseObj);
			return true;
		} catch (Exception e)
		{
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * 获取所有可以注册的课程的数量
	 * @author Bottle
	 * @date 2013-5-16 上午9:39:13
	 * @param map
	 * @return
	 */
	public int getRCourseCount(HashMap map)
	{
		return (Integer) sqlMapClient.queryForObject("getRCourseCount", map);
	}

	/**
	 * 获取可注册课程的基本信息列表
	 * @author Bottle
	 * @date 2013-5-16 上午9:43:10
	 * @param map
	 * @return
	 */
	public List<HashMap> getRCourseList(HashMap map)
	{
		return sqlMapClient.queryForList("getRCourseInfoList", map);
	}

	/**
	 * 获取【可代选】课程信息
	 * @author Bottle
	 * @date 2013-5-20 下午10:12:23
	 * @param map
	 * @return
	 */
	public List<HashMap> getSubCourseInfoList(HashMap map)
	{
		return sqlMapClient.queryForList("getSubCourseInfoList", map);
	}

	/**
	 * 获取【可撤销代选】数量
	 * @author Bottle
	 * @date 2013-5-20 下午10:23:53
	 * @param map
	 * @return
	 */
	public int getCancelRCourseCount(HashMap map)
	{
		return (Integer) sqlMapClient.queryForObject("getCancelSubRCCount", map);
	}

	/**
	 * 获取【可撤销代选】列表
	 * @author Bottle
	 * @date 2013-5-20 下午10:29:42
	 * @param map
	 * @return
	 */
	public List<HashMap> getCancelSubRCList(HashMap map)
	{
		return sqlMapClient.queryForList("getCancelSubRCList", map);
	}

	/**
	 * 【撤销代选】
	 * @author Bottle
	 * @date 2013-5-20 下午11:09:33
	 * @param map
	 */
	public void subCancelCS(HashMap map)
	{
		sqlMapClient.delete("subCancelCS", map);
	}
}
