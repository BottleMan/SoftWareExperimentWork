package com.srs.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletResponseAware;

import com.srs.bean.CourseObj;
import com.srs.bean.CourseSelectObj;
import com.srs.bean.StudentObj;
import com.srs.service.DepService;

public class DepAction extends AbstractAction implements ServletResponseAware
{
	private static final long serialVersionUID = 6703075778451406400L;
	private DepService depService;
	private HttpServletResponse response;
	private String studentId;//学号
	private String term;//学期
	private List<HashMap> resultList;
	private String courseId;//课程编号
	private HashMap courseInformation;//选课信息
	private String result;//成绩
	private CourseObj courseObj;//课程信息
	private CourseSelectObj courseSelectObj;//选课信息
	private StudentObj studentObj;//学生信息
	private String courseWeek;//上课时间
	private String courseStart;
	private String courseEnd;
	private String weekDay;
	private String classTime;

	//[start]Getter and Setter
	public String getStudentId()
	{
		return studentId;
	}

	public StudentObj getStudentObj()
	{
		return studentObj;
	}

	public void setStudentObj(StudentObj studentObj)
	{
		this.studentObj = studentObj;
	}

	public CourseSelectObj getCourseSelectObj()
	{
		return courseSelectObj;
	}

	public void setCourseSelectObj(CourseSelectObj courseSelectObj)
	{
		this.courseSelectObj = courseSelectObj;
	}

	public String getCourseWeek()
	{
		return courseWeek;
	}

	public void setCourseWeek(String courseWeek)
	{
		this.courseWeek = courseWeek;
	}

	public String getCourseStart()
	{
		return courseStart;
	}

	public void setCourseStart(String courseStart)
	{
		this.courseStart = courseStart;
	}

	public String getCourseEnd()
	{
		return courseEnd;
	}

	public void setCourseEnd(String courseEnd)
	{
		this.courseEnd = courseEnd;
	}

	public String getWeekDay()
	{
		return weekDay;
	}

	public void setWeekDay(String weekDay)
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

	public String getCourseId()
	{
		return courseId;
	}

	public void setCourseId(String courseId)
	{
		this.courseId = courseId;
	}

	public CourseObj getCourseObj()
	{
		return courseObj;
	}

	public void setCourseObj(CourseObj courseObj)
	{
		this.courseObj = courseObj;
	}

	public String getResult()
	{
		return result;
	}

	public void setResult(String result)
	{
		this.result = result;
	}

	public HashMap getCourseInformation()
	{
		return courseInformation;
	}

	public void setCourseInformation(HashMap courseInformation)
	{
		this.courseInformation = courseInformation;
	}

	public List<HashMap> getResultList()
	{
		return resultList;
	}

	public void setResultList(List<HashMap> resultList)
	{
		this.resultList = resultList;
	}

	public DepService getDepService()
	{
		return depService;
	}

	public void setDepService(DepService depService)
	{
		this.depService = depService;
	}

	public void setStudentId(String studentId)
	{
		this.studentId = studentId;
	}

	public String getTerm()
	{
		return term;
	}

	public void setTerm(String term)
	{
		this.term = term;
	}

	@Override
	public void setServletResponse(HttpServletResponse arg0)
	{
		this.response = arg0;
	}

	//[end]
	/**
	 * 【成绩录入列表】
	 * @author Bottle
	 * @date 2013-5-26 上午10:44:02
	 * @return
	 */
	public String resultLoad()
	{
		HashMap map = this.getCountQueryParam();
		map.put("studentId", studentId);
		map.put("term", term);
		int totalRows = depService.studentResultCount(map);
		map = this.getQueryParam(totalRows);
		map.put("rowStart", Integer.parseInt(map.get("rowStart").toString()) - 1);
		map.put("rowEnd", Integer.parseInt(map.get("rowEnd").toString()) - 1);
		resultList = depService.getResultList(map);
		for (int i = 0; i < resultList.size(); i++)
		{
			if (resultList.get(i) == null)
			{
				continue;
			}
			if (resultList.get(i).get("CourseGrade").toString().equals("-1"))
			{
				resultList.get(i).put("CourseGrade", "无");
			}
			if (resultList.get(i).get("Pass").toString().equals("0"))
			{
				resultList.get(i).put("Pass", "未通过");
			} else
			{
				resultList.get(i).put("Pass", "通过");
			}
		}
		return SUCCESS;
	}

	/**
	 * 
	 * @author Bottle
	 * @date 2013-5-26 上午11:29:22
	 * @return
	 */
	public String courseMarkingPage()
	{
		studentId = request.getParameter("studentId");
		courseId = request.getParameter("courseId");
		term = request.getParameter("term");
		session.put("studentId", studentId);
		session.put("courseId", courseId);
		session.put("term", term);
		return SUCCESS;
	}

	/**
	 * 录入学生成绩
	 * @author Bottle
	 * @throws IOException 
	 * @date 2013-5-26 下午12:10:10
	 */
	public void courseMarking() throws IOException
	{
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");//防止弹出的信息出现乱码
		PrintWriter out = response.getWriter();
		studentId = (String) session.get("studentId");
		courseId = (String) session.get("courseId");
		term = (String) session.get("term");
		HashMap map = new HashMap();
		map.put("studentId", studentId);
		map.put("courseId", courseId);
		map.put("result", result);
		map.put("term", term);
		
		if (!isNumeric(result))
		{
			out.print("<script>alert('成绩只能是整数，同学你输入什么奇葩的东西了……')</script>");
		} else if (Integer.valueOf(result) < 0 || Integer.valueOf(result) > 100)
		{
			out.print("<script>alert('成绩只能是0-100，同学你想多了……')</script>");
		} else
		{
			if (Integer.valueOf(result) < 60)
			{//如果成绩小于60，则自动选入下学期的课程
				map.put("pass", 2);
				depService.failChoose(map);
			} else
			{
				map.put("pass", 1);
			}
			boolean updateSuccess = depService.courseMarking(map);
			if (updateSuccess)
			{
				if (Integer.valueOf(result) < 60)
				{
					out.print("<script>alert('成绩录入成功,只是这位可怜的同学下学期又要重修了……')</script>");
				} else
				{
					out.print("<script>alert('成绩录入成功!')</script>");
				}
			} else
			{
				out.print("<script>alert('录入失败！')</script>");
			}
		}
		out.print("<script>window.close()</script>");
		out.flush();
		out.close();
	}

	/**
	 * 获取【申请列表】
	 * @author Bottle
	 * @date 2013-5-26 下午3:27:44
	 * @return
	 */
	public String subApplyLoad()
	{
		HashMap map = this.getCountQueryParam();
		int totalRows = depService.subApplyCount();
		map = this.getQueryParam(totalRows);
		map.put("rowStart", Integer.parseInt(map.get("rowStart").toString()) - 1);
		map.put("rowEnd", Integer.parseInt(map.get("rowEnd").toString()) - 1);
		resultList = depService.getSubApplyList(map);
		return SUCCESS;
	}

	/**
	 * 【处理申请】
	 * @author Bottle
	 * @throws IOException 
	 * @date 2013-5-26 下午3:50:48
	 */
	public void subApplyDeal() throws IOException
	{
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");//防止弹出的信息出现乱码
		PrintWriter out = response.getWriter();
		studentId = request.getParameter("studentId");
		courseId = request.getParameter("courseId");
		String operator = request.getParameter("operator");
		HashMap map = new HashMap();
		map.put("studentId", studentId);
		map.put("courseId", courseId);
		map.put("operator", operator);
		//如果没批准，则只执行修改操作；
		//如果批准，则插入选课数据（除了先修课程其他都要判断）
		if (operator.equals("2"))
		{
			depService.subApplyDeal(map);
			out.print("<script>alert('操作成功!')</script>");
		} else
		{
			String cliClassNo = depService.courseClick(map);
			if (!cliClassNo.equals(""))//上课时间冲突
			{
				out.print("<script>alert('该同学的上课时间与编号为" + cliClassNo + "的课程冲突')</script>");
			} else if (depService.pointFull(map))//学分已满
			{
				out.print("<script>alert('如果选择这门课程，该同学的学分将超过18分！')</script>");
			} else if (depService.personFull(map))//选课人数已满
			{
				out.print("<script>alert('该门课程的选课人数已满！')</script>");
			} else if (depService.hadCourse(map))//已经选修过
			{
				out.print("<script>alert('该同学的该门课程已经选修过！')</script>");
			} else
			{
				depService.addCS(map);
				depService.subApplyDeal(map);
				out.print("<script>alert('操作成功，并成功为该同学选课!')</script>");
			}
		}
		out.print("<script>window.close()</script>");
		out.flush();
		out.close();
	}

	/**
	 * 【查询课程信息】
	 * @author Bottle
	 * @date 2013-5-26 下午6:27:32
	 * @return
	 */
	public String courseSearch()
	{
		String schoolTime = getSchoolTime();
		courseObj.setSchooltime(schoolTime);
//		courseObj.setClassHour("%" + courseObj.getClassHour() + "%");
//		courseObj.setCourseId("%" + courseObj.getCourseId() + "%");
//		courseObj.setCourseNM("%" + courseObj.getCourseNM() + "%");
//		courseObj.setCredit("%" + courseObj.getCredit() + "%");
//		courseObj.setFirstCourseID("%" + courseObj.getFirstCourseID() + "%");
//		courseObj.setMajor("%" + courseObj.getMajor() + "%");
//		courseObj.setNumber("%" + courseObj.getNumber() + "%");
//		courseObj.setPlace("%" + courseObj.getPlace() + "%");
//		courseObj.setSchooltime("%" + courseObj.getSchooltime() + "%");
//		courseObj.setSemester("%" + courseObj.getSemester() + "%");
//		courseObj.setTeacher("%" + courseObj.getTeacher() + "%");
//		courseObj.setType("%" + courseObj.getType() + "%");
		int totalRows = depService.courseSearchCount(courseObj);
		HashMap map = this.getCountQueryParam();
		map = this.getQueryParam(totalRows);
		courseObj.setRowStart(Integer.parseInt(map.get("rowStart").toString()) - 1);
		courseObj.setRowEnd(Integer.parseInt(map.get("rowEnd").toString()) - 1);
		resultList = depService.courseSearch(courseObj);
		return SUCCESS;
	}

	//[start] 获取上课时间
	private String getSchoolTime()
	{
		String mSchoolTime = "";
		if (courseStart.equals(""))
		{
			mSchoolTime += "%|";
		} else
		{
			mSchoolTime = mSchoolTime + courseStart + "|";
		}
		if (courseEnd.equals(""))
		{
			mSchoolTime += "%|";
		} else
		{
			mSchoolTime = mSchoolTime + courseEnd + "|";
		}
		if (courseWeek.equals(""))
		{
			mSchoolTime += "%|";
		} else
		{
			mSchoolTime = mSchoolTime + courseWeek + "|";
		}
		if (weekDay.equals(""))
		{
			mSchoolTime += "%|";
		} else
		{
			mSchoolTime = mSchoolTime + weekDay + "|";
		}
		if (classTime.equals(""))
		{
			mSchoolTime += "%";
		} else
		{
			mSchoolTime = mSchoolTime + classTime;
		}
		return mSchoolTime;
	}

	//[end]
	/**
	 * 【查询选课信息】
	 * @author Bottle
	 * @date 2013-5-27 上午8:20:11
	 * @return
	 */
	public String csSearch()
	{
		HashMap map = this.getCountQueryParam();
		map.put("studentId", studentId);
		map.put("term", term);
		int totalRows = depService.csSearchCount(map);
		map = this.getQueryParam(totalRows);
		map.put("rowStart", Integer.parseInt(map.get("rowStart").toString()) - 1);
		map.put("rowEnd", Integer.parseInt(map.get("rowEnd").toString()) - 1);
		resultList = depService.getCsSearchList(map);
		for (int i = 0; i < resultList.size(); i++)
		{
			if (resultList.get(i).get("Pass").toString().equals("0"))
			{
				resultList.get(i).put("Pass", "未通过");
			} else
			{
				resultList.get(i).put("Pass", "通过");
			}
			if (resultList.get(i).get("CourseGrade").toString().equals("-1"))
			{
				resultList.get(i).put("CourseGrade", "无");
			}
		}
		return SUCCESS;
	}

	/**
	 * 【查询成绩】
	 * @author Bottle
	 * @date 2013-5-27 上午9:19:45
	 * @return
	 */
	public String resultSearch()
	{
		int totalRows = depService.resultSearchCount(courseSelectObj);
		HashMap map = this.getCountQueryParam();
		map = this.getQueryParam(totalRows);
		courseSelectObj.setRowStart(Integer.parseInt(map.get("rowStart").toString()) - 1);
		courseSelectObj.setRowEnd(Integer.parseInt(map.get("rowEnd").toString()) - 1);
		resultList = depService.getResultSearchList(courseSelectObj);
		for (int i = 0; i < resultList.size(); i++)
		{
			if (resultList.get(i).get("Pass").toString().equals("0"))
			{
				resultList.get(i).put("Pass", "未通过");
			} else
			{
				resultList.get(i).put("Pass", "通过");
			}
			if (resultList.get(i).get("CourseGrade").toString().equals("-1"))
			{
				resultList.get(i).put("CourseGrade", "无");
			}
		}
		return SUCCESS;
	}

	/**
	 * 【查询学生信息】
	 * @author Bottle
	 * @date 2013-5-27 下午1:25:43
	 * @return
	 */
	public String stuSearch()
	{
		int totalRows = depService.stuSearchCount(studentObj);
		HashMap map = this.getCountQueryParam();
		map = this.getQueryParam(totalRows);
		studentObj.setRowStart(Integer.parseInt(map.get("rowStart").toString()) - 1);
		studentObj.setRowEnd(Integer.parseInt(map.get("rowEnd").toString()) - 1);
		resultList = depService.getStuSearchList(studentObj);
		for (int i = 0; i < resultList.size(); i++)
		{
			if (resultList.get(i).get("Sex").toString().equals("1"))
			{
				resultList.get(i).put("Sex", "男");
			} else
			{
				resultList.get(i).put("Sex", "女");
			}
		}
		return SUCCESS;
	}

	/**
	 * 判断输入是不是数字
	 * @author Bottle
	 * @date 2013-5-28 上午10:37:38
	 * @param str
	 * @return
	 */
	public static boolean isNumeric(String str)
	{
		Pattern pattern = Pattern.compile("[0-9]*");
		return pattern.matcher(str).matches();
	}
}
