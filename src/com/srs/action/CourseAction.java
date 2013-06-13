package com.srs.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletResponseAware;

import com.srs.bean.CourseObj;
import com.srs.bean.StudentObj;
import com.srs.service.CourseSelectService;
import com.srs.service.CourseService;
import com.srs.service.StudentService;

/**
 * 课程操作Action
 * @author Bottle
 * @date 2013-5-10 上午9:57:25
 */
public class CourseAction extends AbstractAction implements ServletResponseAware
{
	private static final long serialVersionUID = -4799946731552106482L;
	private CourseService courseService;
	private StudentService studentService;
	private CourseSelectService courseSelectService;
	private CourseObj courseObj;
	private HttpServletResponse response;
	private String courseWeek;//课程单双周
	private int courseStart;//开始周
	private int courseEnd;//结束周
	private int weekDay;//星期
	private String classTime;//上课时间
	private List<HashMap> courseInforList;//课程信息列表
	private List<HashMap> SubCancelRCList;//【可撤销代选】信息列表
	private String courseId;//课程号

	//[start] Getter and Setter
	public int getWeekDay()
	{
		return weekDay;
	}

	public void setWeekDay(int weekDay)
	{
		this.weekDay = weekDay;
	}

	public String getClassTime()
	{
		return classTime;
	}

	public void setClassTime(String classTime)
	{
		this.classTime = classTime;
	}

	public List<HashMap> getSubCancelRCList()
	{
		return SubCancelRCList;
	}

	public void setSubCancelRCList(List<HashMap> subCancelRCList)
	{
		SubCancelRCList = subCancelRCList;
	}

	public CourseSelectService getCourseSelectService()
	{
		return courseSelectService;
	}

	public void setCourseSelectService(CourseSelectService courseSelectService)
	{
		this.courseSelectService = courseSelectService;
	}

	public StudentService getStudentService()
	{
		return studentService;
	}

	public void setStudentService(StudentService studentService)
	{
		this.studentService = studentService;
	}

	public String getCourseId()
	{
		return courseId;
	}

	public void setCourseId(String courseId)
	{
		this.courseId = courseId;
	}

	@Override
	public void setServletResponse(HttpServletResponse arg0)
	{
		this.response = arg0;
	}

	public List<HashMap> getCourseInforList()
	{
		return courseInforList;
	}

	public void setCourseInforList(List<HashMap> courseInforList)
	{
		this.courseInforList = courseInforList;
	}

	public String getCourseWeek()
	{
		return courseWeek;
	}

	public void setCourseWeek(String courseWeek)
	{
		this.courseWeek = courseWeek;
	}

	public int getCourseStart()
	{
		return courseStart;
	}

	public void setCourseStart(int courseStart)
	{
		this.courseStart = courseStart;
	}

	public int getCourseEnd()
	{
		return courseEnd;
	}

	public void setCourseEnd(int courseEnd)
	{
		this.courseEnd = courseEnd;
	}

	public CourseObj getCourseObj()
	{
		return courseObj;
	}

	public void setCourseObj(CourseObj courseObj)
	{
		this.courseObj = courseObj;
	}

	public CourseService getCourseService()
	{
		return courseService;
	}

	public void setCourseService(CourseService courseService)
	{
		this.courseService = courseService;
	}

	//[end]
	/**
	 * 添加课程信息
	 * @return
	 * @throws IOException 
	 */
	public void addCourse() throws IOException
	{
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");//防止弹出的信息出现乱码
		PrintWriter out;
		out = response.getWriter();
		if (courseService.hadCourse(courseObj.getCourseId()))
		{//判断课程编号是否重复
			out.print("<script>alert('课程编号重复！')</script>");
		} else if (courseStart > courseEnd)
		{//判断开始周是否大于结束周
			out.print("<script>alert('开始周不能大于结束周！')</script>");
		} else if (!courseObj.getFirstCourseID().equals("") && !courseService.hadCourse(courseObj.getFirstCourseID()))
		{//判断先修课程是否存在
			out.print("<script>alert('先修课程不存在！')</script>");
		} else
		{
			String courseString = courseStart + "|" + courseEnd + "|";
			if (courseWeek.equals("0"))
			{
				courseString += "0|";//"单周";
			} else
			{
				courseString += "1|";//"双周";
			}
			courseString = courseString + weekDay + "|" + classTime;
			courseObj.setSchooltime(courseString);
			boolean addSuccess = courseService.addCourse(courseObj);
			if (addSuccess)
			{
				out.print("<script>alert('添加成功！')</script>");
			} else
			{
				out.print("<script>alert('添加失败！')</script>");
			}
		}
		out.print("<script>window.location.href='./courseManage/courseAdd.jsp'</script>");
		out.flush();
		out.close();
	}

	/**
	 * 获取课程信息列表
	 * @return
	 */
	public String getCourseList()
	{
		if (courseObj == null)
		{
			courseObj = new CourseObj();
		}
		HashMap map = this.getCountQueryParam();
		int totalRows = courseService.getCourseCount(courseObj);
		map = this.getQueryParam(totalRows);
		courseObj.setRowStart(Integer.parseInt(map.get("rowStart").toString()) - 1);
		courseObj.setRowEnd(Integer.parseInt(map.get("rowEnd").toString()) - 1);
		courseInforList = courseService.getCourseList(courseObj);
		return SUCCESS;
	}

	/**
	 * 获取【可注册】的课程列表
	 * @author Bottle
	 * @date 2013-5-16 上午9:35:22
	 * @return
	 */
	public String getRegisterCourseList()
	{
		//根据学号获取学生专业信息
		String studentId = (String) session.get("userName");
		HashMap stuMap = new HashMap();
		stuMap.put("studentId", studentId);
		StudentObj studentObj = studentService.getStudentInforById(stuMap);
		String Department = studentObj.getDepartment();
		//根据专业信息判断总共有多少门课可以选，并放入列表内
		HashMap map = this.getCountQueryParam();
		map.put("Department", Department);
		map.put("studentId", studentId);
		int totalRows = courseService.getRCourseCount(map);
		map = this.getQueryParam(totalRows);
		map.put("rowStart", Integer.parseInt(map.get("rowStart").toString()) - 1);
		map.put("rowEnd", Integer.parseInt(map.get("rowEnd").toString()) - 1);
		courseInforList = courseService.getSubCourseInfoList(map);
		return SUCCESS;
	}

	/**
	 * 获取【可代选】课程的信息
	 * @author Bottle
	 * @date 2013-5-20 上午8:37:00
	 * @return
	 */
	public String getSubRegisterCourseList()
	{
		//根据学号获取学生专业信息
		String studentId = (String) session.get("userName");
		HashMap stuMap = new HashMap();
		stuMap.put("studentId", studentId);
		StudentObj studentObj = studentService.getStudentInforById(stuMap);
		String Department = studentObj.getDepartment();
		//根据专业信息判断总共有多少门课可以选，并放入列表内
		HashMap map = this.getCountQueryParam();
		map.put("Department", Department);
		map.put("studentId", studentId);
		int totalRows = courseService.getRCourseCount(map);
		map = this.getQueryParam(totalRows);
		map.put("rowStart", Integer.parseInt(map.get("rowStart").toString()) - 1);
		map.put("rowEnd", Integer.parseInt(map.get("rowEnd").toString()) - 1);
		courseInforList = courseService.getSubCourseInfoList(map);
		return SUCCESS;
	}

	/**
	 * 获取【可撤销代选】课程的信息
	 * @author Bottle
	 * @date 2013-5-20 上午8:37:00
	 * @return
	 */
	public String getCancelSubRCList()
	{
		//根据学号获取学生专业信息
		String studentId = (String) session.get("userName");
		HashMap map = this.getCountQueryParam();
		map.put("studentId", studentId);
		map.put("handle2", 0);
		int totalRows = courseService.getCancelRCourseCount(map);
		map = this.getQueryParam(totalRows);
		map.put("rowStart", Integer.parseInt(map.get("rowStart").toString()) - 1);
		map.put("rowEnd", Integer.parseInt(map.get("rowEnd").toString()) - 1);
		SubCancelRCList = courseService.getCancelSubRCList(map);
		return SUCCESS;
	}

	/**
	 * 根据课程号来查询课程信息
	 * @author Bottle
	 * @date 2013-5-15 上午9:15:21
	 */
	public String getCourseInforById()
	{
		HashMap map = new HashMap();
		String operateType = request.getParameter("operateType");
		map.put("courseId", courseId);
		courseObj = courseService.getCourseInforById(map);
		if (courseObj != null)
		{
			if (courseObj.getType().equals("1"))
			{
				courseObj.setType("必修");
			} else
			{
				courseObj.setType("选修");
			}
			if (operateType.equals("read"))
			{
				String temp = courseObj.getSchooltime();
				String[] times = temp.split("\\|");
				String schoolTime = "第" + times[0] + "周到第" + times[1] + "周;";
				switch (Integer.valueOf(times[2]))
				{
					case 0:
						schoolTime += "单周;";
						break;
					case 1:
						schoolTime += "双周;";
						break;
					case 2:
						schoolTime += "每周;";
						break;
					default:
						break;
				}
				switch (Integer.valueOf(times[3]))
				{
					case 1:
						schoolTime += "周一;";
						break;
					case 2:
						schoolTime += "周二;";
						break;
					case 3:
						schoolTime += "周三;";
						break;
					case 4:
						schoolTime += "周四;";
						break;
					case 5:
						schoolTime += "周五;";
						break;
					case 6:
						schoolTime += "周六;";
						break;
					case 7:
						schoolTime += "周日;";
						break;
					default:
						break;
				}
				switch (Integer.valueOf(times[4]))
				{
					case 1:
						schoolTime += "1-2节";
						break;
					case 2:
						schoolTime += "3-4节";
						break;
					case 3:
						schoolTime += "5-6节";
						break;
					case 4:
						schoolTime += "7-8节";
						break;
					case 5:
						schoolTime += "9-10节";
						break;
					case 6:
						schoolTime += "11-12节";
						break;
					default:
						break;
				}
				courseObj.setSchooltime(schoolTime);
				return "read";
			} else
			{
				return "edit";
			}
		} else
		{
			return ERROR;
		}
	}

	/**
	 * 更新课程基本信息
	 * @author Bottle
	 * @throws IOException 
	 * @date 2013-5-15 上午10:19:11
	 */
	public void courseInforUpdate() throws IOException
	{
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");//防止弹出的信息出现乱码
		PrintWriter out;
		out = response.getWriter();
		if (!courseObj.getFirstCourseID().equals("") && !courseService.hadCourse(courseObj.getFirstCourseID()))
		{//判断先修课程是否存在
			out.print("<script>alert('先修课程不存在！')</script>");
		} else
		{
			if (courseObj.getType().equals("必修"))
			{
				courseObj.setType("1");
			} else
			{
				courseObj.setType("0");
			}
			boolean updateSuccess = courseService.courseInforUpdate(courseObj);
			if (updateSuccess)
			{
				out.print("<script>alert('更新成功！')</script>");
			} else
			{
				out.print("<script>alert('更新失败！')</script>");
			}
		}
		out.print("<script>window.close()</script>");
		out.flush();
		out.close();
	}

	/**
	 * 申请代选课
	 * @author Bottle
	 * @throws IOException 
	 * @date 2013-5-19 下午4:46:30
	 */
	public void subCS() throws IOException
	{
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String applyTime = df.format(new Date());
		String studentId = (String) session.get("userName");
		String courseId = request.getParameter("courseId");
		HashMap map = new HashMap();
		map.put("StudentId", studentId);
		map.put("CourseId", courseId);
		map.put("Handle2", "0");
		map.put("ApplyTime", applyTime);
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");//防止弹出的信息出现乱码
		PrintWriter out = response.getWriter();
		boolean hasApplyed = courseSelectService.hasApplyed(map);
		boolean insertSuccess = courseSelectService.addSubCS(map);
		if (insertSuccess)
		{
			out.print("<script>alert('申请代选课成功！')</script>");
		} else
		{
			out.print("<script>alert('申请代选课失败！')</script>");
		}
		out.print("<script>window.close()</script>");
		out.flush();
		out.close();
	}

	/**
	 * 撤销代选
	 * @author Bottle
	 * @date 2013-5-20 下午11:07:19
	 * @throws IOException
	 */
	public void subCancelCS() throws IOException
	{
		String studentId = (String) session.get("userName");
		String courseId = request.getParameter("courseId");
		HashMap map = new HashMap();
		map.put("StudentId", studentId);
		map.put("CourseId", courseId);
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");//防止弹出的信息出现乱码
		PrintWriter out = response.getWriter();
		courseService.subCancelCS(map);
		out.print("<script>alert('此课程已经提出过申请！')</script>");
		out.close();
	}

	/**
	 * 删除课程基本信息
	 * @author Bottle
	 * @throws IOException 
	 * @date 2013-5-25 上午11:11:01
	 */
	public void deleteCourseInfor() throws IOException
	{
		String courseId = request.getParameter("courseId");
		HashMap map = new HashMap();
		map.put("courseId", courseId);
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");//防止弹出的信息出现乱码
		PrintWriter out = response.getWriter();
		courseService.deleteCourseInfor(map);
		out.print("<script>alert('删除成功！')</script>");
		out.close();
	}
}
