package com.srs.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletResponseAware;

import com.srs.bean.CourseSelectObj;
import com.srs.service.CourseSelectService;

/**
 * 选课信息操作Action
 * @author Bottle
 * @date 2013-5-16 上午11:06:37
 */
public class CourseSelectAction extends AbstractAction implements ServletResponseAware
{
	private static final long serialVersionUID = 8792292757657478322L;
	private HttpServletResponse response;
	private CourseSelectService courseSelectService;
	private CourseSelectObj courseSelectObj;
	private List<HashMap> csHisList;//选课历史信息列表
	private String term;//学期
	private String startTime;
	private String endTime;

	//[start] Getter & Setter 
	public List<HashMap> getCsHisList()
	{
		return csHisList;
	}

	public String getStartTime()
	{
		return startTime;
	}

	public void setStartTime(String startTime)
	{
		this.startTime = startTime;
	}

	public String getEndTime()
	{
		return endTime;
	}

	public void setEndTime(String endTime)
	{
		this.endTime = endTime;
	}

	public String getTerm()
	{
		return term;
	}

	public void setTerm(String term)
	{
		this.term = term;
	}

	public void setCsHisList(List<HashMap> csHisList)
	{
		this.csHisList = csHisList;
	}

	public CourseSelectObj getCourseSelectObj()
	{
		return courseSelectObj;
	}

	public void setCourseSelectObj(CourseSelectObj courseSelectObj)
	{
		this.courseSelectObj = courseSelectObj;
	}

	@Override
	public void setServletResponse(HttpServletResponse response)
	{
		this.response = response;
	}

	public CourseSelectService getCourseSelectService()
	{
		return courseSelectService;
	}

	public void setCourseSelectService(CourseSelectService courseSelectService)
	{
		this.courseSelectService = courseSelectService;
	}

	//[end]
	/**
	 * 添加一条选课信息
	 * @author Bottle
	 * @throws IOException 
	 * @date 2013-5-16 上午11:08:26
	 */
	public void addCS() throws IOException
	{
		courseSelectObj.setStudentId((String) session.get("userName"));
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");//防止弹出的信息出现乱码
		PrintWriter out;
		out = response.getWriter();
		HashMap map = new HashMap();
		map.put("studentId", courseSelectObj.getStudentId());
		map.put("courseId", courseSelectObj.getCourseId());
		String cliClassNo = courseSelectService.courseClick(map);
		String preClass = courseSelectService.preClass(map);
		map.put("preClass", preClass);
		if (!cliClassNo.equals(""))//上课时间冲突
		{
			out.print("<script>alert('上课时间与编号为" + cliClassNo + "的课程冲突')</script>");
		} else if (!preClass.equals("") && !courseSelectService.hadPre(map))//先修课
		{
			out.print("<script>alert('先修课程" + preClass + "没有通过！')</script>");
		} else if (courseSelectService.pointFull(map))//学分已满
		{
			out.print("<script>alert('如果选择这门课程，您的学分将超过18分！')</script>");
		} else if (courseSelectService.personFull(map))//选课人数已满
		{
			out.print("<script>alert('该门课程的选课人数已满！')</script>");
		}else
		{
			boolean addSuccess = courseSelectService.addCS(courseSelectObj);
			if (addSuccess)
			{
				out.print("<script>alert('选课成功！')</script>");
			} else
			{
				out.print("<script>alert('选课失败！')</script>");
			}
		}
		out.print("<script>window.location.href='../getRegisterCourseList.action'</script>");
		out.flush();
		out.close();
	}

	/**
	 * 添加【退课申请】记录
	 * @author Bottle
	 * @date 2013-5-21 上午9:01:13
	 * @throws IOException
	 */
	public void csApplyCancel() throws IOException
	{
		String studentId = (String) session.get("userName");
		String courseId = request.getParameter("courseId");
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String applyTime = df.format(new Date());
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");//防止弹出的信息出现乱码
		PrintWriter out = response.getWriter();
		HashMap map = new HashMap();
		map.put("studentId", studentId);
		map.put("courseId", courseId);
		map.put("ApplyTime", applyTime);
		map.put("handle1", "0");
		if (courseSelectService.hadApplyCourse(map))
		{//判断课程是否已经选修过
			out.print("<script>alert('课程已经提出过退课申请！')</script>");
		} else
		{
			boolean addSuccess = courseSelectService.addCancelApplyCS(map);
			if (addSuccess)
			{
				out.print("<script>alert('申请成功！')</script>");
			} else
			{
				out.print("<script>alert('申请失败！')</script>");
			}
		}
		out.flush();
		out.close();
	}

	/**
	 * 查询选课历史
	 * @author Bottle
	 * @date 2013-5-16 下午4:40:10
	 * @return
	 */
	public String CSHistory()
	{
		float sumPoint = 0;
		String StudentId = (String) session.get("userName");
		HashMap map = this.getCountQueryParam();
		map.put("StudentId", StudentId);
		if (term != null && !term.equals(""))
		{
			map.put("term", term);
		}
		int totalRows = courseSelectService.getCSHistoryCount(map);
		map = this.getQueryParam(totalRows);
		map.put("rowStart", Integer.parseInt(map.get("rowStart").toString()) - 1);
		map.put("rowEnd", Integer.parseInt(map.get("rowEnd").toString()) - 1);
		csHisList = courseSelectService.CSHistory(map);
		for (int i = 0; i < csHisList.size(); i++)
		{
			if (csHisList.get(i).get("CourseGrade").toString().equals("-1"))
			{
				csHisList.get(i).put("CourseGrade", "没有成绩");
			}
			if (csHisList.get(i).get("Pass").toString().equals("0"))
			{
				csHisList.get(i).put("Pass", "无");
			}else if (csHisList.get(i).get("Pass").toString().equals("1"))
			{
				csHisList.get(i).put("Pass", "通过");
			}else {
				csHisList.get(i).put("Pass", "未通过");
			}
			sumPoint += Float.valueOf(csHisList.get(i).get("Credit").toString());
		}
		
		request.setAttribute("sumPoint",sumPoint);
		
		return SUCCESS;
	}

	/**
	 * 获取【退课申请】的信息列表
	 * @author Bottle
	 * @date 2013-5-21 上午10:25:50
	 * @return
	 */
	public String getCancelApplyList()
	{
		int totalRows = courseSelectService.getCancelCSApplyCount();
		HashMap map = this.getCountQueryParam();
		map = this.getQueryParam(totalRows);
		map.put("rowStart", Integer.parseInt(map.get("rowStart").toString()) - 1);
		map.put("rowEnd", Integer.parseInt(map.get("rowEnd").toString()) - 1);
		csHisList = courseSelectService.getCancelCSApply(map);
		return SUCCESS;
	}
	
	/**
	 * 获取【退课申请历史】的信息列表
	 * @author Bottle
	 * @date 2013-5-21 上午10:25:50
	 * @return
	 */
	public String getCancelApplyHisList()
	{
		HashMap map = this.getCountQueryParam();
		if (startTime != null && !startTime.equals(""))
		{
			map.put("startTime", startTime);
			map.put("endTime", endTime);
		}
		int totalRows = courseSelectService.getCancelApplyHisListCount(map);
		
		map = this.getQueryParam(totalRows);
		map.put("rowStart", Integer.parseInt(map.get("rowStart").toString()) - 1);
		map.put("rowEnd", Integer.parseInt(map.get("rowEnd").toString()) - 1);
		csHisList = courseSelectService.getCancelApplyHisList(map);
		return SUCCESS;
	}

	/**
	 * 查询【可退课、可注销】课程的信息
	 * @author Bottle
	 * @date 2013-5-21 上午9:21:25
	 * @return
	 */
	public String cancelCSHistory()
	{
		String studentId = (String) session.get("userName");
		HashMap map = this.getCountQueryParam();
		map.put("studentId", studentId);
		map.put("handle1", "1");
		int totalRows = courseSelectService.getCancelCSHistoryCount(map);
		map = this.getQueryParam(totalRows);
		map.put("rowStart", Integer.parseInt(map.get("rowStart").toString()) - 1);
		map.put("rowEnd", Integer.parseInt(map.get("rowEnd").toString()) - 1);
		csHisList = courseSelectService.getCancelCSHistory(map);
		for (int i = 0; i < csHisList.size(); i++)
		{
			if (csHisList.get(i).get("CourseGrade").toString().equals("-1"))
			{
				csHisList.get(i).put("CourseGrade", "没有成绩");
			}
			if (csHisList.get(i).get("Pass").toString().equals("0"))
			{
				csHisList.get(i).put("Pass", "无");
			}
		}
		return SUCCESS;
	}

	/**
	 * 删除选课
	 * @author Bottle
	 * @throws IOException 
	 * @date 2013-5-17 下午4:24:12
	 */
	public void CSDelete() throws IOException
	{
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");//防止弹出的信息出现乱码
		PrintWriter out;
		out = response.getWriter();
		String studentId = (String) session.get("userName");
		String courseId = request.getParameter("courseId");
		term = request.getParameter("term");
		HashMap map = new HashMap();
		map.put("studentId", studentId);
		map.put("courseId", courseId);
		map.put("term", term);
		boolean deleteSuccess = courseSelectService.CSDelete(map);
		if (deleteSuccess)
		{
			out.print("<script>alert('删除选课成功！')</script>");
		} else
		{
			out.print("<script>alert('删除选课失败！')</script>");
		}
		out.print("<script>window.location.href='./csCancel.jsp'</script>");
		out.flush();
		out.close();
	}

	/**
	 * 处理退课申请
	 * @author Bottle
	 * @throws IOException 
	 * @date 2013-5-22 下午3:19:08
	 */
	public void dealCancelApply() throws IOException
	{
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");//防止弹出的信息出现乱码
		PrintWriter out = response.getWriter();
		String courseId = request.getParameter("courseId");
		String studentId = request.getParameter("studentId");
		String handle1 = request.getParameter("dealFlag");
		HashMap map = new HashMap();
		map.put("studentId", studentId);
		map.put("courseId", courseId);
		map.put("handle1", handle1);
		map.put("term", term);
		boolean dealSuccess = courseSelectService.dealCancelApply(map);
		if (dealSuccess)
		{
			if (handle1.equals("1"))
			{
				courseSelectService.CSDelete(map);
			}
			out.print("<script>alert('处理成功！')</script>");
		} else
		{
			out.print("<script>alert('处理失败！')</script>");
		}
		out.close();
	}
}
