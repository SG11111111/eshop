package com.it.dao;
import com.it.entity.Product;
import java.util.HashMap;
import java.util.List;

public interface ProductDao {
	List<Product> selectAll(HashMap map);
	List<Product> findByAll(HashMap map);
	void add(Product product);
	void delete(Integer id);
	Product findById(Integer id);
	void update(Product product);
	List<Product> selectProductAll(HashMap map);
    Product selectMaxprice();
    Product selectMinprice();

}
