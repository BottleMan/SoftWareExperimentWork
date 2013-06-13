package com.srs.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.srs.bean.CourseObj;
import com.srs.bean.CourseSelectObj;
import com.srs.bean.StudentObj;

public class DepDao extends SqlMapClientDaoSupport
{
	private SqlMapClientTemplate sqlMapClient = this.getSqlMapClientTemplate();

	/**
	 * 学生未录入的【成绩数量】
	 * @author Bottle
	 * @date 2013-5-26 上午10:54:48
	 * @param map
	 * @return
	 */
	public int studentResultCount(HashMap map)
	{
		return (Integer) sqlMapClient.queryForObject("studentResultCount", map);
	}

	/**
	 * 学生未录入的【课程列表】
	 * @author Bottle
	 * @date 2013-5-26 上午10:57:24
	 * @param map
	 * @return
	 */
	public List<HashMap> getResultList(HashMap map)
	{
		return sqlMapClient.queryForList("getResultList", map);
	}

	/**
	 * 获取选课信息
	 * @author Bottle
	 * @date 2013-5-26 上午11:36:09
	 * @param map
	 * @return
	 */
	public HashMap courseMarkingPage(HashMap map)
	{
		return (HashMap) sqlMapClient.queryForObject("courseMarkingPage", map);
	}

	/**
	 * 录入成绩
	 * @author Bottle
	 * @date 2013-5-26 下午12:17:35
	 * @param map
	 * @return
	 */
	public boolean courseMarking(HashMap map)
	{
		try
		{
			sqlMapClient.update("courseMarking", map);
			return true;
		} catch (Exception e)
		{
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * 将选课信息插入下一学期的选课记录
	 * @author Bottle
	 * @date 2013-5-26 下午12:23:56
	 * @param map
	 */
	public void failChoose(HashMap map)
	{
		sqlMapClient.insert("failChoose", map);
	}

	/**
	 * 获取【未处理申请的数量】
	 * @author Bottle
	 * @date 2013-5-26 下午3:29:52
	 * @return
	 */
	public int subApplyCount()
	{
		return (Integer) sqlMapClient.queryForObject("subApplyCount");
	}

	/**
	 * 获取【未处理申请的列表】
	 * @author Bottle
	 * @date 2013-5-26 下午3:33:48
	 * @param map
	 * @return
	 */
	public List<HashMap> getSubApplyList(HashMap map)
	{
		return sqlMapClient.queryForList("getSubApplyList", map);
	}

	/**
	 * 处理申请
	 * @author Bottle
	 * @date 2013-5-26 下午3:55:23
	 * @param map
	 */
	public void subApplyDeal(HashMap map)
	{
		sqlMapClient.update("subApplyDeal", map);
	}

	/**
	 * 判断选课是否冲突
	 * @author Bottle
	 * @date 2013-5-26 下午4:16:15
	 * @param map
	 * @return
	 */
	public String courseClick(HashMap map)
	{
		List<HashMap> allSC = sqlMapClient.queryForList("allSC", map);
		HashMap thisClass = (HashMap) sqlMapClient.queryForObject("thisClass", map);
		String[] thisTimes = thisClass.get("schoolTime").toString().split("\\|");
		for (int i = 0; i < allSC.size(); i++)
		{
			String oldTimesStr = allSC.get(i).get("schoolTime").toString();
			String[] oldTimes = oldTimesStr.split("\\|");
			boolean flag = true;
			//如果分别是单双周
			if (Integer.valueOf(oldTimes[2]) + Integer.valueOf(thisTimes[2]) == 1)
			{
				continue;
			}
			//如果其中课程的结束周小于开始周，则不冲突
			if (Integer.valueOf(oldTimes[1]) < Integer.valueOf(thisTimes[0]) || Integer.valueOf(thisTimes[1]) < Integer.valueOf(oldTimes[0]))
			{
				continue;
			}
			//如果星期不一样，则不冲突
			if (!oldTimes[3].equals(thisTimes[3]))
			{
				continue;
			}
			//如果上课时间一样，则冲突,返回课程号
			if (oldTimes[4].equals(thisTimes[4]))
			{
				return allSC.get(i).get("courseId").toString();
			}
		}
		return "";
	}

	/**
	 * 判断学分是否已满
	 * @author Bottle
	 * @date 2013-5-26 下午4:22:15
	 * @param map
	 * @return
	 */
	public boolean pointFull(HashMap map)
	{
		Integer sum = (Integer) sqlMapClient.queryForObject("pointFull", map);
		if (sum == null)
		{
			return false;
		}
		if (sum > 18)
		{
			return true;
		} else
		{
			return false;
		}
	}

	/**
	 * 判断选课人数是否已满
	 * @author Bottle
	 * @date 2013-5-26 下午4:23:19
	 * @param map
	 * @return
	 */
	public boolean personFull(HashMap map)
	{
		int count = (Integer) sqlMapClient.queryForObject("personFull", map);
		if (count > 0)
		{
			return false;
		} else
		{
			return true;
		}
	}

	/**
	 * 判断课程是否已经选修过
	 * @author Bottle
	 * @date 2013-5-26 下午4:24:32
	 * @param map
	 * @return
	 */
	public boolean hadCourse(HashMap map)
	{
		int flag = (Integer) sqlMapClient.queryForObject("hadCS", map);
		if (flag > 0)
		{
			return true;
		} else
		{
			return false;
		}
	}

	/**
	 * 添加选课
	 * @author Bottle
	 * @date 2013-5-26 下午4:26:38
	 * @param map
	 * @return
	 */
	public void addCS(HashMap map)
	{
		sqlMapClient.insert("insertSubCS",map);
	}

	/**
	 * 查询课程信息
	 * @author Bottle
	 * @date 2013-5-26 下午6:50:48
	 * @param courseObj
	 * @return
	 */
	public List<HashMap> courseSearch(CourseObj courseObj)
	{
		return sqlMapClient.queryForList("courseSearch", courseObj);
	}

	/**
	 * 获取课程信息的数量
	 * @author Bottle
	 * @date 2013-5-26 下午9:01:43
	 * @param courseObj
	 * @return
	 */
	public int courseSearchCount(CourseObj courseObj)
	{
		return (Integer) sqlMapClient.queryForObject("courseSearchCount", courseObj);
	}

	/**
	 * 获取【选课查询列表】
	 * @author Bottle
	 * @date 2013-5-27 上午8:25:20
	 * @param map
	 * @return
	 */
	public List<HashMap> CsSearchList(HashMap map)
	{
		return sqlMapClient.queryForList("CsSearchList", map);
	}

	/**
	 * 【选课查询数量】
	 * @author Bottle
	 * @date 2013-5-27 上午8:40:14
	 * @param map
	 * @return
	 */
	public int csSearchCount(HashMap map)
	{
		return (Integer) sqlMapClient.queryForObject("csSearchCount", map);
	}

	/**
	 * 获取成绩信息列表
	 * @author Bottle
	 * @date 2013-5-27 上午9:25:24
	 * @param courseSelectObj
	 * @return
	 */
	public List<HashMap> getResultSearchList(CourseSelectObj courseSelectObj)
	{
		return sqlMapClient.queryForList("getResultSearchList", courseSelectObj);
	}

	/**
	 * 成绩信息的数量
	 * @author Bottle
	 * @date 2013-5-27 上午9:31:53
	 * @param courseSelectObj
	 * @return
	 */
	public int resultSearchCount(CourseSelectObj courseSelectObj)
	{
		return (Integer) sqlMapClient.queryForObject("resultSearchCount", courseSelectObj);
	}

	/**
	 * 学生信息列表
	 * @author Bottle
	 * @date 2013-5-27 下午1:29:07
	 * @param studentObj
	 * @return
	 */
	public List<HashMap> getStuSearchList(StudentObj studentObj)
	{
		return sqlMapClient.queryForList("getStuSearchList", studentObj);
	}

	/**
	 * 学生信息的数量
	 * @author Bottle
	 * @date 2013-5-27 下午1:36:17
	 * @param studentObj
	 * @return
	 */
	public int stuSearchCount(StudentObj studentObj)
	{
		return (Integer) sqlMapClient.queryForObject("stuSearchCount", studentObj);
	}
}
