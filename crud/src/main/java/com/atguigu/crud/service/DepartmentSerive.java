package com.atguigu.crud.service;

import com.atguigu.crud.mapper.DepartmentMapper;
import com.atguigu.crud.pojo.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author guyao
 * @create 2021-07-19 21:29
 */
@Service
public class DepartmentSerive {

    @Autowired
    private DepartmentMapper departmentMapper;

    public List<Department> getDepts() {

       return departmentMapper.selectByExample(null);
    }
}
