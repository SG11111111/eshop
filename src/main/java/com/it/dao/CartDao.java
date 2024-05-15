package com.it.dao;


import com.it.entity.Cart;

import java.util.HashMap;
import java.util.List;

public interface CartDao {
	List<Cart> selectAll(HashMap map);
	void add(Cart cart);
	void delete(int id);
	void update(Cart cart);
	Cart findById(int id);
}
