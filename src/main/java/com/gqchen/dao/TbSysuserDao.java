package com.gqchen.dao;

import com.gqchen.entity.TbCollect;
import com.gqchen.entity.TbSysuser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * (TbSysuser)表数据库访问层
 *
 * @author makejava
 * @since 2021-01-27 18:49:55
 */
public interface TbSysuserDao {

    /**
     * 通过ID查询单条数据
     *
     * @param userId 主键
     * @return 实例对象
     */
    TbSysuser queryById(Integer userId);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit  查询条数
     * @return 对象列表
     */
    List<TbSysuser> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param tbSysuser 实例对象
     * @return 对象列表
     */
    List<TbSysuser> queryAll(TbSysuser tbSysuser);

    /**
     * 新增数据
     *
     * @param tbSysuser 实例对象
     * @return 影响行数
     */
    int insert(TbSysuser tbSysuser);

    /**
     * 修改数据
     *
     * @param tbSysuser 实例对象
     * @return 影响行数
     */
    int update(TbSysuser tbSysuser);

    /**
     * 通过主键删除数据
     *
     * @param userId 主键
     * @return 影响行数
     */
    int deleteById(Integer userId);

}