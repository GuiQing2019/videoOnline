package com.gqchen.dao;

import com.gqchen.entity.TbFocus;
import com.gqchen.entity.TbSysuser;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * (TbFocus)表数据库访问层
 *
 * @author makejava
 * @since 2021-02-21 13:03:24
 */
public interface TbFocusDao {


    /**
     * 该用户关注的人
     * @param userId
     * @return
     */
    public List<TbSysuser> selectFocuseds(int userId);

    public List<Integer> selectFocusedsId(int userId);

    /**
     * 关注该用户的人
     * @param userId
     * @return
     */
    public List<TbSysuser> selectFocuses(int userId);

    public int selectOneVerify(TbFocus focus);

    public int insertOne(TbFocus focus);

    public int deleteOne(TbFocus focus);
}