package com.gqchen.service.impl;

import com.gqchen.entity.TbFocus;
import com.gqchen.dao.TbFocusDao;
import com.gqchen.service.TbFocusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (TbFocus)表服务实现类
 *
 * @author makejava
 * @since 2021-02-21 13:03:24
 */
@Service("tbFocusService")
public class TbFocusServiceImpl implements TbFocusService {
    @Resource
    private TbFocusDao tbFocusDao;

    @Autowired
    private TbFocus focus;

    @Override
    public String addFocused(int userId, int focusedId) {

        // 不可以对自己关注
        if (userId == focusedId) {
            return "不可以对自己进行关注";
        }
        focus.setUserId(userId);
        focus.setFocusedId(focusedId);
        int signal = tbFocusDao.selectOneVerify(focus);
        if (signal == 0) {
            try {
                tbFocusDao.insertOne(focus);
                return "关注成功";
            } catch (Exception e) {
                return "关注失败";
            }
        } else {
            return "已关注";
        }
    }

    @Override
    public String focusVerify(int userId, int focusedId) {
        focus.setUserId(userId);
        focus.setFocusedId(focusedId);
        int signal = tbFocusDao.selectOneVerify(focus);
        if (signal == 0) {
            return "未关注";
        } else {
            return "已关注";
        }
    }

    @Override
    public List<Integer> getUserFocusList(int userId) {
        List<Integer> focusedsIdList = tbFocusDao.selectFocusedsId(userId);
        return focusedsIdList;
    }
}