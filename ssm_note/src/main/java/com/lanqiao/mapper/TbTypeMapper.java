package com.lanqiao.mapper;

import com.lanqiao.pojo.TbType;
import java.util.List;

public interface TbTypeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TbType record);

    TbType selectByPrimaryKey(Integer id);

    List<TbType> selectAll(String username);

    int updateByPrimaryKey(TbType record);
}