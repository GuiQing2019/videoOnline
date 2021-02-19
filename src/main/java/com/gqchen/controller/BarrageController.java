package com.gqchen.controller;

import com.gqchen.entity.TbSysuser;
import com.gqchen.utils.BarrageWebSocket;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/BarrageController")
public class BarrageController {
	
    
    @ResponseBody
    @PostMapping("/sendGroupMessage/{videoId}")
    public Map<String, Object> groupMessage(HttpServletRequest request, @PathVariable Integer videoId, @RequestParam String message) {
        Map<String, Object> result = new HashMap<>();
        TbSysuser sendUser = (TbSysuser)request.getSession().getAttribute("tbSysuser");
        if(sendUser != null && !message.equals("")) {
        	//接收消息message，进行组发
        	BarrageWebSocket.sendGroupMessage(sendUser.getUserName(),videoId,message);
     		result.put("code", 200);
     		result.put("msg", "success");
        }   
		result.put("code", 500);
		result.put("msg", "error");
        return result;
    }
}
