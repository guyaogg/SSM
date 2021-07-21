package com.atguigu.crud.mapper;

import com.atguigu.crud.pojo.Employee;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

import static org.junit.Assert.*;

/**
 * @author guyao
 * @create 2021-07-19 13:56
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class DepartmentMapperTest {

    @Autowired
    DepartmentMapper departmentMapper;

    @Autowired
    EmployeeMapper employeeMapper;
    @Autowired
    SqlSession sqlSession;

    @Test
    public void selectByExample() {
//        departmentMapper.selectByPrimaryKey(1);
//        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
//        for (int i = 0; i < 1000; i++) {
//            String s = UUID.randomUUID().toString().substring(0, 6) + i;
//            mapper.insertSelective(new Employee(null,s , "F", s+"@atguigu.com", 2 ));
//        }
        System.out.println(employeeMapper.selectByPrimaryKeyWithDept(1999));

    }
}