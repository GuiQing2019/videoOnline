package com.gqchen.entity;

import java.util.List;

/**
 * @program: Online
 * @description: 结果类
 * @author: GuiQingChen
 * @create: 2021-01-25 14:07
 **/
public class Result<T> {


    private Integer CODE;
    private String MSG;
    private List<T> DATA;



    public Result() {
    }

    public Result(Integer CODE, String MSG, List<T> DATA) {
        this.CODE = CODE;
        this.MSG = MSG;
        this.DATA = DATA;
    }

    public Integer getCODE() {
        return CODE;
    }

    public void setCODE(Integer CODE) {
        this.CODE = CODE;
    }

    public String getMSG() {
        return MSG;
    }

    public void setMSG(String MSG) {
        this.MSG = MSG;
    }

    public List<T> getDATA() {
        return DATA;
    }

    public void setDATA(List<T> DATA) {
        this.DATA = DATA;
    }

    @Override
    public String toString() {
        return "Result{" +
                "CODE=" + CODE +
                ", MSG='" + MSG + '\'' +
                ", DATA=" + DATA +
                '}';
    }
}
