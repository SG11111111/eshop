package com.it.dao;

import com.it.entity.Category;
import com.it.entity.Comment;
import com.it.entity.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface RecommendDao {

    List<Integer> getCategoryListByUserid(int id);

    List<Integer> getFidListByUserid(int id);

    List<Integer> getSidListByUserid(int id);

    List<Category> selectAllCategoryList();

    List<Map<String,Object>> selectOrderHistory(String id);

    List<Product> selectProductListByOrderNumDesc();

    List<Product> selectProductByFid(String fid);

    List<Map<String,Object>> selectAllComment(@Param("productIds") List<Integer> ids);

    List<Product> selectProductByIds(@Param("productIds")List<Integer> ids);
}
