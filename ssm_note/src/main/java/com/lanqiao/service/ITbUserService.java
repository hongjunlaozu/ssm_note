package com.lanqiao.service;

import com.lanqiao.pojo.TbUser;
import java.util.List;

public interface ITbUserService {

    public void insert(TbUser record);

    public TbUser selectByPrimaryKey(TbUser record);

    public void updateByPrimaryKey(TbUser record);
    
    public TbUser isActive(TbUser record);
    
    public TbUser selectUserByName(String username);
}