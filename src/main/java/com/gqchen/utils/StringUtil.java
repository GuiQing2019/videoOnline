package com.gqchen.utils;

/**
 * @program: Online
 * @description: 工具类
 * @author: GuiQingChen
 * @create: 2021-02-03 16:46
 **/
public class StringUtil {
    /**
     * 判定字符串是否不为空
     *
     * @param instr 需判定的字符串
     * @return 不为空返回true，为空返回false
     */
    public static boolean isNotNull(String instr) {
        return !isNull(instr);
    }

    /**
     * 判定字符串是否为空
     *
     * @param instr 需判定的字符串
     * @return 为空返回true，不为空返回false
     */
    public static boolean isNull(String instr) {
        if (instr == null || instr.equals("")) {
            return true;
        }
        return false;
    }
}
