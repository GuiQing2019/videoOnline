package com.gqchen.service.impl;

import com.gqchen.entity.TbVideoapprover;
import com.gqchen.dao.TbVideoapproverDao;
import com.gqchen.service.TbVideoapproverService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (TbVideoapprover)表服务实现类
 *
 * @author makejava
 * @since 2021-01-31 00:37:49
 */
@Service("tbVideoapproverService")
public class TbVideoapproverServiceImpl implements TbVideoapproverService {
    @Resource
    private TbVideoapproverDao tbVideoapproverDao;

    /**
     * 通过ID查询单条数据
     *
     * @param videoapproverId 主键
     * @return 实例对象
     */
    @Override
    public TbVideoapprover queryById(Integer videoapproverId) {
        return this.tbVideoapproverDao.queryById(videoapproverId);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<TbVideoapprover> queryAllByLimit(int offset, int limit) {
        return this.tbVideoapproverDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param tbVideoapprover 实例对象
     * @return 实例对象
     */
    @Override
    public TbVideoapprover insert(TbVideoapprover tbVideoapprover) {
        this.tbVideoapproverDao.insert(tbVideoapprover);
        return tbVideoapprover;
    }

    /**
     * 修改数据
     *
     * @param tbVideoapprover 实例对象
     * @return 实例对象
     */
    @Override
    public TbVideoapprover update(TbVideoapprover tbVideoapprover) {
        this.tbVideoapproverDao.update(tbVideoapprover);
        return this.queryById(tbVideoapprover.getVideoapproverId());
    }

    /**
     * 通过主键删除数据
     *
     * @param videoapproverId 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer videoapproverId) {
        return this.tbVideoapproverDao.deleteById(videoapproverId) > 0;
    }
}