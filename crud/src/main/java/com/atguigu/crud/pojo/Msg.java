package com.atguigu.crud.pojo;

import lombok.Data;

import java.util.HashMap;
import java.util.Map;

/**通用的返回的类
 * @author guyao
 * @create 2021-07-19 16:34
 */
@Data
public class Msg {
    //状态码100-成功 200-失败
    private int code;
    //提示信息
    private String msg;
    //要返回给浏览器的数据
    private Map<String,Object> extend = new HashMap<>();

    public static Msg success(){
        Msg result = new Msg();
        result.setCode(100);
        result.setMsg("处理成功！");
        return result;
    }
    public static Msg fail(){
        Msg result = new Msg();
        result.setCode(200);
        result.setMsg("处理失败！");
        return result;
    }
    public Msg add(String key,Object value){
        this.getExtend().put(key, value);
        return this;
    }
}
