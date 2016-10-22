
package com.pwx.video_sharing.main.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pwx.video_sharing.dictionary.DicSingle;



@Controller
@RequestMapping("/main")
public class MainController {

    
    //数据字典
    public static DicSingle dic = DicSingle.getInstance();
    
    
    @RequestMapping("/index")
    public ModelAndView toMain(HttpServletRequest request){
        
        
        return new ModelAndView("main");
        
    }
    
}
