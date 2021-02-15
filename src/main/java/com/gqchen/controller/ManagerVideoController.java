package com.gqchen.controller;

import com.gqchen.entity.Result;
import com.gqchen.entity.TbUserAndVideo;
import com.gqchen.entity.TbVideo;
import com.gqchen.entity.TbVideoapprover;
import com.gqchen.service.TbVideoService;
import com.gqchen.service.TbVideoapproverService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @program: Online
 * @description: 视频控制层
 * @author: GuiQingChen
 * @create: 2021-01-30 22:29
 **/
@Controller
@RequestMapping("/manager/videoManager")
public class ManagerVideoController {

    private static final Logger LOG = LoggerFactory.getLogger(ManagerVideoController.class);

    @Autowired
    private TbVideoService videoService;

    @Autowired
    private TbVideoapproverService videoapproverService;

    @RequestMapping("/videoList")
    public String videoList(Model model) {

        List<TbUserAndVideo> tbUserAndVideos = videoService.queryAllVideoAndUserName(new TbVideo());
        model.addAttribute("videoList", tbUserAndVideos);
        return "manager/video/videoList";
    }

    @RequestMapping("/videoApproverList")
    public String videoApprover(Model model) {
        List<TbVideoapprover> tbVideoapprovers = videoapproverService.queryAll(new TbVideoapprover());
        model.addAttribute("videoApproverList", tbVideoapprovers);
        return "manager/video/videoApprover";
    }

    /**
     * @Description: 接收的id是video_Id
     * 1.根据id查询审批表id,在进行删除审批表对应的数据
     * 2.在删除video表对应数据
     * @Param: [id]
     * @return: java.lang.String
     * @Author: GuiQingChen
     * @Date: 2021/2/13
     */
    @PostMapping("/delVideo")
    @ResponseBody
    public Result<TbVideo> delVideo(@RequestParam("id") String id) {
        LOG.info("------------------------------ 删除影片逻辑 ------------------------------");
        TbVideo tbVideo = new TbVideo();
        tbVideo.setVideoId(Integer.valueOf(id));
        //先删除审批表对应的数据
        List<TbVideo> tbVideos = videoService.queryAll(tbVideo);
        Result<TbVideo> tbVideoResult = new Result<>();
        tbVideoResult.setDATA(tbVideos);
        if (tbVideos.size() > 0) {
            try {
                LOG.info("删除审核表数据");
                TbVideo video = tbVideos.get(0);
                Integer videotypeId = video.getVideotypeId();
                videoapproverService.deleteById(videotypeId);
            } catch (Exception e) {
                LOG.error(e.getMessage(), e);
                LOG.error("审核表删除失败,请检查数据是否存在问题");
            } finally {
                LOG.info("删除成功!");
            }

            //删除video表
            try {
                //在删除
                LOG.info("删除video表");
                videoService.deleteById(Integer.valueOf(id));
                tbVideoResult.setCODE(0);
                tbVideoResult.setMSG("删除成功");
            } catch (NumberFormatException e) {
                tbVideoResult.setCODE(1);
                tbVideoResult.setMSG("删除失败");
                LOG.error(e.getMessage(), e);
                LOG.error("video表删除失败");
            }
        }

        //跳转到我的视频
        return tbVideoResult;

    }
    @RequestMapping("/queryVideoByClassify")
    public String queryVideoByClassify(String id,Model model){
        LOG.info(id);
        TbVideo tbVideo = new TbVideo();
        tbVideo.setVideoClassify(Integer.valueOf(id));
        List<TbUserAndVideo> tbUserAndVideos = videoService.queryAllVideoAndUserName(tbVideo);
        model.addAttribute("tbUserAndVideos",tbUserAndVideos);
        return "/index/user/videoCentre";
    }


}
