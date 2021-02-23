package com.gqchen.controller;

import com.gqchen.entity.*;
import com.gqchen.service.TbCollectService;
import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @program: Online
 * @description: 收藏表
 * @author: GuiQingChen
 * @create: 2021-02-22 11:07
 **/
@Controller
@RequestMapping("/CollectionController")
public class ConllectController {

    @Autowired
    private TbCollectService collectionService;

    @PostMapping("vertifyIfCollectionByAjax")
    @ResponseBody
    public MsgResponse vertifyIfCollectionByAjax(HttpServletRequest request, @RequestParam String videoId) {
        TbSysuser sysuser = (TbSysuser) request.getSession().getAttribute("tbSysuser");
        if (sysuser != null && videoId.matches("[0-9]*")) {
            return MsgResponse.success(collectionService.vertifyIfCollection(sysuser.getUserId(), Integer.valueOf(videoId)), null);
        } else {
            return MsgResponse.error("用户未登录或视频ID错误");
        }
    }


    @PostMapping("/addCollectionByAjax")
    @ResponseBody
    public MsgResponse addCollectionByAjax(HttpServletRequest request, @RequestParam String videoId) {
        TbSysuser sysuser = (TbSysuser) request.getSession().getAttribute("tbSysuser");
        if(sysuser != null && videoId.matches("[0-9]*")) {
            return MsgResponse.success(collectionService.addCollection(sysuser.getUserId(), Integer.parseInt(videoId)),null);
        }else {
            return MsgResponse.error("用户未登录或视频ID错误");
        }
    }

    @PostMapping("/delConllectVideo")
    @ResponseBody
    public Result<TbCollect> delConllectVideo(@RequestParam String id, Model model){
        TbCollect tbCollect = new TbCollect();
        tbCollect.setVideoId(Integer.valueOf(id));
        List<TbCollect> tbCollects = collectionService.queryAll(tbCollect);
        for (TbCollect collect : tbCollects) {
            collectionService.deleteById(collect.getCollectId());
        }
        return new Result<TbCollect>(0,"移出成功!",null);
    }
}
