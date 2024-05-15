package com.it.controller;

import javax.annotation.Resource;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

import com.it.dao.*;
import com.it.entity.*;
import com.it.util.Info;
import com.it.util.Savesession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.*;

@Controller
public class BackproductController{
	@Resource
	BackproductDAO backproductDAO;
	@Resource
	InventoryDAO inventoryDAO;
	@Resource
	DingdanmsgDao dingdanmsgDao;
	@Resource
	ProductDao productDAO;
	@Resource
	MemberDao memberDao;
	@Resource
	Savesession savesession;
	//后台查询退货列表
	@RequestMapping("/admin/backproductList")
	public String backproductList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum,HttpServletRequest request) {
		String key = request.getParameter("key");
   	    HashMap map = new HashMap();
   	    map.put("key", key);
   	    PageHelper.startPage(pageNum, 10);
		List<Backproduct> list = backproductDAO.selectAll(map);
		for(Backproduct backproduct:list){
			Dingdanmsg dingdanmsg = dingdanmsgDao.findById(backproduct.getOrderid());
			Product product = productDAO.findById(backproduct.getProductid());
			Member member = memberDao.findById(backproduct.getMemberid());
			backproduct.setDingdanmsg(dingdanmsg);
			backproduct.setProduct(product);
			backproduct.setMember(member);
		}
		PageInfo<Backproduct> pageInfo = new PageInfo<Backproduct>(list);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("key", key);
		return "backproductlist";
	}


	//添加退货
	@RequestMapping("skipBackproduct")
	public String skipBackproduct(HttpServletRequest request){
		String orderid = request.getParameter("orderid");
		request.setAttribute("orderid", orderid);
		savesession.getSessionMember(request);
		return "backproductadd";
	}
	
	
	//添加退货 
	@RequestMapping("backproductAdd")
	public String backproductAdd(HttpServletRequest request, RedirectAttributes redirectAttributes){
		Member member = (Member)request.getSession().getAttribute("sessionmember");
		String orderid = request.getParameter("orderid");
		String content = request.getParameter("content");
		Dingdanmsg od = dingdanmsgDao.findById(Integer.parseInt(orderid));
		Backproduct backproduct = new Backproduct();
		backproduct.setMemberid(member.getId());
		backproduct.setProductid(Integer.parseInt(od.getProductid()));
		backproduct.setSavetime(Info.getDateStr());
		backproduct.setContent(content);
		backproduct.setOrderid(Integer.parseInt(orderid));
		backproduct.setShstatus("待审核");
		backproductDAO.add(backproduct);
		od.setThstatus("已提交退货申请");
		dingdanmsgDao.update(od);
		redirectAttributes.addFlashAttribute("message","已提交申请");
		return "redirect:skipBackproduct";
	}
	
	//退货
	@RequestMapping("admin/updatebacksh")
	public String updatebacksh(Backproduct backproduct, HttpServletRequest request){
		String type = request.getParameter("type")==null?"":request.getParameter("type");
		Backproduct bg = backproductDAO.findById(backproduct.getId());
		Product product = productDAO.findById(bg.getProductid());
		Dingdanmsg dingdanmsg = dingdanmsgDao.findById(bg.getOrderid());
		Member member = memberDao.findById(bg.getMemberid());
		if(type.equals("ty")){
			Inventory inventory = new Inventory();
			inventory.setNum(dingdanmsg.getNum());
			inventory.setProductid(String.valueOf(bg.getProductid()));
			inventory.setFlag("in");
			inventoryDAO.add(inventory);
			
			
			bg.setShstatus("已退货");
			backproductDAO.update(bg);
			dingdanmsg.setThstatus("已退货");
			dingdanmsgDao.update(dingdanmsg);
		}else{
			dingdanmsg.setThstatus("拒绝退货");
			dingdanmsgDao.update(dingdanmsg);
			bg.setShstatus("已拒绝");
			backproductDAO.update(bg);
		}
		return "redirect:backproductList";
	}
	
	
	//删除退货
	@RequestMapping("admin/backproductDel")
	public String pictureDelAll(int id,HttpServletRequest request,HttpServletResponse response){
			backproductDAO.delete(id);
		return "redirect:backproductList";
	}
	
	
	
	

}
