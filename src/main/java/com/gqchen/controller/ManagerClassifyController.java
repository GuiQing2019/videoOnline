package com.gqchen.controller;

import com.gqchen.entity.Result;
import com.gqchen.entity.TbClassify;
import com.gqchen.entity.TbRole;
import com.gqchen.entity.TbSysuser;
import com.gqchen.service.TbClassifyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;
import java.util.spi.LocaleServiceProvider;

/**
 * @program: Online
 * @description: 分类控制层
 * @author: GuiQingChen
 * @create: 2021-01-30 19:33
 **/
@Controller
@RequestMapping("/manager/classifyManager")
public class ManagerClassifyController {

    @Autowired
    private TbClassifyService classifyService;

    @RequestMapping("/classifyList")
    public String classifyList(Model model){
        List<TbClassify> tbClassifies = classifyService.queryAll(new TbClassify());
        model.addAttribute("classifyList",tbClassifies);
        return "/manager/classIfy/classifyList";
    }

    @PostMapping("/classifyInsert")
    @ResponseBody
    public Result<TbClassify> classifyNew(TbClassify tbClassify){
        int INSERT_FLAG = classifyService.insert(tbClassify);
        Result<TbClassify> result=null;
        ArrayList<TbClassify> list = new ArrayList<>();
        list.add(tbClassify);
        if (INSERT_FLAG > 0) {
            result=new Result<TbClassify>(0,"新增成功!",list);
        }else {
            result=new Result<TbClassify>(1,"新增失败",list);
        }
        return result;
    }
    @PostMapping("/delClassify")
    @ResponseBody
    public Result<TbClassify> classifyNew(String  id){
        boolean DEL_FLAG = classifyService.deleteById(Integer.valueOf(id));
        Result<TbClassify> result=null;
        ArrayList<TbClassify> list = new ArrayList<>();

        if (DEL_FLAG) {
            result=new Result<TbClassify>(0,"删除成功!",list);
        }else {
            result=new Result<TbClassify>(1,"删除失败",list);
        }
        return result;
    }

    @RequestMapping("/query")
    public String queryByName(String classifyName, Model model) {
        TbClassify tbClassify = new TbClassify();
        tbClassify.setClassifyName(classifyName);
        List<TbClassify> tbClassifies = classifyService.queryAll(tbClassify);
        model.addAttribute("classifyList", tbClassifies);
        return "manager/classIfy/classifyList";
    }

    @PostMapping("/classifyUpdate")
    public String classifyUpdate(TbClassify classify,Model model){

        int update = classifyService.update(classify);
        if (update > 0) {
            //查询所有
            List<TbClassify> classifyList = classifyService.queryAll(new TbClassify());
            model.addAttribute("classifyList",classifyList);
            return "/manager/classIfy/classifyList";
        }
        return "修改失败";
    }
}
