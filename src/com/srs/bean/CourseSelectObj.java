package com.srs.bean;

/**
 * 学生-选课表实体Obj
 * 
 * @author Bottle
 * @date 2013-5-16 上午10:44:56
 */
public class CourseSelectObj
{
	private String StudentId;
	private String CourseId;
	private String CourseGrade;
	private String Pass;
	private String Term;
	private String CourseNM;
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

	public CourseSelectObj()
	{
		this.CourseGrade = "-1";
		this.Pass = "0";
		this.Term = "1";
		this.CourseNM = "";
	}

	public String getCourseNM()
	{
		return CourseNM;
	}

	public void setCourseNM(String courseNM)
	{
		CourseNM = courseNM;
	}

	public String getStudentId()
	{
		return StudentId;
	}

	public void setStudentId(String studentId)
	{
		StudentId = studentId;
	}

	public String getCourseId()
	{
		return CourseId;
	}

	public void setCourseId(String courseId)
	{
		CourseId = courseId;
	}

	public String getCourseGrade()
	{
		return CourseGrade;
	}

	public void setCourseGrade(String courseGrade)
	{
		CourseGrade = courseGrade;
	}

	public String getPass()
	{
		return Pass;
	}

	public void setPass(String pass)
	{
		Pass = pass;
	}

	public String getTerm()
	{
		return Term;
	}

	public void setTerm(String term)
	{
		Term = term;
	}
}
