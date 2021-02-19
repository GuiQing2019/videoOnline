package com.gqchen.controller;

import com.gqchen.entity.*;
import com.gqchen.service.TbSysuserService;
import com.gqchen.service.TbVideoService;
import com.gqchen.service.TbVideoapproverService;
import com.gqchen.service.TbViewcountService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * @program: Online
 * @description: 主界面
 * @author: GuiQingChen
 * @create: 2021-01-27 20:19
 **/
@RequestMapping("/page")
@Controller
public class PageController {

    private final static Logger LOG = LoggerFactory.getLogger(PageController.class);

    @Autowired
    private TbSysuserService sysuserService;

    @Autowired
    private TbVideoService videoService;

    @Autowired
    private TbVideoapproverService videoapproverService;

    @Autowired
    private TbViewcountService viewcountService;

    @RequestMapping("/index")
    public String page() {
        LOG.info("------------------------------ 用户界面 ------------------------------");
        return "/index/index";
    }

    @RequestMapping("/userInfo")
    public String userInfo(String id, Model session) {
        LOG.info("------------------------------ 进入到个人中心 ------------------------------");
        if (!id.equals("")) {
            LOG.info("id不为空,根据id返回数据");
            TbSysuser tbSysuser = sysuserService.queryById(Integer.valueOf(id));
            session.addAttribute("tbSysuser", tbSysuser);
        }
        return "/index/user/userinformation";
    }

    @RequestMapping("/myVideo")
    public String myVideo(String id, Model model) {
        LOG.info("------------------------------ 我的视频 ------------------------------");
        //查询该用户的所有视频
        TbVideo tbVideo = new TbVideo();
        tbVideo.setUserId(Integer.valueOf(id));
        //查询出userId的所有视频
        List<TbVideo> tbVideos = videoService.queryAll(tbVideo);
        model.addAttribute("tbVideos", tbVideos);

        return "/index/user/myVideo";
    }

    @RequestMapping("/videoCentre")
    public String videoCentre(String id, Model model) {
        LOG.info("------------------------------ 视频中心 ------------------------------");
        //搜索所有影视片出来
        List<TbUserAndVideo> tbUserAndVideos = videoService.queryAllVideoAndUserName(new TbVideo());
        //url,typeId均未显示
        model.addAttribute("tbUserAndVideos", tbUserAndVideos);

        return "/index/user/videoCentre";
    }


    /**
     * 上传视频
     *
     * @param file
     * @param model
     * @param request
     * @return
     */
    @PostMapping(value = "/uploadVidoe")
    @ResponseBody
    @Transactional
    public Map<String, String> fileUpload(@RequestParam(value = "file") MultipartFile file, Model model, TbVideo video, HttpServletRequest request) {
        LOG.info("------------------------------ 上传文件中 ------------------------------");
        Map<String, String> map = new HashMap<>();
        String fileName = "";
        TbVideoapprover videoapprover;
        //判断文件是否为空
        if (file.isEmpty()) {
            map.put("msg", "文件为空");
            map.put("type", "loss");
        } else {
            try {
                fileName = file.getOriginalFilename();  // 文件名
                String suffixName = fileName.substring(fileName.lastIndexOf("."));  // 后缀名
                //getRealPath("/")返回的是项目在服务器的绝对路径
                String filePath = request.getSession().getServletContext().getRealPath("file-service/media"); // 上传后的路径
                LOG.info("上传后的路径:" + filePath); //F:\online\Online\src\main\webapp\file-service/media
                //重构文件名
                String pkId = UUID.randomUUID().toString().replaceAll("-", "");
                fileName = pkId + suffixName;
                // 新文件名
                File dest = new File(filePath + "/" + fileName);
                if (!dest.getParentFile().exists()) {
                    dest.getParentFile().mkdirs();
                }

                file.transferTo(dest);
                String filename = "/file-service/media/" + fileName;
                map.put("webShowPath", filename);
                LOG.info("上传成功");
                map.put("resCode", "1");
            } catch (IOException e) {
                String filename = "/file-service/media/" + fileName;
                map.put("webShowPath", filename);
                map.put("resCode", "0");
                LOG.error(e.getMessage(), e);
                LOG.info("上传失败");
            }

            try {
                LOG.info("------------------------------ 审核提交中 ------------------------------");
                //前台传送有file,userId,videoClassify,videoInfo,videoTitle
                //首先存储到video审核表
                TbVideoapprover approver = new TbVideoapprover();
                approver.setUserId(video.getUserId());
                approver.setStatuId(5);
                approver.setVideoName(video.getVideoTitle());
                approver.setVideoDesc(video.getVideoInfo());
                approver.setClassifyId(video.getVideoClassify());
                approver.setVideoUrl("/file-service/media/" + fileName);
                videoapprover = videoapproverService.insert(approver);

            } catch (Exception e) {
                LOG.error("审核表插入失败,请检查入参是否有误");
                LOG.error(e.getMessage(), e);
                String filename = "/file-service/media/" + fileName;
                map.put("webShowPath", filename);
                map.put("resCode", "0");
                throw e;
            } finally {
                LOG.info("------------------------------ 审核提交完成! ------------------------------");
            }

            try {
                //在存储到video表中
                LOG.info("------------------------------ 存储video表! ------------------------------");
                video.setVideoStatuId(videoapprover.getStatuId());
                video.setVideotypeId(videoapprover.getVideoapproverId());
                video.setVideoUrl(videoapprover.getVideoUrl());
                videoService.insert(video);
            } catch (Exception e) {
                LOG.error("video表存储失败,检查入参是否有误");
                LOG.error(e.getMessage(), e);
                String filename = "/file-service/media/" + fileName;
                map.put("webShowPath", filename);
                map.put("resCode", "0");
                throw e;
            } finally {
                LOG.info("------------------------------ 存储提交完成 ------------------------------");
            }
        }
        return map;
    }


    @RequestMapping("/videoPlay")
    public String videoPlay(String id, Model model) {
        LOG.info("----------------------------- 视频播放 ------------------------------");
        //接收影片id,根据影片videoId,查询出上传者,名称,描述,视频类型,视频状态
        TbVideo tbVideo = videoService.queryById(Integer.valueOf(id));
        List<TbUserAndVideo> tbUserAndVideos = videoService.queryAllVideoAndUserName(tbVideo);
        //获取出唯一
        TbUserAndVideo tbUserAndVideo = tbUserAndVideos.get(0);
        model.addAttribute("tbUserAndVideo",tbUserAndVideo);

        //兜取观看记录人数表,对videoId进行查询是否存在,不存在则创建
        TbViewcount viewcount = new TbViewcount();
        viewcount.setVideoid(Integer.valueOf(id));
        List<TbViewcount> tbViewcounts = viewcountService.queryAll(viewcount);
        if (tbViewcounts.size()>0) {
            //返回观看人数
            TbViewcount tbViewcount = tbViewcounts.get(0);
            Integer num = tbViewcount.getNum();
            //观看记录+1
            tbViewcount.setNum(num+1);
            //同步到数据库
            viewcountService.update(tbViewcount);
            //传递到前台页面
            model.addAttribute("tbViewcount",tbViewcount);
        }else {
            //新增videoId并赋值为0
            viewcount.setNum(0);
            viewcountService.insert(viewcount);

            //查询出该实体
            List<TbViewcount> tbViewcounts1 = viewcountService.queryAll(viewcount);
            TbViewcount tbViewcount = tbViewcounts1.get(0);
            //传递到前台页面
            model.addAttribute("tbViewcount",tbViewcount);
        }

        return "/index/user/videoplay";
    }

}
