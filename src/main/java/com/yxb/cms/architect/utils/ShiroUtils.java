package com.yxb.cms.architect.utils;

import com.yxb.cms.architect.constant.Constants;
import org.apache.commons.codec.Charsets;
import org.apache.commons.codec.binary.Hex;
import org.apache.commons.codec.digest.HmacAlgorithms;
import org.apache.commons.codec.digest.HmacUtils;

public class ShiroUtils {



    /**
     * 获取加密后的密码
     *
     * @return
     */
    public static String encryptPassword(String password,String userAccount) {
        String salt = userAccount+Constants.SALT;
        HmacUtils hmacUtils = new HmacUtils(HmacAlgorithms.HMAC_SHA_1, salt.getBytes(Charsets.UTF_8));
        return Hex.encodeHexString(hmacUtils.hmac(password.getBytes(Charsets.UTF_8)), false);
    }


    public static void main(String[] args) {

        System.out.println(ShiroUtils.encryptPassword("123456","admin"));


    }

}