package com.gqchen.service.impl;

import com.gqchen.entity.TbMessage;
import com.gqchen.dao.TbMessageDao;
import com.gqchen.service.TbMessageService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (TbMessage)表服务实现类
 *
 * @author makejava
 * @since 2021-02-23 20:48:17
 */
@Service("tbMessageService")
public class TbMessageServiceImpl implements TbMessageService {
    @Resource
    private TbMessageDao tbMessageDao;

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public TbMessage queryById(Integer id) {
        return this.tbMessageDao.queryById(id);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<TbMessage> queryAllByLimit(int offset, int limit) {
        return this.tbMessageDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param tbMessage 实例对象
     * @return 实例对象
     */
    @Override
    public TbMessage insert(TbMessage tbMessage) {
        this.tbMessageDao.insert(tbMessage);
        return tbMessage;
    }

    /**
     * 修改数据
     *
     * @param tbMessage 实例对象
     * @return 实例对象
     */
    @Override
    public TbMessage update(TbMessage tbMessage) {
        this.tbMessageDao.update(tbMessage);
        return this.queryById(tbMessage.getId());
    }

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer id) {
        return this.tbMessageDao.deleteById(id) > 0;
    }
}