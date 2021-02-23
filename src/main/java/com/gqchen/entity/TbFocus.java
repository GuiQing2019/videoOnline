package com.gqchen.entity;

import org.springframework.stereotype.Component;

import java.io.Serializable;

/**
 * (TbFocus)实体类
 *
 * @author makejava
 * @since 2021-02-21 13:03:24
 */
@Component
public class TbFocus implements Serializable {
    private static final long serialVersionUID = -64150871122153170L;
    
    private Integer focusId;
    
    private Integer focusedId;
    
    private Integer userId;


    public Integer getFocusId() {
        return focusId;
    }

    public void setFocusId(Integer focusId) {
        this.focusId = focusId;
    }

    public Integer getFocusedId() {
        return focusedId;
    }

    public void setFocusedId(Integer focusedId) {
        this.focusedId = focusedId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

}