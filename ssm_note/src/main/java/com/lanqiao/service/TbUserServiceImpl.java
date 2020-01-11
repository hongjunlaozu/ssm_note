package com.lanqiao.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lanqiao.mapper.TbUserMapper;
import com.lanqiao.pojo.TbUser;

@Service
public class TbUserServiceImpl implements ITbUserService{
	
	@Autowired
	private TbUserMapper tbUserMapper;
	
	@Override
	public void insert(TbUser record) {
		tbUserMapper.insert(record);
		
	}

	@Override
	public TbUser selectByPrimaryKey(TbUser record) {
		return tbUserMapper.selectByPrimaryKey(record);
	}

	@Override
	public void updateByPrimaryKey(TbUser record) {
		tbUserMapper.updateByPrimaryKey(record);
		
	}

	@Override
	public TbUser isActive(TbUser record) {
		// TODO Auto-generated method stub
		return tbUserMapper.isActive(record);
	}

	@Override
	public TbUser selectUserByName(String username) {
		// TODO Auto-generated method stub
		return tbUserMapper.selectUserByName(username);
	}

}
