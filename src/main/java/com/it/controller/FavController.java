package com.it.controller;



import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.it.dao.FavDao;
import com.it.dao.ProductDao;
import com.it.entity.Fav;
import com.it.entity.Member;
import com.it.entity.Product;
import com.it.util.Info;
import com.it.util.Savesession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.basic.BasicInternalFrameTitlePane;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

@Controller
public class FavController {
    @Resource
	FavDao favDao;
	@Resource
	ProductDao productDao;
	@Resource
	Savesession savesession;

    //收藏列表
	@RequestMapping("favLb")
	public String favList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum,HttpServletRequest request) {
		Member member = (Member)request.getSession().getAttribute("sessionmember");
		if(member!=null) {
			PageHelper.startPage(pageNum, 10);
			HashMap map = new HashMap();
			map.put("memberid",member.getId());
			List<Fav> list = favDao.selectAll(map);
			for(Fav fav:list){
				Product product = productDao.findById(Integer.parseInt(fav.getProductid()));
				fav.setProduct(product);
			}
			PageInfo<Fav> pageInfo = new PageInfo<Fav>(list);
			request.setAttribute("pageInfo", pageInfo);
			savesession.getSessionMember(request);
			return "favlb";
		}else{
			return "redirect:login";
		}
	}

	//添加收藏
	@RequestMapping("favAdd")
	public void favAdd(Fav fav, HttpServletRequest request, HttpServletResponse response) {
		Member member = (Member)request.getSession().getAttribute("sessionmember");
		try {
			PrintWriter out = response.getWriter();
			String flag = "";
			if(member!=null){
			    //String productid = request.getParameter("productid");
				HashMap map = new HashMap();
				map.put("memberid",member.getId());
				map.put("productid",fav.getProductid());
				System.out.println("productid==="+fav.getProductid());
				List<Fav> list = favDao.selectAll(map);
				if(list.size()==0 ) {
					fav.setMemberid(String.valueOf(member.getId()));
					favDao.add(fav);
					flag = "1";
				}else{
					flag = "2";
				}
			}else{
				flag="0";
			}
			out.write(flag);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	//删除收藏
	@RequestMapping("favDel")
	public void favDel(int id, HttpServletRequest request, HttpServletResponse response) {
		try {
			PrintWriter out = response.getWriter();
			String flag = "";
			favDao.delete(id);
			flag="0";
			out.write(flag);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}


}
