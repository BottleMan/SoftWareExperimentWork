package com.srs.action;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.ecside.table.limit.FilterSet;
import org.ecside.table.limit.Limit;
import org.ecside.table.limit.Sort;
import org.ecside.util.ECSideUtils;
import org.ecside.util.RequestUtils;

import com.opensymphony.xwork2.ActionSupport;
import com.srs.common.Page;

public abstract class AbstractAction extends ActionSupport implements SessionAware, ServletRequestAware
{
	private static final long serialVersionUID = 9206154685565850266L;
	protected static final java.lang.String RIGHTERROR = "rightError";//权限错误
	protected HttpServletRequest request = null;
	protected Map<String, Object> session = null;
	protected Page page;
	//外网分页需要属性
	protected String pagerMethod;
	//外网分页需要属性
	protected int currentPage;
	private HashMap errorMap = new HashMap();

	protected void addError(String errorObject, String errorMessage)
	{
		errorMap.put(errorObject, errorMessage);
		request.setAttribute("errorMap", errorMap);
	}
	protected HashSet<Integer> userModels;//用户当前可访问的modelid

	public void setCurrentPage(int currentPage)
	{
		this.currentPage = currentPage;
	}

	public void setPagerMethod(String pagerMethod)
	{
		this.pagerMethod = pagerMethod;
	}

	public Page getPage()
	{
		return page;
	}

	public void setServletRequest(HttpServletRequest request)
	{
		this.request = request;
	}

	public void setSession(Map<String, Object> session)
	{
		this.session = session;
		this.userModels = (HashSet<Integer>) session.get("userModels");
	}
	private Limit limit = null;
	private final int DEFAULT_PAGE_SIZE = 10;
	private HashMap queryParam = null;

	/*
	 * 国际化：列表的“每页”。
	 */
	public String getEachpagetext()
	{
		return getText("0000000009");
	}

	/*
	 * 国际化：列表的“条”。
	 */
	public String getRecordtext()
	{
		return getText("0000000010");
	}

	/**
	 * @author 韩云辉
	 * @Date Oct 27, 2010
	 * @Describe:用于外网翻页
	 * @parameter @param totalRows 总行数
	 * @parameter @param map 查询的条件参数
	 */
	protected void refreshPage(int totalRows, HashMap map)
	{
		this.page = new Page(totalRows, this.pagerMethod, this.currentPage);
		map.put("rowStart", page.getStartRow());
		map.put("rowEnd", page.getEndRow());
		currentPage = 0;
		this.pagerMethod = null;
	}

	protected HashMap getCountQueryParam()
	{
		queryParam = new HashMap();
		// 默认每页显示的记录条数		
		limit = RequestUtils.getLimit(request);
		// 基于数据库的排序.
		// ECSide会帮助开发人员取得排序的相关信息:当前是按哪个(目前只支持单列排序)column排序的,以及排序的方式desc或asc,
		// 这个信息以key-value方式存放在map里.
		// 但是至于如果处理这些信息(如组装成sql语句),则是由开发人员自己在DAO里完成的.
		// 基于数据库过滤.
		// ECSide会帮助开发人员取得过滤的相关信息:当前是对哪些column进行过滤,以及过滤的内容是什么,这个信息以key-value方式存放在map里.
		// 但是至于如果处理这些信息(如组装成sql语句),则是由开发人员自己在DAO里完成的.
		FilterSet filterSet = limit.getFilterSet();
		Map filterPropertyMap = filterSet.getPropertyValueMap();
		// 在本例中, sort 和 filter 相关信息将被传入 DAO,用于拼装sql语句.
		// 其实,此时的排序 过滤就和我们以前的传统的查询非常类似:从查询页面取得查询条件,传入DAO.
		return queryParam;
	}

//		// TODO ： userInfoDAO.getUserInfoNumber()为能够取得总行数的方法，请替换为实际的实现。
//		// 取得记录总条数时,不要忘了把filter作为参数传入,因为要取得的总行数也是要接受条件限制的.
//		int totalRows = worksApplicationService.getApplicationListCount(param);
//		
//		
//
//		// DEFAULT_PAGE_SIZE ==0 时, 每页记录数会使用 properties文件内的默认设置
//		// DEFAULT_PAGE_SIZE <0 时, 每页记录数会等于全部记录数
//		limit.setRowAttributes(totalRows, DEFAULT_PAGE_SIZE);
//
//		// 取得当前要查询的页面的记录起止行号
//		// offset表示数据编号的起始号.
//		// ORACLE数据库一般是从1开始的,HSQLDB是从0开始,默认是从0开始计数,在这里我们使用从0开始.
//		int offset = 1;
//		int[] rowStartEnd = new int[]
//		{ limit.getRowStart() + offset, limit.getRowEnd() + offset };
//
//		// TODO ： userInfoDAO.getSomeUserInfo(rowStartEnd[0], rowStartEnd[1])
//		// 为查询记录的方法，请替换为实际的实现。rowStartEnd[0], rowStartEnd[1]为起止行
//		// rowStartEnd[0], rowStartEnd[1] 左闭 右开
//		/*List rslist = userInfoDAO.getSomeUserInfo(rowStartEnd[0],
//				rowStartEnd[1], sortValueMap, filterPropertyMap);*/
//		
//		param=new HashMap();
//		param.put("rowStart",rowStartEnd[0]);
//		param.put("rowEnd",rowStartEnd[1]);
//		
//		applicationList=worksApplicationService.getApplicationList(param);		
//
//		return SUCCESS;		
	public HashMap getQueryParam(int rowsCount)
	{
		Sort sort = limit.getSort();
		Map sortValueMap = sort.getSortValueMap();
		String sortParam = ECSideUtils.getDefaultSortSQL(sortValueMap);
		if (!sortParam.equals(""))
		{
			queryParam.put("sortParam", sortParam.substring(9));
		}
		// DEFAULT_PAGE_SIZE ==0 时, 每页记录数会使用 properties文件内的默认设置
		// DEFAULT_PAGE_SIZE <0 时, 每页记录数会等于全部记录数
		limit.setRowAttributes(rowsCount, DEFAULT_PAGE_SIZE);
		// 取得当前要查询的页面的记录起止行号
		// offset表示数据编号的起始号.
		// ORACLE数据库一般是从1开始的,HSQLDB是从0开始,默认是从0开始计数,在这里我们使用从0开始.
		int offset = 2;
		int offset1 = 1;
		int[] rowStartEnd = new int[] { limit.getRowStart() + offset, limit.getRowEnd() + offset1 };
		// TODO ： userInfoDAO.getSomeUserInfo(rowStartEnd[0], rowStartEnd[1])
		// 为查询记录的方法，请替换为实际的实现。rowStartEnd[0], rowStartEnd[1]为起止行
		// rowStartEnd[0], rowStartEnd[1] 左闭 右开
		/*List rslist = userInfoDAO.getSomeUserInfo(rowStartEnd[0],
				rowStartEnd[1], sortValueMap, filterPropertyMap);*/
		queryParam.put("rowStart", rowStartEnd[0]);
		queryParam.put("rowEnd", rowStartEnd[1]);
		return queryParam;
	}
}
