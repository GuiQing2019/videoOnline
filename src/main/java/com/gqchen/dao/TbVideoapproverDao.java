package com.gqchen.dao;

import com.gqchen.entity.TbVideoapprover;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * (TbVideoapprover)表数据库访问层
 *
 * @author makejava
 * @since 2021-01-31 00:37:49
 */
public interface TbVideoapproverDao {

    /**
     * 通过ID查询单条数据
     *
     * @param videoapproverId 主键
     * @return 实例对象
     */
    TbVideoapprover queryById(Integer videoapproverId);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<TbVideoapprover> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param tbVideoapprover 实例对象
     * @return 对象列表
     */
    List<TbVideoapprover> queryAll(TbVideoapprover tbVideoapprover);

    /**
     * 新增数据
     *
     * @param tbVideoapprover 实例对象
     * @return 影响行数
     */
    int insert(TbVideoapprover tbVideoapprover);

    /**
     * 修改数据
     *
     * @param tbVideoapprover 实例对象
     * @return 影响行数
     */
    int update(TbVideoapprover tbVideoapprover);

    /**
     * 通过主键删除数据
     *
     * @param videoapproverId 主键
     * @return 影响行数
     */
    int deleteById(Integer videoapproverId);

}