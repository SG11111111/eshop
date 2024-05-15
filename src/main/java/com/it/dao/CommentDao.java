package com.it.dao;


import com.it.entity.Cart;
import com.it.entity.Comment;

import java.util.HashMap;
import java.util.List;

public interface CommentDao {
	List<Comment> selectAll(HashMap map);
	void add(Comment comment);
	void delete(int id);
}
