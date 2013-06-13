package com.srs.service;

import java.util.HashMap;
import java.util.List;

import com.srs.bean.CourseObj;
import com.srs.dao.CourseDao;

/**
 * 课程操作service
 * @author Bottle
 * @date 2013-5-10 上午11:35:19
 */
public class CourseService
{
	public CourseDao courseDao;

	public CourseDao getCourseDao()
	{
		return courseDao;
	}

	public void setCourseDao(CourseDao courseDao)
	{
		this.courseDao = courseDao;
	}

	/**
	 * 添加课程
	 * @param courseObj
	 * @return
	 */
	public boolean addCourse(CourseObj courseObj)
	{
		return courseDao.addCourse(courseObj);
	}

	/**
	 * 判断是否有此编号的课程
	 * @param courseId
	 * @return
	 */
	public boolean hadCourse(String courseId)
	{
		return courseDao.hadCourse(courseId);
	}

	/**
	 * 获取学生的课程数量
	 * @param courseObj 
	 * @return
	 */
	public int getCourseCount(CourseObj courseObj)
	{
		return courseDao.getCourseCount(courseObj);
	}

	/**
	 * 获取课程信息
	 * @param courseObj
	 * @return
	 */
	public List<HashMap> getCourseList(CourseObj courseObj)
	{
		return courseDao.getCourseList(courseObj);
	}

	/**
	 * 根据课程编号查询课程信息
	 * @author Bottle
	 * @date 2013-5-15 上午9:32:07
	 * @param map
	 * @return
	 */
	public CourseObj getCourseInforById(HashMap map)
	{
		return courseDao.getCourseInforById(map);
	}

	/**
	 * 更新课程基本信息
	 * @author Bottle
	 * @date 2013-5-15 上午10:23:02
	 * @param courseObj
	 * @return
	 */
	public boolean courseInforUpdate(CourseObj courseObj)
	{
		return courseDao.courseInforUpdate(courseObj);
	}

	/**
	 * 获取所有可以注册的课程的数量
	 * @author Bottle
	 * @date 2013-5-16 上午9:38:35
	 * @param map
	 * @return
	 */
	public int getRCourseCount(HashMap map)
	{
		return courseDao.getRCourseCount(map);
	}

	/**
	 * 获取可注册课程的基本信息列表
	 * @author Bottle
	 * @date 2013-5-16 上午9:42:30
	 * @param map
	 * @return
	 */
	public List<HashMap> getRCourseList(HashMap map)
	{
		return courseDao.getRCourseList(map);
	}

	/**
	 * 获取【可代选】课程信息
	 * @author Bottle
	 * @date 2013-5-20 下午10:11:37
	 * @param map
	 * @return
	 */
	public List<HashMap> getSubCourseInfoList(HashMap map)
	{
		return courseDao.getSubCourseInfoList(map);
	}

	/**
	 * 获取【可撤销代选】数量
	 * @author Bottle
	 * @date 2013-5-20 下午10:23:23
	 * @param map
	 * @return
	 */
	public int getCancelRCourseCount(HashMap map)
	{
		return courseDao.getCancelRCourseCount(map);
	}

	/**
	 * 获取【可撤销代选】的列表
	 * @author Bottle
	 * @date 2013-5-20 下午10:28:14
	 * @param map
	 * @return
	 */
	public List<HashMap> getCancelSubRCList(HashMap map)
	{
		return courseDao.getCancelSubRCList(map);
	}

	/**
	 * 【撤销代选】
	 * @author Bottle
	 * @date 2013-5-20 下午11:09:06
	 * @param map
	 */
	public void subCancelCS(HashMap map)
	{
		courseDao.subCancelCS(map);
	}

	/**
	 * 删除课程基本信息
	 * @author Bottle
	 * @date 2013-5-25 上午11:12:25
	 * @param map
	 */
	public void deleteCourseInfor(HashMap map)
	{
		courseDao.deleteCourse(map);
	}
}
