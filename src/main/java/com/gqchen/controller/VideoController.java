package com.gqchen.controller;

import com.gqchen.entity.*;
import com.gqchen.service.TbLikevideoService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.jws.WebParam;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

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


    @PostMapping("/delLikeVideo")
    @ResponseBody
    public Result<TbLikevideo> delLikeVideo(@RequestParam String id, Model model){
        TbLikevideo tbLikevideo = new TbLikevideo();
        tbLikevideo.setVideoId(Integer.valueOf(id));
        List<TbLikevideo> tbLikevideos = likevideoService.queryAll(tbLikevideo);
        for (TbLikevideo likevideo : tbLikevideos) {
            likevideoService.deleteById(likevideo.getLikeId());
        }
        return new Result<TbLikevideo>(0,"移除成功!",null);
    }

    @RequestMapping("/DianZanByAjax")
    @ResponseBody
    public MsgResponse DianZanByAjax(HttpServletRequest request, @RequestParam String videoId) {
        TbSysuser sendUser = (TbSysuser) request.getSession().getAttribute("tbSysuser");

        TbLikevideo tbLikevideo = new TbLikevideo();
        tbLikevideo.setVideoId(Integer.valueOf(videoId));
        tbLikevideo.setUserId(sendUser.getUserId());
        List<TbLikevideo> tbLikevideos = likevideoService.queryAll(tbLikevideo);
        //如果已点赞过 则size>0
        if (tbLikevideos.size() > 0) {

            return MsgResponse.error("已经点赞过了~!");

        } else {
            //进行点赞新增
            tbLikevideo.setUserId(sendUser.getUserId());
            tbLikevideo.setVideoId(Integer.valueOf(videoId));
            tbLikevideo.setLikeGrade(0);
            TbLikevideo insert = likevideoService.insert(tbLikevideo);

        }
        return MsgResponse.success("点赞成功!", null);

    }


    @RequestMapping("/commented")
    @ResponseBody
    public MsgResponse commented(@RequestParam int starNum, @RequestParam int userId, @RequestParam int videoId, Model model) {
        //starNum是评分分数
        TbLikevideo tbLikevideo = new TbLikevideo();
        tbLikevideo.setUserId(userId);
        tbLikevideo.setVideoId(videoId);
        List<TbLikevideo> tbLikevideos = likevideoService.queryAll(tbLikevideo);
        if (tbLikevideos.size() > 0) {
            //如果查询的到.则进行修改
            TbLikevideo tbLikevideo1 = tbLikevideos.get(0);
            tbLikevideo1.setLikeGrade(starNum);
            likevideoService.update(tbLikevideo1);
            model.addAttribute("tbLikevideo",tbLikevideo1);
        } else {
            //查询不到,则进行新增创建
            tbLikevideo.setLikeGrade(starNum);
            likevideoService.insert(tbLikevideo);
            model.addAttribute("tbLikevideo",tbLikevideo);
            return MsgResponse.success("点评成功!", null);
        }

        return MsgResponse.success("点评已修改!", null);
    }
}
