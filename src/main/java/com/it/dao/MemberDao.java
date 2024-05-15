package com.it.dao;

import com.it.entity.Member;
import com.it.entity.Sysuser;

import java.util.HashMap;
import java.util.List;

public interface MemberDao {

	List<Member> selectAll(HashMap map);
	Member findById(Integer id);
	void update(Member member);
	void add(Member member);


}
