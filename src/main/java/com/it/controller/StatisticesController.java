package com.it.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.it.dao.CartDao;
import com.it.dao.DingdanDao;
import com.it.dao.DingdanmsgDao;
import com.it.dao.ProductDao;
import com.it.entity.*;
import com.it.util.Savesession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
public class StatisticesController {
    @Resource
	CartDao cartDao;
	@Resource
	ProductDao productDao;
	@Resource
	Savesession savesession;
	@Resource
	DingdanmsgDao dingdanmsgDao;
	@Resource
	DingdanDao dingdanDao;





	@RequestMapping("admin/statisticsNum")
	public  String saleProduct(HttpServletRequest request) {
		String key = request.getParameter("key");
		String key1 = request.getParameter("key1");
		HashMap map = new HashMap();
		map.put("key", key);
		map.put("key1", key1);
		List<Product> plist = productDao.selectProductAll(map);
		//ArrayList nslist = new ArrayList();
		ArrayList nlist = new ArrayList();
		ArrayList slist = new ArrayList();
		for(Product product:plist){
			List<Dingdanmsg> ordermsgdetailslist = dingdanmsgDao.selectSale(product.getId());
			int i =0;
			nlist.add("'"+product.getProductname()+"'");
			if(ordermsgdetailslist.size()==0){
				slist.add(i);
			}else{
				for(Dingdanmsg ordermsgdetails:ordermsgdetailslist){
					i+=ordermsgdetails.getNum();
				}
				slist.add(i);
			}
		}
		request.setAttribute("key", key);
		request.setAttribute("key1", key1);
		request.setAttribute("nlist", nlist);
		request.setAttribute("slist", slist);
		return "tjsaleproduct";
	}


	//销售额
	@RequestMapping("admin/saleMoney")
	public  String saleMoney(HttpServletRequest request) {
		List<Dingdan> olist = dingdanDao.selectSaleMoney();
		//ArrayList nslist = new ArrayList();
		ArrayList nlist = new ArrayList();
		ArrayList slist = new ArrayList();
		for(Dingdan dingdan:olist){
			nlist.add("'"+dingdan.getSavetime()+"'");
			slist.add(dingdan.getTotal());
		}
		request.setAttribute("nlist", nlist);
		request.setAttribute("slist", slist);
		return "tjsalemoney";
	}

	

}
