package com.it.dao;

import com.it.entity.News;
import java.util.HashMap;
import java.util.List;

public interface NewsDao {
	List<News> selectAll(HashMap map);
	void add(News news);
	void delete(Integer id);
	News findById(Integer id);
	void update(News news);
}
