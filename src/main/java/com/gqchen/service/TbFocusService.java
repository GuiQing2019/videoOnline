package com.gqchen.service;

import com.gqchen.entity.TbFocus;
import java.util.List;

/**
 * (TbFocus)表服务接口
 *
 * @author makejava
 * @since 2021-02-21 13:03:24
 */
public interface TbFocusService {

    public String addFocused(int userId,int focusedId);

    public String focusVerify(int userId,int focusedId);

    public List<Integer> getUserFocusList(int userId);



}