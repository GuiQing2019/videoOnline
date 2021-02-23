package com.gqchen.service;

import com.gqchen.entity.TbMessage;
import java.util.List;

/**
 * (TbMessage)表服务接口
 *
 * @author makejava
 * @since 2021-02-23 20:48:17
 */
public interface TbMessageService {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    TbMessage queryById(Integer id);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<TbMessage> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param tbMessage 实例对象
     * @return 实例对象
     */
    TbMessage insert(TbMessage tbMessage);

    /**
     * 修改数据
     *
     * @param tbMessage 实例对象
     * @return 实例对象
     */
    TbMessage update(TbMessage tbMessage);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    boolean deleteById(Integer id);

}