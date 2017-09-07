package com.jk.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jk.entity.Js;
import com.jk.service.JsService;
import com.jk.util.BaseController;
import com.jk.util.Json;
@Controller
@RequestMapping(value="js")
public class JsAction extends BaseController{
	
	@Autowired
	private JsService service;
	List list =new ArrayList();
	
	@RequestMapping("jslist")
	public void jslist(Js js,int page ,int rows,HttpServletResponse response){
		Json json =new Json();
		page=(page-1)*rows;
		js.setPage(page);
		js.setRows(rows);
		SimpleDateFormat sim =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if (js.getDate1()!=null&&!"".equals(js.getDate1())) {
			try {
				js.setCjks(sim.parse(js.getDate1()));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		if (js.getDate2()!=null&&!"".equals(js.getDate2())) {
			try {
				js.setCjjs(sim.parse(js.getDate2()));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		Map<String,Object> map =new HashMap<String,Object>();
		try {
			list = service.jslist(js);
			long count =service.count(js);
			map.put("total",(int)count);
			map.put("rows", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		this.writeJson(map, response);
	}
	@RequestMapping(value="jsadd")
	public  void jsadd(Js js,HttpServletResponse response){
			try {
				js.setCjtime(new Date());
				service.jsadd(js);
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				PrintWriter writer = response.getWriter();
				writer.flush();
				writer.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
	}
	@RequestMapping(value="deletejs")
	public  void deletejs(String ids,HttpServletResponse response){
				try {
					service.deletejs(ids);
				} catch (Exception e) {
					e.printStackTrace();
				}
				try {
					PrintWriter writer = response.getWriter();
					writer.flush();
					writer.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
	}
	@RequestMapping(value="toupdatejs")
	public String toupdatejs(Js js,HttpServletRequest request){
		Js j =new Js();
		try {
			 j =service.toupdatejs(js);
			 request.setAttribute("uu", j);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "updatejs";
	}
	@RequestMapping(value="updatejs")
	public void updatejs(Js js,HttpServletResponse h){
		js.setXgtime(new Date());
		try {
			service.updatejs(js);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			PrintWriter writer = h.getWriter();
			writer.flush();
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
