package com.lanqiao.service;

import java.util.List;
import java.util.Map;

import com.lanqiao.pojo.TbBlog;
import com.lanqiao.pojo.TbType;

public interface ITbBlogService {
	int deleteByPrimaryKey(Integer id);

    int insert(TbBlog record);

    TbBlog selectByPrimaryKey(Integer id);

    List<TbBlog> selectAll(TbBlog blog);

    int updateByPrimaryKey(TbBlog record);
    
    List<TbType> selectTypeCount(String username);
    
    List<Map> selectDdateCount(String username);
}
