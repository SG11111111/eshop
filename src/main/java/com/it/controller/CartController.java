package com.it.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.it.dao.AddressDao;
import com.it.dao.CartDao;
import com.it.dao.MemberDao;
import com.it.dao.ProductDao;
import com.it.entity.Address;
import com.it.entity.Cart;
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
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

@Controller
public class CartController {
    @Resource
	CartDao cartDao;
	@Resource
	ProductDao productDao;
	@Resource
	Savesession savesession;
	@Resource
	AddressDao addressDao;
	@Resource
	MemberDao memberDao;


    //前台购物车列表
	@RequestMapping("cartList")
	public String cartList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum,HttpServletRequest request) {
		Member sessionmember = (Member)request.getSession().getAttribute("sessionmember");
		if(sessionmember!=null) {
			Member mmm = memberDao.findById(sessionmember.getId());
			PageHelper.startPage(pageNum, 10);
			HashMap map = new HashMap();
			map.put("memberid",sessionmember.getId());
			List<Cart> list = cartDao.selectAll(map);
			double total = 0;
			for(Cart cart:list){
				Product product = productDao.findById(Integer.parseInt(cart.getProductid()));
				double sjprice =0;
				if(product.getTjprice()!=null&&product.getTjprice()>0){
					sjprice = product.getTjprice();
				}else{
					sjprice = product.getPrice();
				}

				if(mmm.getLev().equals("会员")){
					sjprice=sjprice*0.9;
				}else if(mmm.getLev().equals("高级会员")){
					sjprice=sjprice*0.8;
				}

				double xjtotal  = sjprice*cart.getNum();
				cart.setXjtotal(Double.parseDouble(String.format("%.2f", xjtotal)) );
				cart.setProduct(product);
                total+=sjprice*cart.getNum();
			}
            request.setAttribute("total", String.format("%.2f", total));
			PageInfo<Cart> pageInfo = new PageInfo<Cart>(list);
			request.setAttribute("pageInfo", pageInfo);
			savesession.getSessionMember(request);
			return "cartlist";
		}else{
			return "redirect:login";
		}
	}

	//添加购物车
	@RequestMapping("addCart")
	public void addCart(Cart cart, HttpServletRequest request, HttpServletResponse response) {
		Member member = (Member)request.getSession().getAttribute("sessionmember");
		try {
			PrintWriter out = response.getWriter();
			String flag = "";
			if(member!=null){
				HashMap map = new HashMap();
				map.put("memberid",member.getId());
				map.put("productid",cart.getProductid());
				List<Cart> list = cartDao.selectAll(map);
				if(list.size()==0){
					cart.setMemberid(String.valueOf(member.getId()));
					cartDao.add(cart);
					flag="1";
				}else{
					Cart car = list.get(0);
					int num = car.getNum()+cart.getNum();
					car.setNum(num);
					cartDao.update(car);
					flag="2";
				}
				savesession.getCartSession(request);
			}else{
				flag="0";
			}
			out.write(flag);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	//删除购物车
	@RequestMapping("cartDel")
	public void cartDel(int id, HttpServletRequest request, HttpServletResponse response) {
		try {
			Member member = (Member)request.getSession().getAttribute("sessionmember");
			PrintWriter out = response.getWriter();
			String flag = "";
			cartDao.delete(id);
			savesession.getCartSession(request);
			flag="1";
			out.write(flag);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	//更新购物车数量
    @RequestMapping("updateNum")
    public void updateNum(Cart cart, HttpServletRequest request, HttpServletResponse response) {
        try {
            Member member = (Member)request.getSession().getAttribute("sessionmember");
            PrintWriter out = response.getWriter();
            String flag = "";
            Cart car = cartDao.findById(cart.getId());
            car.setNum(cart.getNum());
            cartDao.update(car);


            savesession.getCartSession(request);
            flag=String.valueOf(request.getSession().getAttribute("total"));
            out.write(flag);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //结算页面
	@RequestMapping("checkOut")
	public String checkOut(HttpServletRequest request){
		Member member = (Member)request.getSession().getAttribute("sessionmember");
		if(member!=null){
			HashMap map  = new HashMap();
			map.put("memberid",member.getId());
			List<Cart> list = cartDao.selectAll(map);
			for(Cart cart:list){
				Product product = productDao.findById(Integer.parseInt(cart.getProductid()));
				cart.setProduct(product);
				double sjprice =0;
				if(product.getTjprice()!=null&&product.getTjprice()>0){
					sjprice = product.getTjprice();
				}else{
					sjprice = product.getPrice();
				}
				double xjtotal = sjprice*cart.getNum();
                cart.setXjtotal(Double.parseDouble(String.format("%.2f", xjtotal)) );
			}
			request.setAttribute("list",list);
			List<Address> addresslist = addressDao.selectAll(map);
			request.setAttribute("addresslist",addresslist);
			return "checkout";

		}else{
			return "redirect:index";
		}
	}

	

}
