package com.jk.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;


public class Js {
	private String  jsid;
	private String  jsname;
	private String  jsms;
	@DateTimeFormat
	private Date    cjtime;
	private Date    cjks;
	private Date    cjjs;
	@DateTimeFormat
	private Date    xgtime;
	private Integer jspx;
	
	private String  date1;
	private String  date2;
	
private Integer page;
	
	private Integer rows;
	private Integer count;
	public String getJsid() {
		return jsid;
	}
	public void setJsid(String jsid) {
		this.jsid = jsid;
	}
	public String getJsname() {
		return jsname;
	}
	public void setJsname(String jsname) {
		this.jsname = jsname;
	}
	public String getJsms() {
		return jsms;
	}
	public void setJsms(String jsms) {
		this.jsms = jsms;
	}
	public Date getCjtime() {
		return cjtime;
	}
	public void setCjtime(Date cjtime) {
		this.cjtime = cjtime;
	}
	public Date getXgtime() {
		return xgtime;
	}
	public void setXgtime(Date xgtime) {
		this.xgtime = xgtime;
	}
	public String getDate1() {
		return date1;
	}
	public void setDate1(String date1) {
		this.date1 = date1;
	}
	public String getDate2() {
		return date2;
	}
	public void setDate2(String date2) {
		this.date2 = date2;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public Integer getJspx() {
		return jspx;
	}
	public void setJspx(Integer jspx) {
		this.jspx = jspx;
	}
	public Date getCjks() {
		return cjks;
	}
	public void setCjks(Date cjks) {
		this.cjks = cjks;
	}
	public Date getCjjs() {
		return cjjs;
	}
	public void setCjjs(Date cjjs) {
		this.cjjs = cjjs;
	}
	@Override
	public String toString() {
		return "Js [jsid=" + jsid + ", jsname=" + jsname + ", jsms=" + jsms + ", cjtime=" + cjtime + ", cjks=" + cjks
				+ ", cjjs=" + cjjs + ", xgtime=" + xgtime + ", jspx=" + jspx + ", date1=" + date1 + ", date2=" + date2
				+ ", page=" + page + ", rows=" + rows + ", count=" + count + "]";
	}
}
