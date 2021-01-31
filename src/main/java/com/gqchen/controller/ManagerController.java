package com.gqchen.controller;

import com.gqchen.entity.TbClassify;
import com.gqchen.entity.TbRole;
import com.gqchen.entity.TbSysuser;
import com.gqchen.service.TbClassifyService;
import com.gqchen.service.TbRoleService;
import com.gqchen.service.TbSysuserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @program: Online
 * @description: 后台管理系统
 * @author: GuiQingChen
 * @create: 2021-01-28 10:36
 **/
@RequestMapping("/manager")
@Controller
public class ManagerController {

    @Autowired
    private TbRoleService roleService;

    @Autowired
    private TbSysuserService sysuserService;

    @Autowired
    private TbClassifyService classifyService;

    @RequestMapping("/index")
    public String manager() {

        return "/manager/manager";
    }

    @RequestMapping("/userNew")
    public String userNew(Model model){
        //跳转到用户新增页面
        List<TbSysuser> sysusers = sysuserService.queryAll(new TbSysuser());
        model.addAttribute("userList",sysusers);
        return "/manager/user/userNew";
    }

    @RequestMapping("/roleNew")
    public String roleNew(Model model){
        //跳转到角色新增页面
        List<TbRole> tbRoles = roleService.queryAll(new TbRole());
        model.addAttribute("roleList",tbRoles);
        return "/manager/user/roleNew";
    }

    @RequestMapping("/classifyNew")
    public String classifyNew(Model model){
        List<TbClassify> tbClassifies = classifyService.queryAll(new TbClassify());
        model.addAttribute("classifyList",tbClassifies);
        return "/manager/classIfy/classifyNew";
    }
}
