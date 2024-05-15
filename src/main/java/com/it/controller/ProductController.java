package com.it.controller;
import ch.qos.logback.core.net.SyslogOutputStream;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.it.dao.*;
import com.it.entity.*;
import com.it.util.Info;
import com.it.util.Kcrecord;
import com.it.util.Savesession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.websocket.Session;
import java.util.HashMap;
import java.util.List;

@Controller
public class ProductController {
    @Resource
	ProductDao productDao;
	@Resource
	CategoryDao categoryDao;
	@Resource
	Kcrecord kcrecord;
	@Resource
	CommentDao commentDao;
	@Resource
	MemberDao memberDao;
	@Resource
	DingdanmsgDao dingdanmsgDao;
	@Resource
	Savesession savesession;


    /**
     * 商品管理
     * @param pageNum
     * @param request
     * @return
     */
	@RequestMapping("admin/productList")
	public String productList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum,HttpServletRequest request) {
		String key = request.getParameter("key");
		String fid = request.getParameter("fid")==null?"":request.getParameter("fid");
		String sid = request.getParameter("sid");
		HashMap map = new HashMap();
		List<Category> clist = categoryDao.selectAll(map);
		map.put("key", key);
		map.put("fid", fid);
		map.put("sid", sid);
        PageHelper.startPage(pageNum,10);
		List<Product> list = productDao.selectAll(map);
		for (Product product:list){
			Category fcategory = categoryDao.findById(Integer.parseInt(product.getFid()) );
			Category scategory = categoryDao.findById(Integer.parseInt(product.getSid()) );
			product.setFcategory(fcategory);
			product.setScategory(scategory);
			int kc = kcrecord.getkc(product.getId());
			product.setKc(kc);
		}
		PageInfo<Product> pageInfo = new PageInfo<Product>(list);
		if(!fid.equals("")){
			List<Category> childlist = categoryDao.findChild(Integer.parseInt(fid));
			request.setAttribute("childlist", childlist);
		}
		request.setAttribute("key", key);
		request.setAttribute("fid", fid);
		request.setAttribute("sid", sid);
		request.setAttribute("clist", clist);
		request.setAttribute("pageInfo", pageInfo);
		return "productlist";
	}

    /**
     * 仓库管理
     * @param pageNum
     * @param request
     * @return
     */
	@RequestMapping("admin/warehouseList")
	public String warehouselist(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum,HttpServletRequest request) {
		String key = request.getParameter("key");
		String fid = request.getParameter("fid")==null?"":request.getParameter("fid");
		String sid = request.getParameter("sid");
		HashMap map = new HashMap();
		List<Category> clist = categoryDao.selectAll(map);
		map.put("key", key);
		map.put("fid", fid);
		map.put("sid", sid);
        PageHelper.startPage(pageNum,10);
		List<Product> list = productDao.selectAll(map);
		for (Product product:list){
			Category fcategory = categoryDao.findById(Integer.parseInt(product.getFid()) );
			Category scategory = categoryDao.findById(Integer.parseInt(product.getSid()) );
			product.setFcategory(fcategory);
			product.setScategory(scategory);
			int kc = kcrecord.getkc(product.getId());
			product.setKc(kc);
		}
		PageInfo<Product> pageInfo = new PageInfo<Product>(list);
		if(!fid.equals("")){
			List<Category> childlist = categoryDao.findChild(Integer.parseInt(fid));
			request.setAttribute("childlist", childlist);
		}
		request.setAttribute("key", key);
		request.setAttribute("fid", fid);
		request.setAttribute("sid", sid);
		request.setAttribute("clist", clist);
		request.setAttribute("pageInfo", pageInfo);
		return "warehouselist";
	}

	//添加商品
	@RequestMapping("admin/productAdd")
	public String productAdd(Product product,HttpServletRequest request) {
		product.setSavetime(Info.getDateStr());
		product.setDelstatus("0");
		product.setIstj("no");
		productDao.add(product);
		return "redirect:productList";
	}

	//删除商品
	@RequestMapping("admin/productDel")
	public String productDel(Integer id,HttpServletRequest request) {
	    Product product = productDao.findById(id);
        product.setDelstatus("1");
		productDao.update(product);
		return "redirect:productList";
	}

	//跳转页面
	@RequestMapping("admin/skipToaddoredit")
	public String skipToaddoredit(HttpServletRequest request) {
		String type = request.getParameter("type");
		HashMap map = new HashMap();
		List<Category> clist = categoryDao.selectAll(map);
		for (Category category:clist){
			List<Category> childlist = categoryDao.findChild(category.getId());
			category.setChildlist(childlist);
		}
		request.setAttribute("clist",clist);
		if(type.equals("add")){
			return "productadd";
		}else{
			String id = request.getParameter("id");
			Product product = productDao.findById(Integer.parseInt(id));
			request.setAttribute("product",product);
			return "productedit";
		}

	}

	//查找类别到添加或编辑页面
	@RequestMapping("admin/productShow")
	public String productShow(Integer id,HttpServletRequest request) {
		Product product = productDao.findById(id);
		Category fcategory = categoryDao.findById(Integer.parseInt(product.getFid()));
        Category scategory = categoryDao.findById(Integer.parseInt(product.getSid()));
        product.setFcategory(fcategory);
        product.setScategory(scategory);
        HashMap map = new HashMap();
        List<Category> clist = categoryDao.selectAll(map);
        for (Category category:clist){
            List<Category> childlist = categoryDao.findChild(category.getId());
            category.setChildlist(childlist);
        }
        request.setAttribute("clist",clist);
		request.setAttribute("product",product);
		return "productedit";
	}

	//修改商品
	@RequestMapping("admin/productEdit")
	public String productEdit(Product product,HttpServletRequest request) {
		productDao.update(product);
		return "redirect:productList";
	}

	//设置特价
	@RequestMapping("admin/tjPrice")
	public String tjPrice(int  id,HttpServletRequest request) {
		String error = request.getParameter("error")==null?"":request.getParameter("error");
		Product product = productDao.findById(id);
		request.setAttribute("product",product);
		if (!error.equals("")){
			request.setAttribute("suc","特价不能低于商品单价");
		}
		return "tjpriceedit";
	}

	//修改特价
	@RequestMapping("admin/tjpriceEdit")
	public String tjpriceEdit(Product product,HttpServletRequest request) {
		Product pro = productDao.findById(product.getId());
		if(pro.getPrice()<=product.getTjprice()){
			return "redirect:tjPrice?error=error&id="+product.getId();
		}else{
			productDao.update(product);
			return "redirect:productList";
		}
	}

	//推荐商品
	@RequestMapping("admin/productTj")
	public String productTj(Product product,HttpServletRequest request) {
		productDao.update(product);
			return "redirect:productList";
	}

	//前台商品详情页面
	@RequestMapping("productDetails")
	public String productDetails(int id,HttpServletRequest request) {
		String suc = request.getParameter("suc")==null?"":request.getParameter("suc");
		String error = request.getParameter("error")==null?"":request.getParameter("error");
		Product product = productDao.findById(id);
		Category fcategory = categoryDao.findById(Integer.parseInt(product.getFid()));
		Category scategory = categoryDao.findById(Integer.parseInt(product.getSid()));
		product.setFcategory(fcategory);
		product.setScategory(scategory);
		HashMap map = new HashMap();
		map.put("sid",product.getSid());
		map.put("id",product.getId());
		List<Product> xglist = productDao.findByAll(map);//相关商品
		request.setAttribute("xglist",xglist);
		request.setAttribute("product",product);
		map.put("productid",product.getId());
		List<Comment> commentlist = commentDao.selectAll(map);
		for(Comment comment:commentlist){
			Member member = memberDao.findById(Integer.parseInt(comment.getMemberid()));
			comment.setMember(member);
		}
		request.setAttribute("commentlist",commentlist);
		if(!suc.equals("")){
			request.setAttribute("suc","操作成功");
		}
		if(!error.equals("")){
			request.setAttribute("error","评论失败");
		}
		savesession.getCategorySession(request);
		return "productdetail";
	}
	//前台商品列表
	@RequestMapping("productLb")
	public String productLb(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum,HttpServletRequest request) {
        double aa = savesession.getMaxprice(request);
        double bb = savesession.getMinprice(request);
		String key = request.getParameter("key");
		String fid = request.getParameter("fid")==null?"":request.getParameter("fid");
		String sid = request.getParameter("sid");
		String minprice = request.getParameter("minprice")==null?String.valueOf(bb):request.getParameter("minprice");
		String maxprice = request.getParameter("maxprice")==null?String.valueOf(aa):request.getParameter("maxprice");
		HashMap map = new HashMap();
		List<Category> clist = categoryDao.selectAll(map);
		map.put("key", key);
		map.put("fid", fid);
		map.put("sid", sid);
		map.put("minprice", minprice);
		map.put("maxprice", maxprice);
		System.out.println("minpirce==="+minprice);
        PageHelper.startPage(pageNum,10);
		List<Product> list = productDao.selectAll(map);
		for (Product product:list){
			Category fcategory = categoryDao.findById(Integer.parseInt(product.getFid()) );
			Category scategory = categoryDao.findById(Integer.parseInt(product.getSid()) );
			product.setFcategory(fcategory);
			product.setScategory(scategory);
			int kc = kcrecord.getkc(product.getId());
			product.setKc(kc);
		}
		PageInfo<Product> pageInfo = new PageInfo<Product>(list);
		if(!fid.equals("")){
			List<Category> childlist = categoryDao.findChild(Integer.parseInt(fid));
			request.setAttribute("childlist", childlist);
		}

		//排行
		List<Dingdanmsg> phlist = dingdanmsgDao.selectPh();
		for(Dingdanmsg dingdanmsg:phlist){
			Product product = productDao.findById(Integer.parseInt(dingdanmsg.getProductid()));
			dingdanmsg.setProduct(product);
		}
		request.setAttribute("key", key);
		request.setAttribute("fid", fid);
		request.setAttribute("sid", sid);
		request.setAttribute("phlist", phlist);
		request.setAttribute("minprice", minprice);
		request.setAttribute("maxprice", maxprice);
		request.setAttribute("clist", clist);
		request.setAttribute("pageInfo", pageInfo);
		savesession.getCategorySession(request);
		savesession.getCartSession(request);
		savesession.getSessionMember(request);
		return "productlb";
	}


    //前台特价商品列表
    @RequestMapping("tjproductLb")
    public String tjproductLb(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum,HttpServletRequest request) {
        double aa = savesession.getMaxprice(request);
        double bb = savesession.getMinprice(request);
        String key = request.getParameter("key");
        String minprice = request.getParameter("minprice")==null?String.valueOf(bb):request.getParameter("minprice");
        String maxprice = request.getParameter("maxprice")==null?String.valueOf(aa):request.getParameter("maxprice");
        HashMap map = new HashMap();
        List<Category> clist = categoryDao.selectAll(map);
        map.put("key", key);
        map.put("tjprice", "tjprice");
        map.put("minprice", minprice);
        map.put("maxprice", maxprice);
        PageHelper.startPage(pageNum,10);
        List<Product> list = productDao.selectAll(map);
        for (Product product:list){
            Category fcategory = categoryDao.findById(Integer.parseInt(product.getFid()) );
            Category scategory = categoryDao.findById(Integer.parseInt(product.getSid()) );
            product.setFcategory(fcategory);
            product.setScategory(scategory);
            int kc = kcrecord.getkc(product.getId());
            product.setKc(kc);
        }
        PageInfo<Product> pageInfo = new PageInfo<Product>(list);

        //排行
        List<Dingdanmsg> phlist = dingdanmsgDao.selectPh();
        for(Dingdanmsg dingdanmsg:phlist){
            Product product = productDao.findById(Integer.parseInt(dingdanmsg.getProductid()));
            dingdanmsg.setProduct(product);
        }
        request.setAttribute("key", key);
        request.setAttribute("phlist", phlist);
        request.setAttribute("minprice", minprice);
        request.setAttribute("maxprice", maxprice);
        request.setAttribute("clist", clist);
        request.setAttribute("pageInfo", pageInfo);
        savesession.getCategorySession(request);
		savesession.getCartSession(request);
		savesession.getSessionMember(request);
        return "tjproductlb";
    }


}
