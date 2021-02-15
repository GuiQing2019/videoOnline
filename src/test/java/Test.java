import com.gqchen.entity.TbSysuser;
import com.gqchen.entity.TbUserAndVideo;
import com.gqchen.entity.TbVideo;
import com.gqchen.service.TbVideoService;
import org.springframework.util.StringUtils;

import java.util.List;

/**
 * @program: Online
 * @description: 测试类
 * @author: GuiQingChen
 * @create: 2021-01-26 16:16
 **/
public class Test {

    private TbVideoService service;
    @org.junit.jupiter.api.Test
    public void test01() {

        List<TbVideo> tbVideos = service.queryAll(new TbVideo());
        for (TbVideo tbVideo : tbVideos) {
            System.out.println(tbVideo.toString());
        }
       /* List<TbUserAndVideo> tbUserAndVideos = service.queryAllVideoAndUserName();
        for (TbUserAndVideo tbUserAndVideo : tbUserAndVideos) {
            System.out.println(tbUserAndVideo.toString());
        }*/

    }
}
