package com.pwx.video_sharing.common.dic;
/*package com.zhlt.shy.common.dic;

import java.io.IOException;
import java.util.List;

import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import com.zhlt.shy.dictionary.DicSingle;
import com.zhlt.shy.dictionary.entity.DataDictionary;

public class DictKey2Value extends TagSupport {

    *//**
     * 
     *//*
    private static final long serialVersionUID = 1L;
    
    // 数据字典
    public static DicSingle dic = DicSingle.getInstance(); 

    private Long key;

    private String nodeKey;

    public int doStartTag() throws JspTagException {
        return EVAL_PAGE;
    }

    public int doEndTag() throws JspTagException {
        try {
            JspWriter out = this.pageContext.getOut();
            out.print(dictName().toString());
        } catch (IOException e) {
            e.printStackTrace(); 
        }
        return EVAL_PAGE;
    }
    
    public StringBuffer dictName() {
        StringBuffer sb = new StringBuffer();
        
        Map map = null;//CacheDict.dictMap.get(this.getNodeKey());
        if(map == null) 
            sb.append("未发现NodeKey");
        else{
            if(map.get(key)!=null)   
              sb.append( map.get(key));
        }
        return sb;
    }
    
    public StringBuffer dictName() {
        StringBuffer sb = new StringBuffer();
        
        
        System.out.println(converDic("city", key.toString()));
        Map<String, List<DataDictionary>> map = DicSingle.getMap();
        if(map == null) 
            sb.append("未发现NodeKey");
        else{
            System.out.println("######"+DicSingle.getObject(key));
            if(map.get(key)!=null)
              sb.append(map.get(key));
        }
        return sb;
    }
    
    
    
    public static String converDic(Object value, String dicKey, String... strings)
    {
        final List<DataDictionary> list = dic.get(dicKey); //数据字典.
        String defaultValue = "";
        if (strings.length == 1)
        {
            defaultValue = strings[0];
        }

        if (!list.isEmpty())
        {
            int listCount = list.size();
            for (int i = 0; i < listCount; i++)
            {
                DataDictionary dictionary = list.get(i);
                if (dictionary.getRealvalue().equals(value.toString()))
                {
                    return dictionary.getText();
                }
            }
        }
        return defaultValue;
    }
    
    
    public Long getKey() {
        return key;
    }

    
    public void setKey(Long key) {
        this.key = key;
    }

    
    public String getNodeKey() {
        return nodeKey;
    }

    
    public void setNodeKey(String nodeKey) {
        this.nodeKey = nodeKey;
    }
}
*/