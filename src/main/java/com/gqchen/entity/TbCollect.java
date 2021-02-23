package com.gqchen.entity;

import org.springframework.stereotype.Component;

import java.io.Serializable;

/**
 * (TbCollect)实体类
 *
 * @author makejava
 * @since 2021-02-22 11:06:01
 */
@Component
public class TbCollect implements Serializable {
    private static final long serialVersionUID = -32733073656542340L;
    
    private Integer collectId;
    
    private Integer userId;
    
    private Integer videoId;


    public Integer getCollectId() {
        return collectId;
    }

    public void setCollectId(Integer collectId) {
        this.collectId = collectId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getVideoId() {
        return videoId;
    }

    public void setVideoId(Integer videoId) {
        this.videoId = videoId;
    }

}