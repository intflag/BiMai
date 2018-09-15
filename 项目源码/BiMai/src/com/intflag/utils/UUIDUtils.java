package com.intflag.utils;

import java.util.UUID;

public class UUIDUtils {
	/**
	 * 随机生成id
	 * @return
	 */
	public static String getId(){
		return UUID.randomUUID().toString().replace("-", "").toUpperCase();
	}
	
	/**
	 * 生成随机码
	 * @return
	 */
	public static String getEmailActiveCode(){
		return getId().substring(3, 9);
	}
	
	public static void main(String[] args) {
		System.out.println(UUIDUtils.getEmailActiveCode());
	}
}
