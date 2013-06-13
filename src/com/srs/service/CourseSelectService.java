package com.srs.service;

import java.util.HashMap;
import java.util.List;

import com.srs.bean.CourseSelectObj;
import com.srs.dao.CourseSelectDao;

/**
 * 选课信息操作Service
 * @author Bottle
 * @date 2013-5-16 上午11:04:44
 */
public class CourseSelectService
{
	public CourseSelectDao courseSelectDao;

	public void setCourseSelectDao(CourseSelectDao courseSelectDao)
	{
		this.courseSelectDao = courseSelectDao;
	}

	/**
	 * 添加一条选课信息
	 * @author Bottle
	 * @date 2013-5-16 上午11:05:49
	 * @param obj
	 * @return
	 */
	public boolean addCS(CourseSelectObj obj)
	{
		return courseSelectDao.addCS(obj);
	}

	/**
	 * 判断课程是否被选择过
	 * @author Bottle
	 * @date 2013-5-16 上午11:11:47
	 * @return
	 */
	public boolean hadCourse(HashMap map)
	{
		return courseSelectDao.hadCourse(map);
	}

	/**
	 * 获取选课历史
	 * @author Bottle
	 * @date 2013-5-16 下午4:45:32
	 * @param map
	 * @return
	 */
	public List<HashMap> CSHistory(HashMap map)
	{
		return courseSelectDao.CSHistory(map);
	}

	/**
	 * 获取课程历史信息的数量
	 * @author Bottle
	 * @date 2013-5-17 下午3:55:00
	 * @param map
	 * @return
	 */
	public int getCSHistoryCount(HashMap map)
	{
		return courseSelectDao.getCSHistoryCount(map);
	}

	/**
	 * 删除选课
	 * @author Bottle
	 * @date 2013-5-17 下午4:28:00
	 * @param map
	 * @return
	 */
	public boolean CSDelete(HashMap map)
	{
		return courseSelectDao.CSDelete(map);
	}

	/**
	 * 添加【代选申请】
	 * @author Bottle
	 * @date 2013-5-20 上午9:16:41
	 * @param map
	 * @return
	 */
	public boolean addSubCS(HashMap map)
	{
		return courseSelectDao.addSubCS(map);
	}

	/**
	 * 判断此课程是否已经提出过申请
	 * @author Bottle
	 * @date 2013-5-20 上午9:26:55
	 * @param map
	 * @return
	 */
	public boolean hasApplyed(HashMap map)
	{
		return courseSelectDao.hasApplyed(map);
	}

	/**
	 * 判断是否提出过退课申请
	 * @author Bottle
	 * @date 2013-5-21 上午9:05:47
	 * @param map
	 * @return
	 */
	public boolean hadApplyCourse(HashMap map)
	{
		return courseSelectDao.hadApplyCourse(map);
	}

	/**
	 * 添加一条【退课申请】记录
	 * @author Bottle
	 * @date 2013-5-21 上午9:12:31
	 * @param map
	 * @return
	 */
	public boolean addCancelApplyCS(HashMap map)
	{
		return courseSelectDao.addCancelApplyCS(map);
	}

	/**
	 * 获取【可退课、可注销】课程的数量
	 * @author Bottle
	 * @date 2013-5-21 上午9:22:28
	 * @param map
	 * @return
	 */
	public int getCancelCSHistoryCount(HashMap map)
	{
		return courseSelectDao.getCancelCSHistoryCount(map);
	}

	/**
	 * 获取【可退课、可注销】课程列表
	 * @author Bottle
	 * @date 2013-5-21 上午9:29:37
	 * @param map
	 * @return
	 */
	public List<HashMap> getCancelCSHistory(HashMap map)
	{
		return courseSelectDao.getCancelCSHistory(map);
	}

	/**
	 * 获取【退课申请】的数量
	 * @author Bottle
	 * @date 2013-5-21 上午10:29:40
	 * @return
	 */
	public int getCancelCSApplyCount()
	{
		return courseSelectDao.getCancelCSApplyCount();
	}

	/**
	 * 获取【退课申请】
	 * @author Bottle
	 * @date 2013-5-21 上午10:35:08
	 * @param map
	 * @return
	 */
	public List<HashMap> getCancelCSApply(HashMap map)
	{
		return courseSelectDao.getCancelCSApply(map);
	}

	/**
	 * 处理【退课申请】
	 * @author Bottle
	 * @date 2013-5-22 下午3:24:59
	 * @param map
	 * @return
	 */
	public boolean dealCancelApply(HashMap map)
	{
		return courseSelectDao.dealCancelApply(map);
	}

	/**
	 * 判断课程是否冲突，如果冲突，返回冲突的课程编号
	 * @author Bottle
	 * @date 2013-5-25 上午10:26:32
	 * @param map
	 * @return
	 */
	public String courseClick(HashMap map)
	{
		return courseSelectDao.courseClick(map);
	}

	/**
	 * 找到课程的先修课
	 * @author Bottle
	 * @date 2013-5-25 下午3:21:49
	 * @param map
	 * @return
	 */
	public String preClass(HashMap map)
	{
		return courseSelectDao.preClass(map);
	}

	/**
	 * 判断先修课是否已经通过
	 * @author Bottle
	 * @date 2013-5-25 下午3:25:37
	 * @param map
	 * @return
	 */
	public boolean hadPre(HashMap map)
	{
		return courseSelectDao.hadPre(map);
	}

	/**
	 * 判断学分是否已经超过18分
	 * @author Bottle
	 * @date 2013-5-25 下午3:32:01
	 * @param map
	 * @return
	 */
	public boolean pointFull(HashMap map)
	{
		return courseSelectDao.pointFull(map);
	}

	/**
	 * 判断选课人数是否已经满了
	 * @author Bottle
	 * @date 2013-5-25 下午4:03:14
	 * @param map
	 * @return
	 */
	public boolean personFull(HashMap map)
	{
		return courseSelectDao.personFull(map);
	}

	/**
	 * 获取【退课申请历史的数量】
	 * @author Bottle
	 * @param map 
	 * @date 2013-5-28 下午1:18:06
	 * @return
	 */
	public int getCancelApplyHisListCount(HashMap map)
	{
		return courseSelectDao.getCancelApplyHisListCount(map);
	}

	/**
	 * 【退课申请历史列表】
	 * @author Bottle
	 * @date 2013-5-28 下午1:27:40
	 * @param map
	 * @return
	 */
	public List<HashMap> getCancelApplyHisList(HashMap map)
	{
		return courseSelectDao.getCancelApplyHisList(map);
	}
}
