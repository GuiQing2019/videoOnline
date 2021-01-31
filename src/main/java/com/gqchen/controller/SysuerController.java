package com.gqchen.controller;

import com.gqchen.entity.Result;
import com.gqchen.entity.TbSysuser;
import com.gqchen.service.TbSysuserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/sysuser")
public class SysuerController {
    private static final Integer SUCCESS_CODE = 0;
    private static final Integer FAIL_CODE = 1;
    private static final String SUCCESS_MSG = "登录成功!";
    private static final String FAIL_MSG = "登录失败!";

    @Autowired
    private TbSysuserService service;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public Result<TbSysuser> login(TbSysuser sysuser) {

        List<TbSysuser> list = new ArrayList<>();
        Result<TbSysuser> result = null;
        list = service.queryAll(sysuser);
        if (list.size() > 0) {
            result = new Result<>(SUCCESS_CODE, SUCCESS_MSG, list);
        } else {
            result = new Result<>(FAIL_CODE, FAIL_MSG, list);
        }
        return result;
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    public Result<Integer> register(TbSysuser tbSysuser) {
        //开始注册,需要设置statu_id和role_id 默认1 age年龄
        tbSysuser.setRoleId(1);
        tbSysuser.setStatuId(1);
        int resultIn = service.insert(tbSysuser);
        Result<Integer> result = null;
        ArrayList<Integer> list = new ArrayList<>();
        list.add(resultIn);
        if (resultIn > 0) {
            result = new Result<>(SUCCESS_CODE, "插入成功!", list);
        } else {
            result = new Result<>(SUCCESS_CODE, "插入失败!", list);
        }
        return result;
    }


}
