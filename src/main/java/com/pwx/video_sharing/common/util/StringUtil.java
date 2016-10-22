package com.pwx.video_sharing.common.util;

import java.lang.reflect.Field;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

public class StringUtil {
    /**
     * 生成系统自带的UUID
     * @return
     */
    public static  String makeUUID(){
        String s = UUID.randomUUID().toString(); 
        //去掉“-”符号 
        return s.substring(0,8)+s.substring(9,13)+s.substring(14,18)+s.substring(19,23)+s.substring(24); 
    }
    /**
     * 获得length长度的随即数字码字符串
     * 
     * @param args
     */
    public static String getRandomNumCode(int length) {
        String code = "";
        for (int i = 0; i < length; i++) {
            double d = Math.random();
            int num = Double.valueOf(Math.random() * 10).intValue();
            num = num == 10 ? 0 : num;
            code += num;
        }
        return code;
    }

    /**
     * 获得当前时间
     * 
     * @return String 获得当前时间的字符串变量，如"201620030114101211"
     */
    public static String getNowNo() {
        Date d = new Date();
        String str = "";
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
        str = formatter.format(d);
        return str;
    }
	/**
	 * 生成原生xml工具类
	 * 
	 * @param arr
	 * @return
	 */
	public static String arrayToXml(Map<String, String> arr) {
		String xml = "<xml>";

		Iterator<Entry<String, String>> iter = arr.entrySet().iterator();
		while (iter.hasNext()) {
			Entry<String, String> entry = iter.next();
			String key = entry.getKey();
			String val = entry.getValue();
			// 如果值是1位数字代表不包含![CDATA[
			// if (IsNumeric(val)) {
			// xml += "<" + key + ">" + val + "</" + key + ">";
			//
			// } else{
			// xml += "<" + key + "><![CDATA[" + val + "]]></" + key + ">";
			// }

			if (key.equalsIgnoreCase("body") || key.equalsIgnoreCase("sign")
					|| key.equalsIgnoreCase("sign")) {
				xml += "<" + key + "><![CDATA[" + val + "]]></" + key + ">";

			} else {

				xml += "<" + key + "><![CDATA[" + val + "]]></" + key + ">";
			}

		}

		xml += "</xml>";
		return xml;
	}
	 /**
     * 获取一定长度的随机字符串
     * @param length 指定字符串长度
     * @return 一定长度的字符串
     */
    public static String getRandomStringByLength(int length) {
        String base = "abcdefghijklmnopqrstuvwxyz0123456789";
        Random random = new Random();
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < length; i++) {
            int number = random.nextInt(base.length());
            sb.append(base.charAt(number));
        }
        return sb.toString();
    }
    /**
	 * 获得客户端真实IP地址
	 * 
	 * @param request
	 * @return
	 */
	public static String getIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}
	/**
	 * 生成sign a.对所有传入参数按照字段名的 ASCII 码从小到大排序（字典序）后，使用 URL 键值对的 格式（即
	 * key1=value1&key2=value2…）拼接成字符串 string1，注意：值为空的参数丌参不签名； b.在 string1 最后拼接上
	 * key=Key(商户支付密钥)得到 stringSignTemp 字符串，幵对 stringSignTemp 进行 md5
	 * 运算，再将得到的字符串所有字符转换为大写，得到 sign 值 signValue。
	 * 
	 * @param payMap
	 *            支付参数
	 * @param mercKey
	 *            商户秘钥
	 */
	public static String getSign(Map<String, String> payMap, String mercKey)
			throws Exception {
		// 将a.在 string1 最后拼接上 key=paternerKey 得到 stringSignTemp
		// 字符串，幵对ringSignTemp 迚行 md5 运算，再将得到的字符串所有字符转换为大写，得到 sign 值
		String unSignParaString = formatBizQueryParaMap(payMap, false);
		// System.out.println(unSignParaString);

		// b.在 string1 最后拼接上 key=Key(商户支付密钥)得到 stringSignTemp
		// 字符串，幵对stringSignTemp 进行 md5 运算，再将得到的字符串所有字符转换为大写，得到 sign 值signValue。
		String signStr = unSignParaString + "&key=" + mercKey;
		// System.out.println(signStr);
		String sign = MD5Util.md5Encode(signStr).toUpperCase();

		return sign;
	}
	/**
	 * 生成sign方式 a.对所有传入参数按照字段名的 ASCII 码从小到大排序（字典序）后，使用 URL 键值对的 格式（即
	 * key1=value1&key2=value2…）拼接成字符串 string1，注意：值为空的参数丌参不
	 * 
	 * @return
	 * @throws SDKRuntimeException
	 */
	public static String formatBizQueryParaMap(Map<String, String> paraMap,
			boolean urlencode) {

		String buff = "";
		try {

			// a.对所有传入参数按照字段名的 ASCII 码从小到大排序（字典序）后，使用 URL
			// 键值对的格式（即key1=value1&key2=value2…）拼接成字符串 string1；
			List<Map.Entry<String, String>> infoIds = new ArrayList<Map.Entry<String, String>>(
					paraMap.entrySet());

			// 将package里面的值进行排序
			Collections.sort(infoIds,
					new Comparator<Map.Entry<String, String>>() {
						public int compare(Map.Entry<String, String> o1,
								Map.Entry<String, String> o2) {
							return (o1.getKey()).toString().compareTo(
									o2.getKey());
						}
					});

			// 将package里面的值 转换为字符串拼接起来
			for (int i = 0; i < infoIds.size(); i++) {
				Map.Entry<String, String> item = infoIds.get(i);
				// System.out.println(item.getKey());
				if (item.getKey() != "") {

					String key = item.getKey();
					String val = item.getValue();
					if (urlencode) {

						val = URLEncoder.encode(val, "utf-8");

					}
					// buff += key.toLowerCase() + "=" + val + "&";
					buff += key + "=" + val + "&";

				}
			}

			// 字符串不为空
			if (buff.isEmpty() == false) {
				// 将字符串中最后一个"&"去掉
				buff = buff.substring(0, buff.length() - 1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return buff;
	}
	
	public static Map<String, String> objectToMap(Object obj) throws Exception {    
        if(obj == null){    
            return null;    
        }   
   
        Map<String, String> map = new HashMap<String, String>();    
   
        Field[] declaredFields = obj.getClass().getDeclaredFields();    
        for (Field field : declaredFields) {    
            field.setAccessible(true);  
            map.put(field.getName(), String.valueOf(field.get(obj)));  
        }    
   
        return map;  
    }
}
