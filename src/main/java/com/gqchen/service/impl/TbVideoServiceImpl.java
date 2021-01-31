package com.gqchen.service.impl;

import com.gqchen.entity.TbVideo;
import com.gqchen.dao.TbVideoDao;
import com.gqchen.service.TbVideoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (TbVideo)表服务实现类
 *
 * @author makejava
 * @since 2021-01-30 22:27:39
 */
@Service("tbVideoService")
public class TbVideoServiceImpl implements TbVideoService {
    @Resource
    private TbVideoDao tbVideoDao;

    /**
     * 通过ID查询单条数据
     *
     * @param videoId 主键
     * @return 实例对象
     */
    @Override
    public TbVideo queryById(Integer videoId) {
        return this.tbVideoDao.queryById(videoId);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit  查询条数
     * @return 对象列表
     */
    @Override
    public List<TbVideo> queryAllByLimit(int offset, int limit) {
        return this.tbVideoDao.queryAllByLimit(offset, limit);
    }

    /**
    * @Description: 查询所有数据
    * @Param: [video]
    * @return: java.util.List<com.gqchen.entity.TbVideo>
    * @Author: GuiQingChen
    * @Date: 2021/1/30
     */
    @Override
    public List<TbVideo> queryAll(TbVideo video) {
        return this.tbVideoDao.queryAll(video);
    }

    /**
     * 新增数据
     *
     * @param tbVideo 实例对象
     * @return 实例对象
     */
    @Override
    public TbVideo insert(TbVideo tbVideo) {
        this.tbVideoDao.insert(tbVideo);
        return tbVideo;
    }

    /**
     * 修改数据
     *
     * @param tbVideo 实例对象
     * @return 实例对象
     */
    @Override
    public TbVideo update(TbVideo tbVideo) {
        this.tbVideoDao.update(tbVideo);
        return this.queryById(tbVideo.getVideoId());
    }

    /**
     * 通过主键删除数据
     *
     * @param videoId 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer videoId) {
        return this.tbVideoDao.deleteById(videoId) > 0;
    }
}