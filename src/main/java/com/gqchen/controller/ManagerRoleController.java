package com.gqchen.controller;

import com.gqchen.entity.Result;
import com.gqchen.entity.TbRole;
import com.gqchen.entity.TbSysuser;
import com.gqchen.service.TbRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * @program: Online
 * @description: 角色控制层
 * @author: GuiQingChen
 * @create: 2021-01-30 14:45
 **/
@RequestMapping("/manager/roleManager")
@Controller
public class ManagerRoleController {

    @Autowired
    private TbRoleService roleService;

    @RequestMapping("/roleList")
    public String roleList(Model model) {
        //查询角色,传递角色列表
        List<TbRole> tbRoles = roleService.queryAll(new TbRole());
        model.addAttribute("roleList", tbRoles);
        return "manager/user/roleList";
    }

    @PostMapping("/delRole")
    @ResponseBody
    public Result<TbRole> delRole(String id) {
        Result<TbRole> result = null;
        ArrayList<TbRole> list = new ArrayList<>();
        boolean delRole = roleService.deleteById(Integer.valueOf(id));
        if (delRole) {
            result = new Result<TbRole>(0, "删除成功", list);
        } else {
            result = new Result<TbRole>(1, "删除失败", list);
        }
        return result;
    }


    @PostMapping("/roleInsert")
    @ResponseBody
    public Result<TbRole> addRole(TbRole role) {

        int Insert_falg = roleService.insert(role);
        Result<TbRole> result = null;
        ArrayList<TbRole> tbRoles = new ArrayList<>();
        tbRoles.add(role);
        if (Insert_falg > 0) {
            //插入成功,进行逻辑判断
            result = new Result<TbRole>(0, "新增成功!", tbRoles);
        } else {
            result = new Result<TbRole>(1, "新增失败!", tbRoles);
        }
        return result;

    }

    @RequestMapping("/query")
    public String queryByName(String roleName, Model model) {
        TbRole tbRole = new TbRole();
        tbRole.setRoleName(roleName);
        List<TbRole> list = roleService.queryAll(tbRole);
        model.addAttribute("roleList", list);
        return "manager/user/roleList";

    }

}
