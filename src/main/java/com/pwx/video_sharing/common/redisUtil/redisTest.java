package com.pwx.video_sharing.common.redisUtil;

import java.util.HashMap;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;


public class redisTest {

    RedisUtil redis = new RedisUtil("120.25.249.190", 6379);
    
    public static void main1(String[] args) {
        
        /*RedisUtil redis = new RedisUtil("120.24.241.164", 6379);
        
        String str = redis.hget("HB_BASEINFO", "8a2aacf851d1c2190151d1c80ce80004");
        
        RedWallet red = JsonUtil.parseObject(str, RedWallet.class);
        red.setState("0");
        
        redis.hset("HB_BASEINFO", "8a2aacf851d1c2190151d1c80ce80004", JsonUtil.toJSONString(red));
        
        String str1 = redis.hget("HB_BASEINFO", "8a2aacf851d1c2190151d1c80ce80004");
        RedWallet red1 = JsonUtil.parseObject(str1, RedWallet.class);
        System.out.println(red1);*/
        
    }
    
    public static void main(String[] args) {
        RedisUtil redis = new RedisUtil("120.25.249.190", 6379);
        
        Map<String, Object> map = new HashMap<String, Object>();
//        map.put("1", "aaa");
//        map.put("time", new Date());
//        redis.set("token", JsonUtil.toJSONString(map));
        
        map = JSONObject.parseObject(redis.get("token"));
        
        System.out.println("############:"+map.get("time"));
    }
    
}
