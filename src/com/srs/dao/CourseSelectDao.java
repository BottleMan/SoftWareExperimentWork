package com.srs.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.srs.bean.CourseSelectObj;

/**
 * 学生-选课表操作DAO
 * @author Bottle
 * @date 2013-5-16 上午10:42:30
 */
public class CourseSelectDao extends SqlMapClientDaoSupport
{
	private SqlMapClientTemplate sqlMapClient = this.getSqlMapClientTemplate();

	/**
	 * 添加一条选课信息
	 * @author Bottle
	 * @date 2013-5-16 上午11:03:24
	 * @param obj
	 * @return
	 */
	public boolean addCS(CourseSelectObj obj)
	{
		try
		{
			sqlMapClient.insert("addCS", obj);
			return true;
		} catch (Exception e)
		{
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * 判断课程是否已经选修过
	 * @author Bottle
	 * @date 2013-5-16 上午11:15:00
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
	 * 获取选课历史
	 * @author Bottle
	 * @date 2013-5-16 下午4:46:06
	 * @param map
	 * @return
	 */
	public List<HashMap> CSHistory(HashMap map)
	{
		return sqlMapClient.queryForList("queryCSbyId", map);
	}

	/**
	 * 获取历史选课信息的数量
	 * @author Bottle
	 * @date 2013-5-17 下午3:55:33
	 * @param map
	 * @return
	 */
	public int getCSHistoryCount(HashMap map)
	{
		return (Integer) sqlMapClient.queryForObject("countCSHistory", map);
	}

	/**
	 * 删除选课
	 * @author Bottle
	 * @date 2013-5-17 下午4:28:23
	 * @param map
	 * @return
	 */
	public boolean CSDelete(HashMap map)
	{
		try
		{
			sqlMapClient.delete("csDelete", map);
			return true;
		} catch (Exception e)
		{
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * 添加【代选申请】
	 * @author Bottle
	 * @date 2013-5-20 上午9:17:10
	 * @param map
	 * @return
	 */
	public boolean addSubCS(HashMap map)
	{
		try
		{
			sqlMapClient.insert("addSubCS", map);
			return true;
		} catch (Exception e)
		{
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * 判断课程是否已经提出过申请
	 * @author Bottle
	 * @date 2013-5-20 上午9:27:32
	 * @param map
	 * @return
	 */
	public boolean hasApplyed(HashMap map)
	{
		int count = (Integer) sqlMapClient.queryForObject("hadSubCS", map);
		if (count > 0)
		{
			return true;
		} else
		{
			return false;
		}
	}

	/**
	 * 判断是否提出过【退可申请】
	 * @author Bottle
	 * @date 2013-5-21 上午9:06:22
	 * @param map
	 * @return
	 */
	public boolean hadApplyCourse(HashMap map)
	{
		int count = (Integer) sqlMapClient.queryForObject("hadApplyCourse", map);
		if (count > 0)
		{
			return true;
		} else
		{
			return false;
		}
	}

	/**
	 * 添加一条【退课申请】记录
	 * @author Bottle
	 * @date 2013-5-21 上午9:13:02
	 * @param map
	 * @return
	 */
	public boolean addCancelApplyCS(HashMap map)
	{
		try
		{
			sqlMapClient.insert("addCancelApplyCS", map);
			return true;
		} catch (Exception e)
		{
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * 获取【可退课、可注销】课程的数量
	 * @author Bottle
	 * @date 2013-5-21 上午9:23:08
	 * @param map
	 * @return
	 */
	public int getCancelCSHistoryCount(HashMap map)
	{
		return (Integer) sqlMapClient.queryForObject("getCancelCSHistoryCount", map);
	}

	/**
	 * 获取【可退课、可注销】课程列表
	 * @author Bottle
	 * @date 2013-5-21 上午9:30:05
	 * @param map
	 * @return
	 */
	public List<HashMap> getCancelCSHistory(HashMap map)
	{
		return sqlMapClient.queryForList("getCancelCSHistory", map);
	}

	/**
	 * 获取【退课申请】的数量
	 * @author Bottle
	 * @date 2013-5-21 上午10:31:47
	 * @return
	 */
	public int getCancelCSApplyCount()
	{
		return (Integer) sqlMapClient.queryForObject("getCancelCSApplyCount");
	}

	/**
	 * 获取【退课申请】
	 * @author Bottle
	 * @date 2013-5-21 上午10:35:33
	 * @param map
	 * @return
	 */
	public List<HashMap> getCancelCSApply(HashMap map)
	{
		return sqlMapClient.queryForList("getCancelCSApply", map);
	}

	/**
	 * 处理【退课申请】
	 * @author Bottle
	 * @date 2013-5-22 下午3:25:29
	 * @param map
	 * @return
	 */
	public boolean dealCancelApply(HashMap map)
	{
		try
		{
			sqlMapClient.update("dealCancelApply", map);
			return true;
		} catch (Exception e)
		{
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * 判断课程是否冲突，如果冲突，返回冲突的课程的编号
	 * @author Bottle
	 * @date 2013-5-25 上午10:27:07
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
	 * 找到课程的先修课
	 * @author Bottle
	 * @date 2013-5-25 下午3:22:18
	 * @param map
	 * @return
	 */
	public String preClass(HashMap map)
	{
		return (String) sqlMapClient.queryForObject("preClass", map);
	}

	/**
	 * 判断先修课是否已经通过
	 * @author Bottle
	 * @date 2013-5-25 下午3:26:12
	 * @param map
	 * @return
	 */
	public boolean hadPre(HashMap map)
	{
		int count = (Integer) sqlMapClient.queryForObject("hadPre", map);
		if (count > 0)
		{
			return true;
		} else
		{
			return false;
		}
	}

	/**
	 * 判断课程学分是否超过18分
	 * @author Bottle
	 * @date 2013-5-25 下午3:32:32
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
	 * 判断选课人数已满
	 * @author Bottle
	 * @date 2013-5-25 下午4:04:01
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
	 * 获取【退课申请历史的数量】
	 * @author Bottle
	 * @date 2013-5-28 下午1:19:21
	 * @param map
	 * @return
	 */
	public int getCancelApplyHisListCount(HashMap map)
	{
		return (Integer) sqlMapClient.queryForObject("getCancelApplyHisListCount", map);
	}

	/**
	 * 【退课申请历史列表】
	 * @author Bottle
	 * @date 2013-5-28 下午1:28:14
	 * @param map
	 * @return
	 */
	public List<HashMap> getCancelApplyHisList(HashMap map)
	{
		// TODO HERE
		return null;
	}
}
