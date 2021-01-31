package com.gqchen.controller;

import com.gqchen.entity.Result;
import com.gqchen.entity.TbSysuser;
import com.gqchen.service.TbSysuserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

/**
 * @program: Online
 * @description: 用户管理
 * @author: GuiQingChen
 * @create: 2021-01-28 11:06
 **/
@Controller
@RequestMapping("/manager/userManager")
public class ManagerUserController {

    @Autowired
    private TbSysuserService userService;

    /**
     * @Description: 用户列表
     * @Param: [model]
     * @return: java.lang.String
     * @Author: GuiQingChen
     * @Date: 2021/1/28
     */
    @RequestMapping("/userList")
    public String userList(Model model) {

        //查询所有用户
        List<TbSysuser> sysuserList = userService.queryAll(new TbSysuser());
        model.addAttribute("userList", sysuserList);
        return "manager/user/userList";
    }

    /**
     * @Description: 查询某个用户
     * @Param: [req, resp]
     * @return: java.lang.String
     * @Author: GuiQingChen
     * @Date: 2021/1/28
     */
    @RequestMapping("/findUser")
    @ResponseBody
    public Result<TbSysuser> findUser(String id, Model model) throws ServletException, IOException {
        Result<TbSysuser> tbResult = null;
        ArrayList<TbSysuser> list = new ArrayList<>();
        //根据Id查询用户信息
        TbSysuser tbSysuser = userService.queryById(Integer.valueOf(id));
        list.add(tbSysuser);
        model.addAttribute("user", tbSysuser);
        if (tbSysuser != null) {
            tbResult = new Result<TbSysuser>(0, "查询成功", list);
        } else {
            tbResult = new Result<TbSysuser>(1, "查询失败", list);
        }
        return tbResult;

    }

    /**
     * @Description: 删除用户
     * @Param: [id, model]
     * @return: java.lang.String
     * @Author: GuiQingChen
     * @Date: 2021/1/28
     */
    @RequestMapping("/delUser")
    @ResponseBody
    public Result<TbSysuser> delUser(String id) {

        boolean result = userService.deleteById(Integer.valueOf(id));
        Result<TbSysuser> tbResult = null;
        ArrayList<TbSysuser> list = new ArrayList<>();
        if (result) {
            tbResult = new Result<TbSysuser>(0, "删除成功!", list);
        } else {
            tbResult = new Result<TbSysuser>(1, "删除失败!", list);
        }
        return tbResult;
    }

    @RequestMapping("/query")
    public String queryByName(String userName, Model model) {
        TbSysuser tbSysuser = new TbSysuser();
        tbSysuser.setUserName(userName);
        List<TbSysuser> list = userService.queryAll(tbSysuser);
        model.addAttribute("userList", list);
        return "manager/user/userList";

    }

    @RequestMapping("/userInsert")
    @ResponseBody
    public Result<TbSysuser> userInsert(TbSysuser sysuser) {
        Result<TbSysuser> result = null;
        ArrayList<TbSysuser> list = new ArrayList<>();
        list.add(sysuser);
        int insert = userService.insert(sysuser);
        if (insert > 0) {
            //插入成功
            result = new Result<>(0, "新增成功!", list);
        } else {
            result = new Result<>(1, "新增失败!", list);
        }
        return result;
    }

    @RequestMapping("/showUser")
    public String showUser(Model model) {
        //查询所有用户
        List<TbSysuser> sysuserList = userService.queryAll(new TbSysuser());
        model.addAttribute("userList", sysuserList);
        return "manager/user/userNew";

    }

    @PostMapping("/userUpdate")
    @ResponseBody
    public Result<TbSysuser> userUpdate(TbSysuser sysuser) {
        Result<TbSysuser> result = null;
        ArrayList<TbSysuser> list = new ArrayList<>();
        list.add(sysuser);
        int update = userService.update(sysuser);
        if (update > 0) {
            //插入成功
            result = new Result<>(0, "修改成功!", list);
        } else {
            result = new Result<>(1, "修改失败!", list);
        }
        return result;
    }
}