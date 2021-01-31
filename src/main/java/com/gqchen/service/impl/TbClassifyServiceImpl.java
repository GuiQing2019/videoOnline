package com.gqchen.service.impl;

import com.gqchen.entity.TbClassify;
import com.gqchen.dao.TbClassifyDao;
import com.gqchen.service.TbClassifyService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (TbClassify)表服务实现类
 *
 * @author makejava
 * @since 2021-01-30 19:25:53
 */
@Service("tbClassifyService")
public class TbClassifyServiceImpl implements TbClassifyService {
    @Resource
    private TbClassifyDao tbClassifyDao;

    /**
     * 通过ID查询单条数据
     *
     * @param classifyId 主键
     * @return 实例对象
     */
    @Override
    public TbClassify queryById(Integer classifyId) {
        return this.tbClassifyDao.queryById(classifyId);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit  查询条数
     * @return 对象列表
     */
    @Override
    public List<TbClassify> queryAllByLimit(int offset, int limit) {
        return this.tbClassifyDao.queryAllByLimit(offset, limit);
    }

    /**
     * @Description: 查询所有分类
     * @Param: [tbClassify]
     * @return: java.util.List<com.gqchen.entity.TbClassify>
     * @Author: GuiQingChen
     * @Date: 2021/1/30
     */
    @Override
    public List<TbClassify> queryAll(TbClassify tbClassify) {
        return this.tbClassifyDao.queryAll(tbClassify);
    }

    /**
     * 新增数据
     *
     * @param tbClassify 实例对象
     * @return 实例对象
     */
    @Override
    public int insert(TbClassify tbClassify) {

        return this.tbClassifyDao.insert(tbClassify);
    }

    /**
     * 修改数据
     *
     * @param tbClassify 实例对象
     * @return 实例对象
     */
    @Override
    public TbClassify update(TbClassify tbClassify) {
        this.tbClassifyDao.update(tbClassify);
        return this.queryById(tbClassify.getClassifyId());
    }

    /**
     * 通过主键删除数据
     *
     * @param classifyId 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer classifyId) {
        return this.tbClassifyDao.deleteById(classifyId) > 0;
    }
}