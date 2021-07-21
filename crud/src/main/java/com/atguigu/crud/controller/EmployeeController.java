package com.atguigu.crud.controller;

import com.atguigu.crud.pojo.Employee;
import com.atguigu.crud.pojo.Msg;
import com.atguigu.crud.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.filter.HttpPutFormContentFilter;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**处理员工CRUD请求
 * @author guyao
 * @create 2021-07-19 14:20
 */
@Controller
public class EmployeeController {
    @Autowired
    EmployeeService employeeService;


    /**
     * 单个批量二合一
     * 批量1-2-3
     * dian 1
     * @param ids
     * @return
     */
    @RequestMapping(value = "/emp/{ids}",method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteEmpById(@PathVariable("ids")String ids){
        if(ids.contains("-")){
            String[] strIds = ids.split("-");
            List<Integer> delIds = new ArrayList<>();
            for (String strId : strIds){
                delIds.add(Integer.parseInt(strId));
            }
            employeeService.deleteBatch(delIds);
        }else {
            int id = Integer.parseInt(ids);
            employeeService.deleteEmp(id);
        }
        return Msg.success();


    }


    /**
     * 直接发送ajax put请求封装的数据都为null
     *
     * 请求体有数据
     * 但没有封装上
     * 原因Tomcat问题
     *      将请求体中的数据封装到map
     *      request.getParameter()会从map取值
     *      mvc调用上面函数封装到pojo
     *  Ajax发送put请求拿不到
     *      Tomcat put请求体不会封装到map（源码中只允许post请求封装
     * 解决方法（1，使用post方法转化
     *          2.配置 HttpPutFormContentFilter过滤器
     * @param employee
     * @return
     */
    @RequestMapping(value = "/emp/{empId}",method = RequestMethod.PUT)
    @ResponseBody
    public Msg saveEmp(Employee employee){
        System.out.println(employee);
        employeeService.updateEmp(employee);

        return Msg.success();
    }



    @RequestMapping(value = "/emp/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmp(@PathVariable("id") Integer id){
        Employee employee = employeeService.getEmp(id);
        return Msg.success().add("emp",employee);
    }




    /**
     * 校验信息
     * @param empName
     * @return
     */
    @RequestMapping(value = "checkUser",method = RequestMethod.GET)
    @ResponseBody
    public Msg checkUser(String empName){
        //判断用户名是否合法
        String regx = "(^[a-z0-9_-]{4,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
        if(!empName.matches(regx)){
            return Msg.fail().add("va_msg","用户名请输入为2-5位中文或4-16英文的组合");
        }
        //重复校验
        boolean test = employeeService.checkUser(empName);
        if(test){
            return Msg.success();
        }else
            return Msg.fail().add("va_msg","用户名不可用");
    }


    /**
     * 员工保存
     * @param employee
     * @return
     */
    @RequestMapping(value = "/emp",method = RequestMethod.POST)
    @ResponseBody
    public Msg saveEmp(@Valid Employee employee, BindingResult result){
        if(result.hasErrors()){

            //校验失败，返回错误信息
            Map<String,Object> map = new HashMap<>();
            List<FieldError> fieldErrors = result.getFieldErrors();
            for(FieldError fieldError : fieldErrors){
//                System.out.println("错误的字段名：" + fieldError.getField());
//                System.out.println("错误的信息：" + fieldError.getDefaultMessage());
                map.put(fieldError.getField(), fieldError.getDefaultMessage());
            }


            return Msg.fail().add("errorFields", map);
        }else {
            employeeService.saveEmp(employee);

            return Msg.success();
        }
    }

    /**
     * 导入Jackson包
     * 支持JSR303校验
     *      导包Hibernate-Validator
     * @param pn
     * @param model
     * @return
     */
    @RequestMapping(value = "/emps",method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmpsWithJson(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){

        //加入分页插件（PageHelper(页码，分页大小)
        PageHelper.startPage(pn,5);
        //紧跟查询(就是分页的了
        List<Employee> employees =  employeeService.getAll();
        PageInfo page = new PageInfo(employees,5);//5表示练续显示的页数

        return Msg.success().add("pageInfo",page);
    }

    //@RequestMapping("/emps")
    public String getEmps(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){

        //加入分页插件（PageHelper(页码，分页大小)
        PageHelper.startPage(pn,5);
        //紧跟查询(就是分页的了
        List<Employee> employees =  employeeService.getAll();
        PageInfo page = new PageInfo(employees,5);//5表示练续显示的页数
        model.addAttribute("pageInfo", page);

        return "list";
    }
}
