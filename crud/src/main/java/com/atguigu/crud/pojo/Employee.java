package com.atguigu.crud.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Pattern;
import java.io.Serializable;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Employee implements Serializable {
    private Integer empId;

    @Pattern(regexp = "(^[a-z0-9_-]{4,16}$)|(^[\\u2E80-\\u9FFF]{2,5})",message = "用户名必须为2-5位中文或4-16英文的组合")
    private String empName;

    private String gender;

    //@Email(message = "别搞好吧")
    @Pattern(regexp = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$",message = "别搞了，别搞了")
    private String email;

    private Integer dId;

    private Department department;

    public Employee(Integer empId, String empName, String gender, String email, Integer dId) {
        this.empId = empId;
        this.empName = empName;
        this.gender = gender;
        this.email = email;
        this.dId = dId;
    }
}