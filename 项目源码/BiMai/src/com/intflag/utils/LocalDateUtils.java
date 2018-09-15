package com.intflag.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class LocalDateUtils {

	/**
	 * @param args
	 */
	public static String getLocalDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(new Date());
	}
	public static String getLocalDate(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(date);
	}
	public static String getSimpleLocalDate(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(date);
	}
	public static void main(String[] args) {
		System.out.println(LocalDateUtils.getLocalDate());
	}

}
