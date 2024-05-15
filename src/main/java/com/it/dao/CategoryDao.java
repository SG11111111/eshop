package com.it.dao;

import com.it.entity.Category;
import com.it.entity.News;

import java.util.HashMap;
import java.util.List;

public interface CategoryDao {
	List<Category> selectAll(HashMap map);
	void add(Category category);
	Category findById(Integer id);
	void update(Category category);
	List<Category> findChild(Integer id);

}
