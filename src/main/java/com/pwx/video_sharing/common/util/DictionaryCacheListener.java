package com.pwx.video_sharing.common.util;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.pwx.video_sharing.dictionary.DicSingle;
import com.pwx.video_sharing.dictionary.service.IDicService;
import com.pwx.video_sharing.dictionary.service.impl.DicServiceImpl;

/*@Service
public class DictionaryCacheListener implements ApplicationListener<ContextRefreshedEvent>{

    
    private DicSingle dicSingle;
    
    @Override
    public void onApplicationEvent(ContextRefreshedEvent event) {

        System.out.println("++++++++++++++++++　　加载数据字典　　+++++++++++++++++++++");

        if(event.getApplicationContext().getParent() == null){
            
            WebApplicationContext webApplicationContext = WebApplicationContextUtils.getWebApplicationContext(event.getApplicationContext().getBean("dicService"));
         // 调用数据字典Manager的一个方法来缓存
            dicSingle.getInstance();
            
        }
        
    }
    
}*/
public class DictionaryCacheListener implements ServletContextListener  {

    
    private DicSingle dicSingle;

    /*@Override
    public void setServletContext(ServletContext servletContext) {
        
        WebApplicationContext webApplicationContext = WebApplicationContextUtils.getWebApplicationContext(servletContext.gets);
        
        System.out.println("setServletContext########"+dicSingle);
        
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        
        System.out.println("afterPropertiesSet########"+dicSingle);
        
    }*/

    
    @Override
    public void contextDestroyed(ServletContextEvent arg0) {        
    }
    @Override
    public void contextInitialized(ServletContextEvent arg0) {
        WebApplicationContext webApplicationContext = WebApplicationContextUtils.getWebApplicationContext(arg0.getServletContext());
        IDicService dicService = (DicServiceImpl)webApplicationContext.getBean("dicService");
        try {
            // 调用数据字典Manager的一个方法来缓存
            new DicSingle(dicService);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }   
        
    }

}