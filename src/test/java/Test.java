/**
 * @program: Online
 * @description: 测试类
 * @author: GuiQingChen
 * @create: 2021-01-26 16:16
 **/
public class Test {

    @org.junit.jupiter.api.Test
    public void test01() {
        String ymx = "ymx";
        int num=0;

        Thread th = new Thread(new Runnable() {
            @Override
            public void run() {
                for (int i = 0; i < 20; i++) {
                    fuck(ymx,i);
                }
            }
        });


            th.start();

    }
    public void fuck(String str,int num) {
        System.out.println(str+" 正在遭受第"+ num +"次冲击!");
    }
}
