package com.lanqiao.service;

import java.util.List;

import com.lanqiao.pojo.TbType;

public interface ITbTypeService {
	int deleteByPrimaryKey(Integer id);

    int insert(TbType record);

    TbType selectByPrimaryKey(Integer id);

    List<TbType> selectAll(String username);

    int updateByPrimaryKey(TbType record);
}
