package com.lanqiao.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lanqiao.mapper.TbTypeMapper;
import com.lanqiao.pojo.TbType;

@Service
public class TbTypeServiceImpl implements ITbTypeService{
	
	@Autowired
	private TbTypeMapper tbTypeMapper;
	
	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return tbTypeMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(TbType record) {
		// TODO Auto-generated method stub
		return tbTypeMapper.insert(record);
	}

	@Override
	public TbType selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return tbTypeMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<TbType> selectAll(String username) {
		// TODO Auto-generated method stub
		return tbTypeMapper.selectAll(username);
	}

	@Override
	public int updateByPrimaryKey(TbType record) {
		// TODO Auto-generated method stub
		return tbTypeMapper.updateByPrimaryKey(record);
	}

}
