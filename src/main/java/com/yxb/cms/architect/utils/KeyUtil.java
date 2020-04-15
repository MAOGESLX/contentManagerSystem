
package com.yxb.cms.architect.utils;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 * 定义一些code的生成方式,生成随机数，根据每次的随机结果定义
 * @author yangxiaobing
 */
public class KeyUtil {

    static char[] seeds = {'1', '2', '3', '4', '5', '6', '7', '8', '9', '0', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i',
            'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E',
            'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};


    /**
     * 生成八位资源菜单CODE
     * @return
     */
    public static synchronized String randomResourceModeCode() {

        StringBuffer seed = new StringBuffer();
        for (int i = 0; i < 8; i++) {
            //生成一个62内的随机数
            Integer random = (int) (Math.random() * 62);
            seed.append(seeds[random]);
        }
        return seed.toString();
    }


    /**
     * 生成设备地址编码
     * yyyyMMddHHmm（时间戳 12位长度）+流水(4位长度)
     * @return
     */
    public static String getFacilityAddressCode(){
        DateFormat df = new SimpleDateFormat("yyyyMMddHHmm");
        String facilityAddressCode = df.format(new Date())+formatFixedLengthSeq(4,new Random().nextInt(1000000));
        return facilityAddressCode;
    }

    /** 
    * @Description: 生成软件类型编码
    * @Param: [] 
    * @return: java.lang.String 
    * @Author: wt
    * @Date: 2018/11/22 0022 
    */ 
    public static String getVendorCode(){

        String facilityAddressCode ="SO"+formatFixedLengthSeq(4,new Random().nextInt(1000000));
        return facilityAddressCode;
    }



    private static String formatFixedLengthSeq(int size, long seq) {
        int length = String.valueOf(seq).length();
        int subSeq;
        if(length >= size) {
            subSeq = Integer.parseInt(String.valueOf(seq).substring(length-size, length));
        }else {
            subSeq = Integer.parseInt(String.valueOf(seq));
        }
        return String.format("%0"+size+"d", subSeq);
    }



    public static void main(String[] args) {
        System.out.println(KeyUtil.getFacilityAddressCode());
    }
}
