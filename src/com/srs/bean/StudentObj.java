package com.srs.bean;

/**
 * 学生实体Bean
 * @author Bottle
 * @date 2013-4-30 下午7:05:18
 */
public class StudentObj
{
	private String StudentID;
	private String StudentNM;
	private String Sex;
	private String Birthday;
	private String BirthPlace;
	private String ClassName;
	private String Department;
	private String EntranceTime;
	private String FirstRegister;
	private String SecondRegister;
	private String ThirdRegister;
	private String FourthRegister;
	private String DropOut;
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

	public StudentObj()
	{
		FirstRegister = "0";
		SecondRegister = "0";
		ThirdRegister = "0";
		FourthRegister = "0";
		DropOut = "0";
	}

	public String getStudentID()
	{
		return StudentID;
	}

	public void setStudentID(String studentID)
	{
		StudentID = studentID;
	}

	public String getStudentNM()
	{
		return StudentNM;
	}

	public void setStudentNM(String studentNM)
	{
		StudentNM = studentNM;
	}

	public String getSex()
	{
		return Sex;
	}

	public void setSex(String sex)
	{
		Sex = sex;
	}

	public String getBirthday()
	{
		return Birthday;
	}

	public void setBirthday(String birthday)
	{
		Birthday = birthday;
	}

	public String getBirthPlace()
	{
		return BirthPlace;
	}

	public void setBirthPlace(String birthPlace)
	{
		BirthPlace = birthPlace;
	}

	public String getClassName()
	{
		return ClassName;
	}

	public void setClassName(String className)
	{
		ClassName = className;
	}

	public String getDepartment()
	{
		return Department;
	}

	public void setDepartment(String department)
	{
		Department = department;
	}

	public String getEntranceTime()
	{
		return EntranceTime;
	}

	public void setEntranceTime(String entranceTime)
	{
		EntranceTime = entranceTime;
	}

	public String getFirstRegister()
	{
		return FirstRegister;
	}

	public void setFirstRegister(String firstRegister)
	{
		FirstRegister = firstRegister;
	}

	public String getSecondRegister()
	{
		return SecondRegister;
	}

	public void setSecondRegister(String secondRegister)
	{
		SecondRegister = secondRegister;
	}

	public String getThirdRegister()
	{
		return ThirdRegister;
	}

	public void setThirdRegister(String thirdRegister)
	{
		ThirdRegister = thirdRegister;
	}

	public String getFourthRegister()
	{
		return FourthRegister;
	}

	public void setFourthRegister(String fourthRegister)
	{
		FourthRegister = fourthRegister;
	}

	public String getDropOut()
	{
		return DropOut;
	}

	public void setDropOut(String dropOut)
	{
		DropOut = dropOut;
	}
}
