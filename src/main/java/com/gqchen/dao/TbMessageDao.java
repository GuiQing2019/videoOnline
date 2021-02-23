package com.gqchen.dao;

import com.gqchen.entity.TbMessage;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * (TbMessage)表数据库访问层
 *
 * @author makejava
 * @since 2021-02-23 20:48:17
 */
public interface TbMessageDao {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    TbMessage queryById(Integer id);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<TbMessage> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param tbMessage 实例对象
     * @return 对象列表
     */
    List<TbMessage> queryAll(TbMessage tbMessage);

    /**
     * 新增数据
     *
     * @param tbMessage 实例对象
     * @return 影响行数
     */
    int insert(TbMessage tbMessage);

    /**
     * 修改数据
     *
     * @param tbMessage 实例对象
     * @return 影响行数
     */
    int update(TbMessage tbMessage);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 影响行数
     */
    int deleteById(Integer id);

}