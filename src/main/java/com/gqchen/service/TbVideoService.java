package com.gqchen.service;

import com.gqchen.entity.TbUserAndVideo;
import com.gqchen.entity.TbVideo;
import java.util.List;

/**
 * (TbVideo)表服务接口
 *
 * @author makejava
 * @since 2021-01-30 22:27:39
 */
public interface TbVideoService {

    /**
     * 通过ID查询单条数据
     *
     * @param videoId 主键
     * @return 实例对象
     */
    TbVideo queryById(Integer videoId);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<TbVideo> queryAllByLimit(int offset, int limit);

    /**
    * @Description: 查询所有视频
    * @Param: [video]
    * @return: java.util.List<com.gqchen.entity.TbVideo>
    * @Author: GuiQingChen
    * @Date: 2021/1/30
     */
    List<TbVideo> queryAll(TbVideo video);
    /**
     * 新增数据
     *
     * @param tbVideo 实例对象
     * @return 实例对象
     */
    TbVideo insert(TbVideo tbVideo);

    /**
     * 修改数据
     *
     * @param tbVideo 实例对象
     * @return 实例对象
     */
    TbVideo update(TbVideo tbVideo);

    /**
     * 通过主键删除数据
     *
     * @param videoId 主键
     * @return 是否成功
     */
    boolean deleteById(Integer videoId);

    /**
     * @Description: 根据用户id去查询用户表的用户名称
     * @Param: [uId]
     * @return: java.util.List<com.gqchen.entity.TbUserAndVideo>
     * @Author: GuiQingChen
     * @Date: 2021/2/15
     */
    List<TbUserAndVideo> queryAllVideoAndUserName(TbVideo video);
}