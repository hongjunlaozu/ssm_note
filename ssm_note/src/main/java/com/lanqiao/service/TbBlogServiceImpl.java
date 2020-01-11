package com.lanqiao.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lanqiao.mapper.TbBlogMapper;
import com.lanqiao.pojo.TbBlog;
import com.lanqiao.pojo.TbType;

@Service
public class TbBlogServiceImpl implements ITbBlogService{

	@Autowired
	private TbBlogMapper tbBlogMapper;
	
	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return tbBlogMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(TbBlog record) {
		// TODO Auto-generated method stub
		return tbBlogMapper.insert(record);
	}

	@Override
	public TbBlog selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return tbBlogMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<TbBlog> selectAll(TbBlog blog) {
		// TODO Auto-generated method stub
		return tbBlogMapper.selectAll(blog);
	}

	@Override
	public int updateByPrimaryKey(TbBlog record) {
		// TODO Auto-generated method stub
		return tbBlogMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<TbType> selectTypeCount(String username) {
		// TODO Auto-generated method stub
		return tbBlogMapper.selectTypeCount(username);
	}

	@Override
	public List<Map> selectDdateCount(String username) {
		
		return tbBlogMapper.selectDdateCount(username);
	}

}
