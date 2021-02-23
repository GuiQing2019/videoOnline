package com.gqchen.entity;

import java.io.Serializable;

/**
 * (TbViewcount)实体类
 *
 * @author makejava
 * @since 2021-02-18 16:27:10
 */
public class TbViewcount implements Serializable {
    private static final long serialVersionUID = -47144380980162663L;
    
    private Integer viewId;
    
    private Integer videoid;
    
    private Integer num;


    public Integer getViewId() {
        return viewId;
    }

    public void setViewId(Integer viewId) {
        this.viewId = viewId;
    }

    public Integer getVideoid() {
        return videoid;
    }

    public void setVideoid(Integer videoid) {
        this.videoid = videoid;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

}