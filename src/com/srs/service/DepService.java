package com.srs.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.support.DaoSupport;

import com.srs.bean.CourseObj;
import com.srs.bean.CourseSelectObj;
import com.srs.bean.StudentObj;
import com.srs.dao.DepDao;

public class DepService
{

	private DepDao depDao;
	
	public DepDao getDepDao()
	{
		return depDao;
	}

	public void setDepDao(DepDao depDao)
	{
		this.depDao = depDao;
	}

	/**
	 * 学生未录入的【成绩数量】
	 * @author Bottle
	 * @date 2013-5-26 上午10:49:30
	 * @param map
	 * @return
	 */
	public int studentResultCount(HashMap map)
	{
		return depDao.studentResultCount(map);
	}

	/**
	 * 学生未录入的【课程列表】
	 * @author Bottle
	 * @date 2013-5-26 上午10:56:44
	 * @param map
	 * @return
	 */
	public List<HashMap> getResultList(HashMap map)
	{
		return depDao.getResultList(map);
	}

	/**
	 * 获取选课信息
	 * @author Bottle
	 * @date 2013-5-26 上午11:35:45
	 * @param map
	 * @return
	 */
	public HashMap courseMarkingPage(HashMap map)
	{
		return depDao.courseMarkingPage(map);
	}

	/**
	 * 录入成绩
	 * @author Bottle
	 * @date 2013-5-26 下午12:17:13
	 * @param map
	 * @return
	 */
	public boolean courseMarking(HashMap map)
	{
		return depDao.courseMarking(map);
	}

	/**
	 * 将选课信息插入下一学期的选课记录
	 * @author Bottle
	 * @date 2013-5-26 下午12:23:22
	 * @param map
	 */
	public void failChoose(HashMap map)
	{
		depDao.failChoose(map);
	}

	/**
	 * 获取【未处理申请的数量】
	 * @author Bottle
	 * @date 2013-5-26 下午3:29:13
	 * @return
	 */
	public int subApplyCount()
	{
		return depDao.subApplyCount();
	}

	/**
	 * 获取【未处理申请的列表】
	 * @author Bottle
	 * @date 2013-5-26 下午3:33:12
	 * @param map
	 * @return
	 */
	public List<HashMap> getSubApplyList(HashMap map)
	{
		return depDao.getSubApplyList(map);
	}

	/**
	 * 申请处理
	 * @author Bottle
	 * @date 2013-5-26 下午3:55:02
	 * @param map
	 */
	public void subApplyDeal(HashMap map)
	{
		depDao.subApplyDeal(map);
	}

	/**
	 * 判断选课是否冲突
	 * @author Bottle
	 * @date 2013-5-26 下午4:15:47
	 * @param map
	 * @return
	 */
	public String courseClick(HashMap map)
	{
		return depDao.courseClick(map);
	}

	/**
	 * 判断学分是否已满
	 * @author Bottle
	 * @date 2013-5-26 下午4:22:32
	 * @param map
	 * @return
	 */
	public boolean pointFull(HashMap map)
	{
		return depDao.pointFull(map);
	}

	/**
	 * 判断选课人数是否已满
	 * @author Bottle
	 * @date 2013-5-26 下午4:23:32
	 * @param map
	 * @return
	 */
	public boolean personFull(HashMap map)
	{
		return depDao.personFull(map);
	}

	/**
	 * 判断这门课程是否已经选修过
	 * @author Bottle
	 * @date 2013-5-26 下午4:24:08
	 * @param map
	 * @return
	 */
	public boolean hadCourse(HashMap map)
	{
		return depDao.hadCourse(map);
	}

	/**
	 * 添加选课信息
	 * @author Bottle
	 * @date 2013-5-26 下午4:25:30
	 * @param map
	 */
	public void addCS(HashMap map)
	{
		depDao.addCS(map);
	}

	/**
	 * 查询课程信息
	 * @author Bottle
	 * @date 2013-5-26 下午6:50:25
	 * @param courseObj
	 * @return
	 */
	public List<HashMap> courseSearch(CourseObj courseObj)
	{
		return depDao.courseSearch(courseObj);
	}

	/**
	 * 获取课程信息的数量
	 * @author Bottle
	 * @date 2013-5-26 下午9:01:15
	 * @param courseObj
	 * @return
	 */
	public int courseSearchCount(CourseObj courseObj)
	{
		return depDao.courseSearchCount(courseObj);
	}

	/**
	 * 获取【选课查询列表】
	 * @author Bottle
	 * @date 2013-5-27 上午8:24:41
	 * @param map
	 * @return
	 */
	public List<HashMap> getCsSearchList(HashMap map)
	{
		return depDao.CsSearchList(map);
	}

	/**
	 * 【选课查询数量】
	 * @author Bottle
	 * @date 2013-5-27 上午8:39:56
	 * @param map
	 * @return
	 */
	public int csSearchCount(HashMap map)
	{
		return depDao.csSearchCount(map);
	}

	/**
	 * 获取成绩信息的数量
	 * @author Bottle
	 * @date 2013-5-27 上午9:24:34
	 * @param courseSelectObj
	 * @return
	 */
	public int resultSearchCount(CourseSelectObj courseSelectObj)
	{
		return depDao.resultSearchCount(courseSelectObj);
	}

	/**
	 * 获取成绩信息列表
	 * @author Bottle
	 * @date 2013-5-27 上午9:24:55
	 * @param courseSelectObj
	 * @return
	 */
	public List<HashMap> getResultSearchList(CourseSelectObj courseSelectObj)
	{
		return depDao.getResultSearchList(courseSelectObj);
	}

	/**
	 * 学生信息列表
	 * @author Bottle
	 * @date 2013-5-27 下午1:28:43
	 * @param studentObj
	 * @return
	 */
	public List<HashMap> getStuSearchList(StudentObj studentObj)
	{
		return depDao.getStuSearchList(studentObj);
	}

	/**
	 * 学生信息的数量
	 * @author Bottle
	 * @date 2013-5-27 下午1:35:55
	 * @param studentObj
	 * @return
	 */
	public int stuSearchCount(StudentObj studentObj)
	{
		return depDao.stuSearchCount(studentObj);
	}
	
}
