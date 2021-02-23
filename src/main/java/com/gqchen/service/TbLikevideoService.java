package com.gqchen.service;

import com.gqchen.entity.TbLikevideo;
import java.util.List;

/**
 * (TbLikevideo)表服务接口
 *
 * @author makejava
 * @since 2021-02-19 20:23:18
 */
public interface TbLikevideoService {

    /**
     * 通过ID查询单条数据
     *
     * @param likeId 主键
     * @return 实例对象
     */
    TbLikevideo queryById(Integer likeId);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<TbLikevideo> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param tbLikevideo 实例对象
     * @return 实例对象
     */
    TbLikevideo insert(TbLikevideo tbLikevideo);

    /**
     * 修改数据
     *
     * @param tbLikevideo 实例对象
     * @return 实例对象
     */
    TbLikevideo update(TbLikevideo tbLikevideo);

    /**
     * 通过主键删除数据
     *
     * @param likeId 主键
     * @return 是否成功
     */
    boolean deleteById(Integer likeId);


    List<TbLikevideo> queryAll(TbLikevideo likevideo);

    /**
    * @Description: 根据videoId查询点赞数量
    * @Param: [videoId]
    * @return: int
    * @Author: GuiQingChen
    * @Date: 2021/2/20
     */
    int startNum(Integer videoId);
}