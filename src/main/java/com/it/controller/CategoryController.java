package com.it.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import com.google.gson.Gson;
import com.it.dao.CategoryDao;
import com.it.entity.Category;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

@Controller
public class CategoryController {
    @Resource
	CategoryDao categoryDao;


    //后台类别列表
	@RequestMapping("admin/categoryList")
	public String newsList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum,HttpServletRequest request) {
		PageHelper.startPage(pageNum,10);
		String key = request.getParameter("key");
		HashMap map = new HashMap();
		map.put("key", key);
		List<Category> list = categoryDao.selectAll(map);
		for (Category category:list){
			List<Category> childlist = categoryDao.findChild(category.getId());
			category.setChildlist(childlist);
		}
		PageInfo<Category> pageInfo = new PageInfo<Category>(list);
		request.setAttribute("key", key);
		request.getSession().setAttribute("fcategorylist", list);
		request.setAttribute("pageInfo", pageInfo);
		return "categorylist";
	}

	//添加类别
	@RequestMapping("admin/categoryAdd")
	public String categoryAdd(Category category,HttpServletRequest request) {
		categoryDao.add(category);
		return "redirect:categoryList";
	}

	//删除类别
	@RequestMapping("admin/categoryDel")
	public String categoryDel(Integer id,HttpServletRequest request) {
		Category category = categoryDao.findById(id);
		category.setDelstatus("1");
		categoryDao.update(category);
		return "redirect:categoryList";
	}

	//查找news到修改页面
	@RequestMapping("admin/categoryShow")
	public String categoryShow(Integer id,HttpServletRequest request) {
		Category category = categoryDao.findById(id);
		request.setAttribute("category",category);
		return "categoryedit";
	}

	//修改类别
	@RequestMapping("admin/categoryEdit")
	public String categoryEdit(Category category,HttpServletRequest request) {
		categoryDao.update(category);
		return "redirect:categoryList";
	}

	//得到二级类别
	@RequestMapping("admin/findChildCategory")
	public void searchCtype(HttpServletRequest request, HttpServletResponse response){
		String fid = request.getParameter("fid");
		String xml = "";
		List<Category> list = categoryDao.findChild(Integer.parseInt(fid));
		if(list.size()>0){
			for(Category category:list){
				xml += "<option value='"+category.getId()+"'>"+category.getName()+"</option>";
			}
		}else{
			xml ="<option value=''>请选择上一级目录</opion>";
		}
		System.out.println("xml==="+xml);
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		PrintWriter out;
		try {
			out = response.getWriter();
			Gson gson = new Gson();
			String flag = gson.toJson(xml);
			out.write(flag);
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
