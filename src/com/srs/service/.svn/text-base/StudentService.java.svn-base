package com.srs.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import com.srs.bean.StudentObj;
import com.srs.bean.UserObj;
import com.srs.dao.StudentDao;

/**
 * 
 * @author Bottle
 * @date 2013-5-1 下午12:57:33
 */
public class StudentService
{
	public StudentDao studentDao;

	public void setStudentDao(StudentDao studentDao)
	{
		this.studentDao = studentDao;
	}

	/**
	 * 添加学生信息
	 * @param studentObj 学生信息实体
	 * @return 插入信息成功返回true，否则，返回false
	 */
	public boolean addStuInfor(StudentObj studentObj)
	{
		return studentDao.addStuInfor(studentObj);
	}

	/**
	 * 获取学生信息
	 * @return
	 */
	public List<HashMap> getStudentInfoList(StudentObj studentObj)
	{
		return studentDao.getStudentInforList(studentObj);
	}

	/**
	 * 获取学生信息条数
	 * @param studentObj 
	 * @return
	 */
	public int getStudentInforCount(StudentObj studentObj)
	{
		return studentDao.getStudentInforCount(studentObj);
	}

	/**
	 * 删除指定学号的学生信息
	 * @param studentId
	 * @return
	 */
	public boolean deleteStudentInfor(String studentId)
	{
		return studentDao.deleteStudentInfor(studentId);
	}

	/**
	 * 根据学号获取学生信息
	 * @param map
	 * @return
	 */
	public StudentObj getStudentInforById(HashMap map)
	{
		StudentObj studentObj = studentDao.getStudentInforById(map);
		//判断性别
		if (studentObj.getSex().equals("1"))
		{
			studentObj.setSex("男");
		} else
		{
			studentObj.setSex("女");
		}
		//格式化出生日期和入学时间
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
		try
		{
			studentObj.setBirthday(dateformat.format(DateFormat.getDateInstance().parse(studentObj.getBirthday())));
			studentObj.setEntranceTime(dateformat.format(DateFormat.getDateInstance().parse(studentObj.getEntranceTime())));
		} catch (ParseException e)
		{
			e.printStackTrace();
		}
		//判断第一学期是否注册
		if (studentObj.getFirstRegister().equals("1"))
		{
			studentObj.setFirstRegister("是");
		} else
		{
			studentObj.setFirstRegister("否");
		}
		//判断第二学期是否注册
		if (studentObj.getSecondRegister().equals("1"))
		{
			studentObj.setSecondRegister("是");
		} else
		{
			studentObj.setSecondRegister("否");
		}
		//判断第三学期是否注册
		if (studentObj.getThirdRegister().equals("1"))
		{
			studentObj.setThirdRegister("是");
		} else
		{
			studentObj.setThirdRegister("否");
		}
		//判断第四学期是否注册
		if (studentObj.getFourthRegister().equals("1"))
		{
			studentObj.setFourthRegister("是");
		} else
		{
			studentObj.setFourthRegister("否");
		}
		//判断是否休学
		if (studentObj.getDropOut().equals("1"))
		{
			studentObj.setDropOut("是");
		} else
		{
			studentObj.setDropOut("否");
		}
		return studentObj;
	}

	/**
	 * 更新学生信息
	 * @param studentObj
	 * @return
	 */
	public boolean studentInforUpdate(StudentObj studentObj)
	{
		//判断性别
		if (studentObj.getSex().equals("男"))
		{
			studentObj.setSex("1");
		} else
		{
			studentObj.setSex("0");
		}
		//判断第一学期是否注册
		if (studentObj.getFirstRegister().equals("是"))
		{
			studentObj.setFirstRegister("1");
		} else
		{
			studentObj.setFirstRegister("0");
		}
		//判断第二学期是否注册
		if (studentObj.getSecondRegister().equals("是"))
		{
			studentObj.setSecondRegister("1");
		} else
		{
			studentObj.setSecondRegister("0");
		}
		//判断第三学期是否注册
		if (studentObj.getThirdRegister().equals("是"))
		{
			studentObj.setThirdRegister("1");
		} else
		{
			studentObj.setThirdRegister("0");
		}
		//判断第四学期是否注册
		if (studentObj.getFourthRegister().equals("是"))
		{
			studentObj.setFourthRegister("1");
		} else
		{
			studentObj.setFourthRegister("0");
		}
		//判断是否休学
		if (studentObj.getDropOut().equals("是"))
		{
			studentObj.setDropOut("1");
		} else
		{
			studentObj.setDropOut("0");
		}
		return studentDao.studentInforUpdate(studentObj);
	}

	/**
	 * 学期注册
	 * @param registerTerm 
	 * @param studentId 
	 * @return
	 */
	public boolean studentRegister(String studentId, int registerTerm)
	{
		String rtString = "";
		switch (registerTerm)
		{
			case 1:
				rtString = "FirstRegister";
				break;
			case 2:
				rtString = "SecondRegister";
				break;
			case 3:
				rtString = "ThirdRegister";
				break;
			case 4:
				rtString = "FourthRegister";
				break;
			default:
				break;
		}
		return studentDao.studentRegister(studentId, rtString);
	}

	/**
	 * 查询是否有此学号的学生
	 * @param studentId
	 * @return
	 */
	public boolean hadStudent(String studentId)
	{
		return studentDao.hadStudent(studentId);
	}

	/**
	 * 学生【休学处理】
	 * @author Bottle
	 * @date 2013-5-22 下午4:25:36
	 * @param map
	 * @return
	 */
	public boolean studentDrop(HashMap map)
	{
		return studentDao.studentDrop(map);
	}

	/**
	 * 添加用户账号
	 * @author Bottle
	 * @date 2013-5-24 下午9:55:38
	 * @param userObj
	 * @return
	 */
	public boolean addUserInfor(UserObj userObj)
	{
		return studentDao.addUserInfor(userObj);
	}
}
