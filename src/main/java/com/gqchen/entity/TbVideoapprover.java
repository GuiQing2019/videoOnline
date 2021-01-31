package com.gqchen.entity;

import java.io.Serializable;

/**
 * (TbVideoapprover)实体类
 *
 * @author makejava
 * @since 2021-01-31 00:37:49
 */
public class TbVideoapprover implements Serializable {
    private static final long serialVersionUID = -20789782639859509L;
    
    private Integer videoapproverId;
    
    private String videoName;
    
    private String videoDesc;
    
    private String videoUrl;
    
    private Integer statuId;
    
    private Integer userId;
    
    private Integer classifyId;


    public Integer getVideoapproverId() {
        return videoapproverId;
    }

    public void setVideoapproverId(Integer videoapproverId) {
        this.videoapproverId = videoapproverId;
    }

    public String getVideoName() {
        return videoName;
    }

    public void setVideoName(String videoName) {
        this.videoName = videoName;
    }

    public String getVideoDesc() {
        return videoDesc;
    }

    public void setVideoDesc(String videoDesc) {
        this.videoDesc = videoDesc;
    }

    public String getVideoUrl() {
        return videoUrl;
    }

    public void setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl;
    }

    public Integer getStatuId() {
        return statuId;
    }

    public void setStatuId(Integer statuId) {
        this.statuId = statuId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getClassifyId() {
        return classifyId;
    }

    public void setClassifyId(Integer classifyId) {
        this.classifyId = classifyId;
    }

}