package com.atguigu.crud.controller;

import com.atguigu.crud.mapper.DepartmentMapper;
import com.atguigu.crud.pojo.Department;
import com.atguigu.crud.pojo.Msg;
import com.atguigu.crud.service.DepartmentSerive;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**处理部门有关的请求
 * @author guyao
 * @create 2021-07-19 21:24
 */
@Controller
public class DepartmentController {


    @Autowired
    private DepartmentSerive departmentSerive;

    @ResponseBody
    @RequestMapping("/depts")
    @SuppressWarnings("all")
    public Msg getDepts(){
        List<Department> list = departmentSerive.getDepts();
        return Msg.success().add("depts",list);
    }


}
