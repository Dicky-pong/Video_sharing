//　声明一个验证用的对象;统一验证方式;
var formReg={
  mobileReg:function(number){   //手机号码：  13,15,17,18,19,14开关的十一位数字;
    var reg=/^1[3|5|7|8|9|4]\d{9}$/;
//    console.log(reg.test(number));
    return(reg.test(number));
  },
  emailReg:function(s){   //　邮箱验证:　　字母或数字开头,可包含横线，下划线和小数点
    var reg=/^(\w-*\_*\.*)+@(\w-?)+(\.\w{2,})+$/;
//    console.log(reg.test(s));
    return(reg.test(s));
  },
//姓名验证：　只能为中文，数字和英文字母;
  namesReg:function(s){
    var reg=/^(\w*[\u4e00-\u9fa5]*)$/;
//    console.log(reg.test(s));
    return(reg.test(s));
  },
  compareReg:function(s,s1){  //判断两个值是否相等
//	  console.log(s===s1);
	  return(s===s1);
  },  
  //判断金额
  amountReg:function(amount){
	  var reg = /^(([0-9]|([1-9][0-9]{0,9}))((\.[0-9]{1,2})?))$/;
	  //console.log(reg.test(amount));
	  return(reg.test(amount));  
  },
  //正整数
  numberReg:function(number){   
	  var reg= /^[0-9]*[1-9][0-9]*$/;
//	  console.log(reg.test(number));
	  return(reg.test(number));
  },
  //中文名字
  chineseReg:function(str){    
	  var reg = /[\u4E00-\u9FA5\uF900-\uFA2D]/; 
	  return reg.test(str);
  },
  
  //英文名字
  englishReg:function(str){    
	  var reg = /^[a-zA-Z]+$/; 
	  return reg.test(str);
  }
}
