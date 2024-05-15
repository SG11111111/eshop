package com.it.util;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.it.controller.ProductController;
import com.it.dao.CartDao;
import com.it.dao.CategoryDao;
import com.it.dao.MemberDao;
import com.it.dao.ProductDao;
import com.it.entity.Cart;
import com.it.entity.Category;
import com.it.entity.Member;
import com.it.entity.Product;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.websocket.Session;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.util.HashMap;
import java.util.List;

@Component
public class Savesession {
    @Resource
    CategoryDao categoryDao;
    @Resource
    ProductDao productDao;
    @Resource
    CartDao cartDao;
    @Resource
    MemberDao memberDao;

    //查询分类
    public void getCategorySession(HttpServletRequest request){
        HashMap map = new HashMap();
        List<Category> fcategorylist = categoryDao.selectAll(map);//一级分类
        for(Category fcategory:fcategorylist){
            List<Category> scategorylist = categoryDao.findChild(fcategory.getId());
            map.put("istj","");
            map.put("fid",fcategory.getId());
            List<Product> fproductlist = productDao.selectAll(map);
            fcategory.setFproduct(fproductlist);
            fcategory.setChildlist(scategorylist);
        }
        request.getSession().setAttribute("fcategorylist",fcategorylist);
    }

//查询购物车
    public void getCartSession(HttpServletRequest request){
        Member member = (Member)request.getSession().getAttribute("sessionmember");
        HashMap map = new HashMap();
        if(member!=null){
            Member mmm = memberDao.findById(member.getId());
            map.put("memberid",member.getId());
            List<Cart> cartlist = cartDao.selectAll(map);
            double total = 0D;
            for(Cart cart:cartlist){
                Product product = productDao.findById(Integer.parseInt(cart.getProductid()));
                cart.setProduct(product);

                double sjprice =0;
                if(product.getTjprice()!=null && product.getTjprice()>0){
                    sjprice = product.getTjprice();
                }else{
                    sjprice = product.getPrice();
                }

                if(mmm.getLev().equals("会员")){
                    sjprice=sjprice*0.9;
                }else if(mmm.getLev().equals("高级会员")){
                    sjprice=sjprice*0.8;
                }

                total+=sjprice*cart.getNum();
            }

            request.getSession().setAttribute("sessioncartlist",cartlist);
            request.getSession().setAttribute("total",String.format("%.2f", total));
        }
    }

    public  String getIpAddr(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        if ("0:0:0:0:0:0:0:1".equals(ip)) {
            ip = "127.0.0.1";
        }
        if (ip.split(",").length > 1) {
            ip = ip.split(",")[0];
        }
        return ip;
    }


    /**
     * 通过IP获取地址(需要联网，调用淘宝的IP库)
     *
     * @param ip
     * @return
     */
    public static String getIpInfo(String ip) {
        if ("127.0.0.1".equals(ip)) {
            ip = "127.0.0.1";
        }
        String info = "";
        try {
            URL url = new URL("http://ip.taobao.com/service/getIpInfo.php?ip=" + ip);
            HttpURLConnection htpcon = (HttpURLConnection) url.openConnection();
            htpcon.setRequestMethod("GET");
            htpcon.setDoOutput(true);
            htpcon.setDoInput(true);
            htpcon.setUseCaches(false);

            InputStream in = htpcon.getInputStream();
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(in));
            StringBuffer temp = new StringBuffer();
            String line = bufferedReader.readLine();
            while (line != null) {
                temp.append(line).append("\r\n");
                line = bufferedReader.readLine();
            }
            bufferedReader.close();
            JSONObject obj = (JSONObject) JSON.parse(temp.toString());
            if (obj.getIntValue("code") == 0) {
                JSONObject data = obj.getJSONObject("data");
                info += data.getString("country") + " ";
                info += data.getString("region") + " ";
                info += data.getString("city") + " ";
                info += data.getString("isp");
            }
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (ProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return info;
    }

    public double getMaxprice(HttpServletRequest request){
        Product product = productDao.selectMaxprice();
        double maxprice  = product.getPrice();
        return maxprice;
    }

    public double getMinprice(HttpServletRequest request){
        Product product = productDao.selectMinprice();
        double minprice  = product.getPrice();
        return minprice;
    }


    public void  getSessionMember(HttpServletRequest request){
        Member member = (Member)request.getSession().getAttribute("sessionmember");
        if(member!=null){
            Member mmm = memberDao.findById(member.getId());
            request.getSession().setAttribute("sessionmember", mmm);
        }
    }
}




