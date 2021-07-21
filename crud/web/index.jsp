<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2021/7/19
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>员工列表</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
          integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
</head>
<body>
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"
        integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ"
        crossorigin="anonymous"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
        integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
        crossorigin="anonymous"></script>
<!-- 员工修改模态框Modal -->
<div class="modal fade" id="empUpdateModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">员工修改</h4>
            </div>
            <div class="modal-body">

                <form class="form-horizontal">
                    <div class="form-group ">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="emp_update_Name"></p>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="email" name="email" class="form-control" id="email_update_input"
                                   placeholder="email@atguigu.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gander</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gander1_update_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gander2_update_input" value="F"> 女
                            </label></div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">

                            <select class="form-control" name="dId">

                            </select>
                        </div>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关 闭</button>
                <button type="button" class="btn btn-info" id="emp_update_btn">更 新</button>
            </div>
        </div>
    </div>
</div>


<!-- 员工添加模态框Modal -->
<div class="modal fade" id="empAddModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">员工添加</h4>
            </div>
            <div class="modal-body">

                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_add_input"
                                   placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="email" name="email" class="form-control" id="email_add_input"
                                   placeholder="email@atguigu.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gander</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gander1_add_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gander2_add_input" value="F"> 女
                            </label></div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">

                            <select class="form-control" name="dId">

                            </select>
                        </div>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关 闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保 存</button>
            </div>
        </div>
    </div>
</div>


<%--搭建页面--%>
<div class="container">
    <%--        标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <%--        按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-10">
            <button class="btn btn-primary" id="emp_add_model_btn">新增</button>
            <button class="btn btn-danger" id="emp_delete_model_btn">删除</button>
        </div>
    </div>
    <%--        显示表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="checkAll"/>
                    </th>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>

        </div>
    </div>
    <%--        显示分页信息--%>
    <div class="row">
        <%--            分页文字信息--%>
        <div class="col-md-6" id="page_info_area">

        </div>
        <%--            分页条信息--%>
        <div class="col-md-6" id="page_nav_area">

        </div>
    </div>
    <script type="text/javascript">
        //页面加载后，直接发送ajax请求，要到数据
        //跳转页
        $(function () {
            //去首页
            to_page(1);
        });
        let totalPages,currentPage;

        function to_page(pn) {

            $.ajax({
                url: "${APP_PATH}/emps",
                data: "pn=" + pn,
                type: "get",
                success: function (result) {
                    //console.log(result)//先清空
                    $("#checkAll").prop("checked",false);
                    $("#emps_table tbody").empty();
                    $("#page_nav_area").empty();
                    $("#page_info_area").empty();
                    //解析并显示数据
                    build_emps_table(result)
                    //显示分页
                    build_page_info(result)
                    build_page_nav(result)
                }
            })
        }

        //解析并显示数据
        function build_emps_table(result) {
            let emps = result.extend.pageInfo.list;
            $.each(emps, function (index, item) {
                let checkBoxTd = $("<td></td>").append($("<input type='checkbox' class='checkItem'/>"));
                let empIdTd = $("<td></td>").append(item.empId);
                let empNameTd = $("<td></td>").append(item.empName);
                let genderTd = $("<td></td>").append(item.gender == "M" ? "男" : "女");
                let emailTd = $("<td></td>").append(item.email);
                let deptNameTd = $("<td></td>").append(item.department.deptName);
                /*
                 * <button class="btn btn-info btn-sm">
                 <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                 编辑
                 </button>
                 <button class="btn btn-danger btn-sm">
                 <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                 删除
                 </button>
                 */
                let editBtn = $("<button></button>").addClass("btn btn-info btn-sm edit_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
                //添加一个自定义属性
                editBtn.attr("edit_id",item.empId);
                let delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
                delBtn.attr("delete_id",item.empId);
                let btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
                $("<tr></tr>").append(checkBoxTd).append(empIdTd).append(empNameTd).append(genderTd).append(emailTd)
                    .append(deptNameTd).append(btnTd).appendTo("#emps_table tbody");
            })
        }

        //显示分页
        //分页信息
        function build_page_info(result) {

            let pageInfo_a = result.extend.pageInfo;
            totalPages = pageInfo_a.pages;
            currentPage = pageInfo_a.pageNum;
            $("#page_info_area").append("当前" + currentPage + "页，总" + totalPages + "页，总" + pageInfo_a.total + "条记录。");

        }

        //分页条
        function build_page_nav(result) {

            let pageInfo_a = result.extend.pageInfo;
            let ul = $("<ul></ul>").addClass("pagination");
            let firstPage = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
            let prePage = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href", "#"));
            if (pageInfo_a.isFirstPage) {
                firstPage.addClass("disabled");
                prePage.addClass("disabled");
            } else {
                firstPage.click(function () {
                    to_page(1);
                })
                prePage.click(function () {
                    to_page(pageInfo_a.pageNum - 1);
                })
            }
            let nextPage = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href", "#"));
            let lastPage = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));


            if (pageInfo_a.isLastPage) {
                nextPage.addClass("disabled");
                lastPage.addClass("disabled");
            } else {
                nextPage.click(function () {
                    to_page(pageInfo_a.pageNum + 1);
                })
                lastPage.click(function () {
                    to_page(pageInfo_a.pages);
                })
            }

            ul.append(firstPage).append(prePage);
            $.each(pageInfo_a.navigatepageNums, function (index, item) {
                let numLi = $("<li></li>").append($("<a></a>").append(item).attr("href", "#"));
                if (pageInfo_a.pageNum == item) {
                    numLi.addClass("active");
                }
                numLi.click(function () {
                    to_page(item);
                })
                ul.append(numLi);
            })
            ul.append(nextPage).append(lastPage);

            let navEle = $("<nav></nav>").append(ul);
            navEle.appendTo("#page_nav_area")
        }


        function reset_form(ele) {
            $(ele)[0].reset();
            //清空表单样式
            $(ele).find("*").removeClass("has-error has-success");
            $(ele).find(".help-block").text("")
        }

        //新增按钮请求
        $("#emp_add_model_btn").click(function () {
            //表单完整重置

            reset_form("#empAddModel form");
            //先查信息
            getDepts($("#empAddModel select"));
            //弹出模态框
            $("#empAddModel").modal({
                backdrop: "static"
            })

        })

        //查出部门信息
        function getDepts(ele) {
            //刷新
            ele.empty()
            $.ajax({
                url: "${APP_PATH}/depts",
                type: "get",
                success: function (result) {
                    // console.log(result)
                    $.each(result.extend.depts, function () {
                        let optionEle = $("<option></option>").append(this.deptName).attr("value", this.deptId);

                        optionEle.appendTo($(ele));
                    })
                }
            })
        }

        $("#empName_add_input").change(validate_add_empName);
        $("#email_add_input").change(validate_add_email);

        //校验表单数据
        function validate_add_empName() {
            // 使用正则
            let empName = $("#empName_add_input").val();
            let regName = /(^[a-z0-9_-]{4,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
            let testName = regName.test(empName);

            //清空之前样式
            if (!testName) {
                show_validate_msg("#empName_add_input", "error", "用户名请输入为2-5位中文或4-16英文的组合")
                // alert("用户名请输入为2-5位中文或4-16英文的组合");
                return false;
            } else {
                show_validate_msg("#empName_add_input", "success", "√")
            }
            //校验是否可用
            $.ajax({
                url: "${APP_PATH}/checkUser",
                type: "get",
                data: "empName=" + empName,
                success: function (result) {
                    switch (result.code) {
                        case 100 :
                            show_validate_msg("#empName_add_input", "success", "√");
                            $("#emp_save_btn").attr("ajax_va", "success");
                            break;
                        case 200 :
                            show_validate_msg("#empName_add_input", "error", result.extend.va_msg);
                            $("#emp_save_btn").attr("ajax_va", "error");
                            break;
                    }


                }
            })
            return true;
        }

        function show_validate_msg(ele, status, msg) {
            //清除当前元素状态
            $(ele).parent().removeClass("has-success has-error")
            $(ele).next("span").text("");
            if ("success" == status) {

                $(ele).parent().addClass("has-success");
                $(ele).next("span").text(msg);
            } else if ("error" == status) {
                $(ele).parent().addClass("has-error");
                $(ele).next("span").text(msg);
            }

        }

        function validate_add_email() {
            let email = $("#email_add_input").val();
            let regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            let testEmail = regEmail.test(email);
            if (!testEmail) {
                show_validate_msg("#email_add_input", "error", "请输入正确格式的email")
                // alert("用户名请输入为2-5位中文或4-16英文的组合");
                return false;
            } else {
                show_validate_msg("#email_add_input", "success", "√")
                return true;
            }
        }

        $("#emp_save_btn").click(function () {
            //先校验
            if ((!validate_add_empName()) ||(!validate_add_email()) ||($(this).attr("ajax_va")=="error")) {
                return false;
            }
            //发送ajax
            $.ajax({
                url: "${APP_PATH}/emp",
                type: "POST",
                data: $("#empAddModel form").serialize(),
                success: function (result) {
                    // alert($("#empAddModel form").serialize());
                    //后端校验信息
                    if (result.code == 100) {

                        alert(result.msg);
                        //关闭模态框
                        $("#empAddModel").modal('hide');
                        //来到最后一页
                        to_page(totalPages + 1);
                    } else {
                        if (undefined != result.extend.errorFields.email) {

                            show_validate_msg("#email_add_input", "error", result.extend.errorFields.email)
                        }
                        if (undefined != result.extend.errorFields.empName) {
                            show_validate_msg("#empName_add_input", "error", result.extend.errorFields.empName)
                        }
                        console.log(result.extend);
                    }


                }
            })

        })

//创建按钮时候绑定事件
        //2.绑架点击事件live//jquery新版本没有了，用on替代
        $(document).on("click",".edit_btn",function () {
            //刷新


            // alert("edit")
            //查出信息并显示
            getEmp($(this).attr("edit_id"))

            getDepts($("#empUpdateModel select"))



            //弹出模态框(id,传给更新按钮
            $("#emp_update_btn").attr("edit_id",$(this).attr("edit_id"))
            $("#empUpdateModel").modal({
                backdrop: "static"
            })
        })
        
        function getEmp(id) {
            $.ajax({
                url:"${APP_PATH}/emp/"+id,
                type:"GET",
                success:function (result) {
                    console.log(result);
                    let empEle = result.extend.emp;
                    $("#emp_update_Name").text(empEle.empName);
                    $("#email_update_input").val(empEle.email);
                    $("#empUpdateModel input[name=gender]").val([empEle.gender]);
                    $("#empUpdateModel select").val([empEle.did])
                }
            });
        }
        function validate_update_email() {
            let email = $("#email_update_input").val();
            let regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            let testEmail = regEmail.test(email);
            if (!testEmail) {
                show_validate_msg("#email_update_input", "error", "请输入正确格式的email")
                // alert("用户名请输入为2-5位中文或4-16英文的组合");
                return false;
            } else {
                show_validate_msg("#email_update_input", "success", "√")
                return true;
            }
        }

        $("#emp_update_btn").click(function (){
            //检验邮箱
            if(!validate_update_email()){
                return false;
            }else {
                // 发送ajax修改
                $.ajax({
                    url:"${APP_PATH}/emp/"+$(this).attr("edit_id"),
                    type:"PUT",
                    data:$("#empUpdateModel form").serialize(),
                    success:function (result) {

                        //保存后工作
                        // alert(result.msg);
                        $("#empUpdateModel").modal('hide');
                        to_page(currentPage);
                    }
                })

            }

        })
        $(document).on("click",".delete_btn",function () {
            // alert($(this).attr("delete_id"))
            let empName = $(this).parents("tr").find("td:eq(2)").text();
            if(confirm("确认删除【"+ empName +"】吗?")){
                //
                $.ajax({
                    url:"${APP_PATH}/emp/" + $(this).attr("delete_id"),
                    type:"DELETE",
                    success : function (result) {
                        alert(result.msg);

                        to_page(currentPage);
                    }
                })
            }
        })

        // 全选
        $("#checkAll").click(function () {
            //attr获取位undefined
            //使用prop读取原生属性
            $(".checkItem").prop("checked",$(this).prop("checked"));
        });
        //单选/全选
        $(document).on("click",".checkItem",function () {
            //判断选择中的元素是否是五个
            let logo = $(".checkItem:checked").length == $(".checkItem").length;
            $("#checkAll").prop("checked",logo);


        })
        //选取删除
        $("#emp_delete_model_btn").click(function () {
            let empNames = "";
            let empIds = "";
            $.each($(".checkItem:checked"),function (){

                empNames += $(this).parents("tr").find("td:eq(2)").text() + ",";

                //员工id字符串
                empIds += $(this).parents("tr").find("td:eq(1)").text() + "-";

            })
            //取出多余,
            let names = empNames.substring(0,empNames.length - 1);
            let Ids = empIds.substring(0,empIds.length - 1);
            if(confirm("确认要删除【"+ names +"】吗?")){
                $.ajax({
                    url:"${APP_PATH}/emp/" + Ids,
                    type:"DELETE",
                    success : function (result) {
                        alert(result.msg);

                        to_page(currentPage);
                    }
                })

            }
        })



    </script>
</div>

</body>
</html>
