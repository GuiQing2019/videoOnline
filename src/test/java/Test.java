import com.gqchen.entity.TbSysuser;
import org.springframework.util.StringUtils;

/**
 * @program: Online
 * @description: 测试类
 * @author: GuiQingChen
 * @create: 2021-01-26 16:16
 **/
public class Test {

    @org.junit.jupiter.api.Test
    public void test01() {

        System.out.println(StringUtils.isEmpty(new TbSysuser()));
    }
}
