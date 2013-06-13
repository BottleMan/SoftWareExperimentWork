package com.srs.common;
public class Page {	
	private int pageSize = 20;//设置一页显示的记录数		
	private int startRow;//当前页码开始记录数
	private int endRow;//当前页码结束记录数
	private int currentPage;//当前页
	private int totalRows;//总行数
	private int totalPages;//总页数
	
	
	
	
	public int getCurrentPage()
	{
		return currentPage;
	}
	public int getStartRow()
	{
		return startRow;
	}
	public int getEndRow()
	{
		return endRow;
	}
	public Page() {
	}
	//构造pager对象
	public Page(int totalRows,String pagerMethod,int currentPage) {		
		this.totalPages=totalRows/pageSize;				
		int mod=totalRows%pageSize;
		if(mod>0){
			totalPages++;
		}		
		
		if(pagerMethod==null || pagerMethod.equals("first"))
		{
			currentPage=1;
			this.startRow=1;
			
		}		
		else if(pagerMethod.equals("previous"))
		{			
			if (currentPage > 1) {
				currentPage--;
				this.startRow = (currentPage - 1) * pageSize+1;		
			}			
			else {
				currentPage=1;
				this.startRow=1;
			}
				
		}
		else if(pagerMethod.equals("next"))
		{			
			if (currentPage < totalPages) {
				currentPage++;
			}
			this.startRow = (currentPage - 1) * pageSize+1;			
		}
		else if(pagerMethod.equals("last"))
		{			
			currentPage = totalPages;
			this.startRow = (currentPage - 1) * pageSize+1;	
		}
		endRow=this.startRow+pageSize;					
		this.totalRows=totalRows;	
		this.currentPage=currentPage;
	}
	public int getTotalRows()
	{
		return totalRows;
	}
	public int getTotalPages()
	{
		return totalPages;
	}
	
	
	
	
}
