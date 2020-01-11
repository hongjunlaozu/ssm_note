package com.lanqiao.mapper;

import com.lanqiao.pojo.TbUser;
import java.util.List;

public interface TbUserMapper {
    int deleteByPrimaryKey(String username);

    int insert(TbUser record);

    TbUser selectByPrimaryKey(TbUser record);

    TbUser isActive(TbUser record);
    
    TbUser selectUserByName(String username);

    int updateByPrimaryKey(TbUser record);
    
    
}