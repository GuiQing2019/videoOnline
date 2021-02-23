package com.gqchen.controller;

import com.gqchen.entity.MsgResponse;
import com.gqchen.entity.TbSysuser;
import com.gqchen.service.TbFocusService;
import com.gqchen.service.TbSysuserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * @program: Online
 * @description: 关注用户表
 * @author: GuiQingChen
 * @create: 2021-02-21 13:06
 **/
@Controller
@RequestMapping("/FocusController")
public class FocusController {

    @Autowired
    private TbFocusService focusService;

    @Autowired
    private TbSysuserService sysuserService;

    @PostMapping("FocusOnByAjax")
    @ResponseBody
    public MsgResponse FocusOnByAjax(HttpServletRequest request,@RequestParam String focusedId) {
        TbSysuser user = (TbSysuser)request.getSession().getAttribute("tbSysuser");
        if(user!=null && focusedId!=null && !focusedId.equals("")) {
            int userId = user.getUserId();
            int focusedIdInt = Integer.parseInt(focusedId);
            return MsgResponse.success(focusService.addFocused(userId, focusedIdInt), null);
        }else {
            return MsgResponse.error("参数错误");
        }
    }

    @PostMapping("FocusVerifyByAjax")
    @ResponseBody
    public MsgResponse FocusVerifyByAjax(HttpServletRequest request,@RequestParam String focusedId) {
        TbSysuser user = (TbSysuser)request.getSession().getAttribute("tbSysuser");
        if(user!=null && focusedId!=null && !focusedId.equals("")) {
            int userId = user.getUserId();
            int focusedIdInt = Integer.parseInt(focusedId);
            return MsgResponse.success(focusService.focusVerify(userId, focusedIdInt), null);
        }else {
            return MsgResponse.error("参数错误");
        }
    }

    @GetMapping("focusedListByAjax")
    @ResponseBody
    public MsgResponse focusedListByAjax(HttpServletRequest request) {
        TbSysuser user = (TbSysuser)request.getSession().getAttribute("tbSysuser");
        if(user!=null) {
            int userId = user.getUserId();
            List<Integer> userFocusList = focusService.getUserFocusList(userId);
            List<TbSysuser> focusList= new ArrayList<TbSysuser>();
            for(Integer focusId:userFocusList) {
                focusList.add(sysuserService.queryById(focusId));
            }

            return MsgResponse.success("success", focusList);
        }else {
            return MsgResponse.error("参数错误");
        }
    }
}
