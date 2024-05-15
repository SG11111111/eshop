package com.it.controller;



import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.it.dao.ImgadvDao;
import com.it.entity.Imgadv;
import com.it.util.Info;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Controller
public class ImgadvController {
    @Resource
	ImgadvDao imgadvDao;


    //后台滚动图片列表
	@RequestMapping("admin/imgadvList")
	public String imgadvList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum,HttpServletRequest request) {
		PageHelper.startPage(pageNum,10);
		List<Imgadv> list = imgadvDao.selectAll();
		PageInfo<Imgadv> pageInfo = new PageInfo<Imgadv>(list);
		request.setAttribute("pageInfo", pageInfo);
		System.out.println(pageInfo.getList());
		return "imgadvlist";
	}

	//添加滚动图片
	@RequestMapping("admin/imgadvAdd")
	public String imgadvAdd(Imgadv imgadv,HttpServletRequest request) {
		imgadvDao.add(imgadv);
		return "redirect:imgadvList";
	}

	//删除滚动图片
	@RequestMapping("admin/imgadvDel")
	public String imgadvDel(Integer id,HttpServletRequest request) {
		imgadvDao.delete(id);
		return "redirect:imgadvList";
	}



}
