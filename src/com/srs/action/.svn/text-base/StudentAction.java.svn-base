package com.srs.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletResponseAware;

import com.srs.bean.StudentObj;
import com.srs.bean.UserObj;
import com.srs.service.StudentService;
import com.srs.service.UserService;

/**
 * 
 * @author Bottle
 * @date 2013-5-1 下午1:00:50
 */
public class StudentAction extends AbstractAction implements ServletResponseAware
{
	private static final long serialVersionUID = -7308632878885525647L;
	private HttpServletResponse response;
	private StudentService studentService;
	private StudentObj studentObj;
	private List<HashMap> studentInforList;//学生信息列表
	private String studentId;//学号
	private String DropOut;//休学标识：0-未休学；1-已休学；2-未选择

	//[start] Getter & Setter
	public String getDropOut()
	{
		return DropOut;
	}

	public void setDropOut(String dropOut)
	{
		DropOut = dropOut;
	}

	public String getStudentId()
	{
		return studentId;
	}

	public void setStudentId(String studentId)
	{
		this.studentId = studentId;
	}

	public List<HashMap> getStudentInforList()
	{
		return studentInforList;
	}

	public void setStudentInforList(List<HashMap> studentInforList)
	{
		this.studentInforList = studentInforList;
	}

	public StudentObj getStudentObj()
	{
		return studentObj;
	}

	public void setStudentObj(StudentObj studentObj)
	{
		this.studentObj = studentObj;
	}

	public StudentService getStudentService()
	{
		return studentService;
	}

	public void setStudentService(StudentService studentService)
	{
		this.studentService = studentService;
	}

	//[end]
	/**
	 * 添加一条学生信息
	 * @author Bottle
	 * @date 2013-5-26 上午10:46:18
	 * @return
	 * @throws IOException 
	 */
	public String addStuInfor() throws IOException
	{
		
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");//防止弹出的信息出现乱码
		PrintWriter out = response.getWriter();
		UserService userService = new UserService();
		UserObj userObj = new UserObj();
		userObj.setUserName(studentObj.getStudentID());
		userObj.setPassword(studentObj.getStudentID());
		userObj.setRole("0");
		
		String id = studentObj.getStudentID();
		if (studentService.hadStudent(id))//判断是否有此学号
		{
			out.print("<script>alert('添加失败！学号重复')</script>");
		} else {
			boolean insertSuccess = studentService.addStuInfor(studentObj);
			boolean userInforInsertSuccess = studentService.addUserInfor(userObj);
			if (insertSuccess && userInforInsertSuccess)
			{
				out.print("<script>alert('添加成功！')</script>");
			} else
			{
				out.print("<script>alert('添加失败！')</script>");
			}
		}
		
		out.print("<script>window.location.href='./studentManage/studentAdd.jsp'</script>");
		out.flush();
		out.close();
		return null;
	}

	/**
	 * 获取学生信息
	 * @return
	 */
	public String getStudentInfoList()
	{
		if (studentObj == null)
		{
			studentObj = new StudentObj();
		}
		HashMap map = this.getCountQueryParam();
		int totalRows = studentService.getStudentInforCount(studentObj);
		map = this.getQueryParam(totalRows);
		studentObj.setRowStart(Integer.parseInt(map.get("rowStart").toString()) - 1);
		studentObj.setRowEnd(Integer.parseInt(map.get("rowEnd").toString()) - 1);
		studentInforList = studentService.getStudentInfoList(studentObj);
		for (int i = 0; i < studentInforList.size(); i++)
		{
			if (studentInforList.get(i) == null)
			{
				continue;
			}
			//根据数据库中0|1的值来判断男女
			if (studentInforList.get(i).get("Sex").toString().equals("1"))
			{
				studentInforList.get(i).put("Sex", "男");
			} else
			{
				studentInforList.get(i).put("Sex", "女");
			}
		}
		return SUCCESS;
	}

	/**
	 * 删除学生信息
	 * @return
	 */
	public String deleteStudentInfor()
	{
		boolean deleteSuccess = studentService.deleteStudentInfor(studentId);
		if (deleteSuccess)
		{
			return "success";
		} else
		{
			return "";
		}
	}

	/**
	 * 根据学号获取学生信息
	 * @return
	 */
	public String getStudentInforById()
	{
		HashMap map = new HashMap();
		String operateType = request.getParameter("operateType");
		map.put("studentId", studentId);
		studentObj = studentService.getStudentInforById(map);
		if (studentObj != null)
		{
			if (operateType.equals("read"))
			{
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
	 * 更新学生信息
	 */
	public void studentInforUpdate()
	{
		boolean updataSuccess = studentService.studentInforUpdate(studentObj);
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");//防止弹出的信息出现乱码
		PrintWriter out;
		try
		{
			out = response.getWriter();
			if (updataSuccess)
			{
				out.print("<script>alert('修改成功！')</script>");
			} else
			{
				out.print("<script>alert('修改失败！')</script>");
			}
			out.print("<script>window.close()</script>");
			out.flush();
			out.close();
		} catch (IOException e)
		{
			e.printStackTrace();
		}
	}

	/**
	 * 学期注册
	 * @throws IOException 
	 */
	public void studentRegister() throws IOException
	{
		int registerTerm = Integer.valueOf(request.getParameter("registerTerm"));//注册的学期
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");//防止弹出的信息出现乱码
		PrintWriter out;
		out = response.getWriter();
		if (studentId.equals(""))//判断学号是否为空
		{
			out.print("<script>alert('注册失败！学号不能为空！')</script>");
		} else if (!studentService.hadStudent(studentId))//判断是否有此学号
		{
			out.print("<script>alert('注册失败！学号不正确')</script>");
		} else
		{
			boolean registerSuccess = studentService.studentRegister(studentId, registerTerm);
			if (registerSuccess)
			{
				out.print("<script>alert('注册成功！')</script>");
			} else
			{
				out.print("<script>alert('注册失败！')</script>");
			}
		}
		out.print("<script>window.location.href='./studentManage/studentRegister.jsp'</script>");
		out.flush();
		out.close();
	}

	/**
	 * 学生【休学处理】
	 * @author Bottle
	 * @date 2013-5-22 下午4:20:58
	 * @throws IOException
	 */
	public void studentDrop() throws IOException
	{
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");//防止弹出的信息出现乱码
		PrintWriter out = response.getWriter();
		if (studentId.equals(""))//判断学号是否为空
		{
			out.print("<script>alert('处理失败！学号不能为空！')</script>");
		} else if (!studentService.hadStudent(studentId))//判断是否有此学号
		{
			out.print("<script>alert('处理失败！学号不正确！')</script>");
		} else if (DropOut.equals("2"))
		{
			out.print("<script>alert('处理失败！请选择处理方式！')</script>");
		} else
		{
			HashMap map = new HashMap();
			map.put("studentId", studentId);
			map.put("DropOut", DropOut);
			boolean registerSuccess = studentService.studentDrop(map);
			if (registerSuccess)
			{
				out.print("<script>alert('处理成功！')</script>");
			} else
			{
				out.print("<script>alert('处理失败！')</script>");
			}
		}
		out.print("<script>window.location.href='./studentManage/studentDrop.jsp'</script>");
		out.flush();
		out.close();
	}

	@Override
	public void setServletResponse(HttpServletResponse response)
	{
		this.response = response;
	}
}
