package com.it.controller;



import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.it.dao.*;
import com.it.entity.*;
import com.it.util.Info;
import com.it.util.Savesession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.*;
import java.util.stream.Collectors;

//首页
@Controller
public class IndexController {
    @Resource
    ImgadvDao imgadvDao;
    @Resource
    ProductDao productDao;
    @Resource
    CategoryDao categoryDao;
    @Resource
    CartDao cartDao;
    @Resource
    Savesession savesession;
    @Resource
    RecommendDao recommendDao;

    private static CommentAnalyzer analyzer = null;

    static {
        try {
            analyzer = new CommentAnalyzer();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public IndexController() throws Exception {
    }


    //首页
    @RequestMapping("index")
    public String index(HttpServletRequest request) throws Exception {
        Member member = (Member) request.getSession().getAttribute("sessionmember");
        List<Imgadv> imgadvlist = imgadvDao.selectAll();//图片
        HashMap map = new HashMap();
        map.put("istj", "yes");
        List<Product> tjproductlist = new ArrayList<>();
        if (member != null) {
            //基于内容推荐
            List<Category> categoryList = recommendDao.selectAllCategoryList();
            List<Integer> fidList = recommendDao.getFidListByUserid(member.getId());
            List<Integer> sidList = recommendDao.getSidListByUserid(member.getId());
            //查询所有商品
            List<Product> productList = productDao.selectAll(new HashMap());
            //定义用户向量
            List<Integer> userVectorlist = new ArrayList<>();
            for (int i = 0; i < categoryList.size(); i++) {
                Integer x = 0;
                for (Integer f : fidList) {
                    if (f != null) {
                        if (categoryList.get(i).getId() == f) {
                            x += 1;
                        }
                    }
                }
                for (Integer s : sidList) {
                    if (s != null) {
                        if (categoryList.get(i).getId() == s) {
                            x += 1;
                        }
                    }
                }
                userVectorlist.add(x);
            }
            //计算所有商品向量与用户向量的相似度
            List<Double> productVectorList = new ArrayList<>();
            for (Product p : productList) {
                //单个商品的向量
                List<Integer> pVectorList = new ArrayList<>();
                for (int i = 0; i < categoryList.size(); i++) {
                    Integer x = 0;
                    if (categoryList.get(i).getId() == Integer.valueOf(p.getFid())) {
                        x += 1;
                    }
                    if (categoryList.get(i).getId() == Integer.valueOf(p.getSid())) {
                        x += 1;
                    }
                    pVectorList.add(x);
                }
                //计算相似度
                Double fenzi = 0d;
                Double fenmuA = 0d;
                Double fenmuB = 0d;
                for (int i = 0; i < userVectorlist.size(); i++) {
                    fenzi += userVectorlist.get(i) * pVectorList.get(i);
                    fenmuA += userVectorlist.get(i) * userVectorlist.get(i);
                    fenmuB += pVectorList.get(i) * pVectorList.get(i);
                }
                Double fenmu = 0d;
                fenmuA = Math.sqrt(fenmuA);
                fenmuB = Math.sqrt(fenmuB);
                fenmu = fenmuA * fenmuB;
                if (fenmu == 0) {
                    productVectorList.add(0d);
                } else {
                    productVectorList.add(fenzi / fenmu);
                }
            }
            if (productVectorList.get(productVectorList.indexOf(Collections.max(productVectorList))) < 0.48) {
                tjproductlist = productDao.selectAll(map);//该用户推荐的商品精确度不高，所以默认推荐管理员设定的推荐
            } else {
                for (int i = 0; i < productVectorList.size(); i++) {
                    int indexOf = productVectorList.indexOf(Collections.max(productVectorList));
                    if (productVectorList.get(indexOf) < 0.48) {
                        break;
                    }
                    tjproductlist.add(productList.get(indexOf));
                    productVectorList.set(indexOf, 0d);
                }
            }
        } else {
            tjproductlist = productDao.selectAll(map);//推荐商品
        }
        savesession.getCategorySession(request);
        savesession.getCartSession(request);
        savesession.getSessionMember(request);
        request.setAttribute("tjproductlist", tjproductlist);
        request.setAttribute("imgadvlist", imgadvlist);
        return "welcome";
    }

    @RequestMapping("recommend")
    public String recommend(HttpServletRequest request) throws Exception {
        Member member = (Member) request.getSession().getAttribute("sessionmember");
        List<Imgadv> imgadvlist = imgadvDao.selectAll();//图片
        HashMap map = new HashMap();
        map.put("istj", "yes");
        List<Product> tjproductlist = new ArrayList<>();

        if (member != null) {
            List<Map<String, Object>> orderHistoryList = recommendDao.selectOrderHistory(String.valueOf(member.getId()));
            if (orderHistoryList.size() == 0) { // 新用户 获取 销量高 的商品 倒序
                tjproductlist = recommendDao.selectProductListByOrderNumDesc();
            }else {
                // 计算最喜欢的类别
                // key: fid   value: counter
                Map<String, Integer> hobby = new HashMap<>();
                for (Map<String, Object> cur : orderHistoryList) {
                    String fid = (String) cur.get("fid");
                    if (hobby.containsKey(fid)) {
                        hobby.put(fid,hobby.get(fid) + 1);
                    }else {
                        hobby.put(fid,1);
                    }
                }
                String maxFid = "";
                int maxCount = -1;
                for (String key : hobby.keySet()) {
                    if (hobby.get(key) > maxCount) {
                        maxCount = hobby.get(key);
                        maxFid = key;
                    }
                }
                // 获取最喜欢类别的所有商品
                List<Product> hobbyProducts = recommendDao.selectProductByFid(maxFid);

                // 根据 字符串 相似度算法 计算得出其他类别 顾客可能喜欢的商品
                List<Product> allProducts = productDao.selectAll(null);

                // 去掉最喜欢类别的商品
                Iterator<Product> iterator = allProducts.iterator();
                while (iterator.hasNext()) {
                    Product next = iterator.next();
                    for (Product hobbyProduct : hobbyProducts) {
                        if (hobbyProduct.getId() == next.getId()) {
                            iterator.remove();
                            break;
                        }
                    }
                }

                // 计算非最喜欢类别的所有商品  于最喜欢类别商品的相似度
                allProducts = allProducts.stream().sorted((a1,a2) -> {
                    double similarityA = 0.0;
                    double similarityB = 0.0;

                    for (Product hobbyProduct : hobbyProducts) {
                        similarityA += similarity(hobbyProduct.getProductname(),a1.getProductname());
                        similarityB += similarity(hobbyProduct.getProductname(),a2.getProductname());
                    }

                    return (int) (similarityB - similarityA);
                }).collect(Collectors.toList());

                // 取出前五相似的
                if (allProducts.size() >= 6) {
                    hobbyProducts.addAll(allProducts.subList(0,5));
                }else {
                    hobbyProducts.addAll(allProducts);
                }

                // 获取所有可能喜欢的商品， 根据朴素贝叶斯分类器 分析商品的评论，得到评价更高的商品
                List<Integer> idList = hobbyProducts.stream().map(Product::getId).collect(Collectors.toList());
                List<Map<String, Object>> commentMap = recommendDao.selectAllComment(idList);

                Map<String, Integer> commentPList = new HashMap<>();

                for (Map<String, Object> comment : commentMap) {
                    String productid = (String) comment.get("productid");
                    String content = (String) comment.get("content");
                    if (analyzer.analyze(content)) {
                        if (!commentPList.containsKey(productid)) {
                            commentPList.put(productid,1);
                        }else {
                            commentPList.put(productid,commentPList.get(productid) + 1);
                        }
                    }
                }

                List<Map.Entry<String, Integer>> sortedList = new ArrayList<>(commentPList.entrySet());
                sortedList.sort(Map.Entry.comparingByValue());

                List<Integer> displayProductIds = new ArrayList<>();

                // 输出评价优胜的商品
                for (Map.Entry<String, Integer> entry : sortedList) {
                    if (!displayProductIds.contains(Integer.parseInt(entry.getKey()))) {
                        displayProductIds.add(Integer.parseInt(entry.getKey()));
                    }
                }

                // 反转
                Collections.reverse(displayProductIds);

                tjproductlist = recommendDao.selectProductByIds(displayProductIds);
            }
        }else {
            tjproductlist = productDao.selectAll(map);
        }

        savesession.getCategorySession(request);
        savesession.getCartSession(request);
        savesession.getSessionMember(request);
        request.setAttribute("tjproductlist", tjproductlist);
        request.setAttribute("imgadvlist", imgadvlist);
        return "recommend";
    }


    public double similarity(String s1, String s2) {
        s1 = s1.toLowerCase();
        s2 = s2.toLowerCase();

        int[][] dp = new int[s1.length() + 1][s2.length() + 1];
        for (int i = 0; i <= s1.length(); i++) {
            dp[i][0] = i;
        }
        for (int j = 0; j <= s2.length(); j++) {
            dp[0][j] = j;
        }

        for (int i = 1; i <= s1.length(); i++) {
            for (int j = 1; j <= s2.length(); j++) {
                int cost = (s1.charAt(i - 1) == s2.charAt(j - 1)) ? 0 : 1;
                dp[i][j] = Math.min(Math.min(dp[i - 1][j] + 1, dp[i][j - 1] + 1), dp[i - 1][j - 1] + cost);
            }
        }

        double maxLen = Math.max(s1.length(), s2.length());
        double similarity = 1 - ((double) dp[s1.length()][s2.length()] / maxLen);

        return similarity;
    }




    @RequestMapping("login")
    public String login(HttpServletRequest request){
        savesession.getCategorySession(request);
        return "login";
    }

    @RequestMapping("register")
    public String register(HttpServletRequest request){
        savesession.getCategorySession(request);
        return "register";
    }


    class ValueComparator implements Comparator<Integer> {
        Map<Integer, Integer> map;

        public ValueComparator(Map<Integer, Integer> map) {
            this.map = map;
        }

        @Override
        public int compare(Integer s1, Integer s2) {
            if (map.get(s1) >= map.get(s2)) {
                return -1;
            } else {
                return 1;
            }
        }
    }
}
