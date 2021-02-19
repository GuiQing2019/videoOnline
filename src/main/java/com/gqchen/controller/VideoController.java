package com.gqchen.controller;

import com.gqchen.entity.MsgResponse;
import com.gqchen.entity.TbLikevideo;
import com.gqchen.entity.TbSysuser;
import com.gqchen.service.TbLikevideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * @program: Online
 * @description: 点赞
 * @author: GuiQingChen
 * @create: 2021-02-19 20:31
 **/
@Controller
@RequestMapping("/VideoController")
public class VideoController {

    @Autowired
    private TbLikevideoService likevideoService;


    @RequestMapping("/DianZanByAjax")
    @ResponseBody
    public MsgResponse DianZanByAjax(HttpServletRequest request, @RequestParam String videoId) {
        TbSysuser sendUser = (TbSysuser) request.getSession().getAttribute("tbSysuser");
        TbLikevideo tbLikevideo = new TbLikevideo();
        tbLikevideo.setUserId(sendUser.getUserId());
        tbLikevideo.setVideoId(Integer.valueOf(videoId));
        TbLikevideo insert = likevideoService.insert(tbLikevideo);
        if (null != insert) {
            return MsgResponse.success("点赞成功", null);
        } else {
            return MsgResponse.error("点赞失败");
        }
    }
}
