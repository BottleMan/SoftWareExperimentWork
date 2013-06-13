package com.srs.bean;

/**
 * 课程实体Bean
 * @author Bottle
 * @date 2013-4-30 下午5:21:49
 */
public class CourseObj
{
	private String CourseId;
	private String CourseNM;
	private String Credit;
	private String Semester;
	private String FirstCourseID;
	private String Major;
	private String Type;
	private String Schooltime;
	private String Teacher;
	private String Place;
	private String Number;
	private String ClassHour;
	
	private int rowStart;
	private int rowEnd;

	
	public int getRowStart()
	{
		return rowStart;
	}

	public void setRowStart(int rowStart)
	{
		this.rowStart = rowStart;
	}

	public int getRowEnd()
	{
		return rowEnd;
	}

	public void setRowEnd(int rowEnd)
	{
		this.rowEnd = rowEnd;
	}

	public String getClassHour()
	{
		return ClassHour;
	}

	public void setClassHour(String classHour)
	{
		ClassHour = classHour;
	}

	public String getCourseId()
	{
		return CourseId;
	}

	public void setCourseId(String courseId)
	{
		CourseId = courseId;
	}

	public String getCourseNM()
	{
		return CourseNM;
	}

	public void setCourseNM(String courseNM)
	{
		CourseNM = courseNM;
	}

	public String getCredit()
	{
		return Credit;
	}

	public void setCredit(String credit)
	{
		Credit = credit;
	}

	public String getSemester()
	{
		return Semester;
	}

	public void setSemester(String semester)
	{
		Semester = semester;
	}

	public String getFirstCourseID()
	{
		return FirstCourseID;
	}

	public void setFirstCourseID(String firstCourseID)
	{
		FirstCourseID = firstCourseID;
	}

	public String getMajor()
	{
		return Major;
	}

	public void setMajor(String major)
	{
		Major = major;
	}

	public String getType()
	{
		return Type;
	}

	public void setType(String type)
	{
		Type = type;
	}

	public String getSchooltime()
	{
		return Schooltime;
	}

	public void setSchooltime(String schooltime)
	{
		Schooltime = schooltime;
	}

	public String getTeacher()
	{
		return Teacher;
	}

	public void setTeacher(String teacher)
	{
		Teacher = teacher;
	}

	public String getPlace()
	{
		return Place;
	}

	public void setPlace(String place)
	{
		Place = place;
	}

	public String getNumber()
	{
		return Number;
	}

	public void setNumber(String number)
	{
		Number = number;
	}
}
