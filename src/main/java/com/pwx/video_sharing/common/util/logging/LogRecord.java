package com.pwx.video_sharing.common.util.logging;

import org.apache.log4j.Logger;

public class LogRecord {
    
    
//    private static LogRecord logRecord;
    
    //私有构造
    private LogRecord(){}
    
    /*
    //单例化
    public static LogRecord getInstance(){
        if(logRecord == null){
            logRecord = new LogRecord();
        }
        
        return logRecord;
    }*/
    
    private static Logger info = Logger.getLogger("InfoLogger");
    private static Logger error = Logger.getLogger("ErrorLogger");
    
    
    /**
     * 
         * 此方法描述的是：一般情况记录到/logs/infoLog.txt  
         * @author: Tanchao  
         * @version: 2015-5-22 上午10:15:18
     */
    public static void info(String infomation){
        info.info(infomation);
    }
    
    
    /**
     * 
         * 此方法描述的是：  错误信息记录到/logs/errorLog.txt
         * @author: Tanchao  
         * @version: 2015-5-22 上午10:15:27
     */
    public static void error(String infomation){
        error.error(infomation);
    }

}
