/*!
 * myPagination Jquery Pagination Plug-in Library v7.0
 * 
 * http://linapex.blog.163.com/
 *
 * Date: 2013年7月3日 11:09:44
 */
(function($) {
		
        $.fn.myPagination = function(param) {
          return init(param,$(this));
        };
		
		// param 代表所有参数
		// init 方法 采用闭包概念
		function init(param,obj){
			
			//默认配置
			var defaults = {
              currPage: 1,
              pageCount: 10,
              pageNumber: 5,
			  pageSize:10,
			  dataTotal:1,
              cssStyle: 'badoo',
			  debug:false,
              ajax: {
                on: false,
				type : "POST",
                pageCountId: 'pageCount',
				url: "jsonTest.php",
                dataType: 'json',
                param: false,
				onClick:function(){
					return false;
				},
                ajaxStart: function() {
                  return false;
                },
				ajaxStop: function() {
                  return false;
                },
				ajaxError:function(){
					alert("访问服务器超时，请重试！");
					return false;
				},
				callback: function (data){
					return false;
				}
              },
              panel: {
                first: '首页',
                last: '尾页',
                next: '下一页',
                prev: '上一页',
                first_on: true,
                last_on: true,
                next_on: true,
                prev_on: true,
                links: '#',
                tipInfo_on: false,
                tipInfo: '<span>&nbsp;&nbsp;跳{currText}/{sumPage}页</span>',
                tipInfo_css: {
                  width: '22px'
                },
				tipSelect_on:false,
				tipSelect:'&nbsp;&nbsp;选择到{select}页'
              },
			  detailPanel:{
				  left:"1%",
				  dataTotalInfo_on:false,
				  currPageInfo_on:false,
				  selectPageSizeInfo_on:false,
				  dataTotalInfo:'&nbsp;&nbsp;共{dataTotal}条',
				  currPageInfo:'&nbsp;&nbsp;第<span style="color:red;;font-weight:bold;">{currPage}</span>/{pageCount}页',
				  selectPageSizeInfo:'&nbsp;&nbsp;{selectPageSize}条/页&nbsp;&nbsp;',
				  selectPageSizeArr:[10,15,20,25,30,35,40,45,50]
			  }
            };
						
			//得到参数
			function getParam() {
				var param = "page="+opts.currPage;	//默认发送
				param += "&pageSize=" + opts.pageSize;	//追加pageSize
				if (opts.ajax.param) {
					param += "&" + opts.ajax.param;
				}
				return param;
            }
			
			//得到左侧边距
			function getLeft(){
				var result = "";
				var toString=Object.prototype.toString;
				var type = toString.call(opts.detailPanel.left);
				if(type.indexOf("String") != -1){
					result = opts.detailPanel.left;
					if(result.indexOf("%") == -1){
						result += "%";
					}
				}else if(type.indexOf("Number") != -1){
					result = opts.detailPanel.left + "px";
				}
				return result;
			}
			
			//得到面板提示信息
			function getPanelTipInfo() {
				var str = "";
				if(opts.panel.tipInfo_on){
					var tipInfo = opts.panel.tipInfo;	//初始化文本.
					//如果input不为空，则生成输入框.
					if(tipInfo.indexOf("{input}") != -1){
						var input = "<input type='text' value='"+opts.currPage+"' id='"+opts.id+"InputText' />";
						
						//info内容 <span>&nbsp;&nbsp;跳{currText}/{sumPage}页</span>
						tipInfo = tipInfo.replace("{input}", input);
						tipInfo = tipInfo.replace("{sumPage}", opts.pageCount);
						
						var spanObj = document.createElement("span");//创建一个span容器
						spanObj = $(spanObj);//转换为jqeury对象
						spanObj.html(tipInfo);
				
						//调用样式.及赋值，但此处不能绑定事件.
						input = spanObj.children(":text:first");
						input.css(opts.panel.tipInfo_css);

						opts.inputTextId = input.attr("id");	//全局共享此input对象
						
						str += spanObj.outerHTML();
					}
				}
				if(opts.panel.tipSelect_on){
					//生成select框.
					var tipInfo = opts.panel.tipSelect;
					if(tipInfo.indexOf("{select}") != -1){
						var selectObj = document.createElement("select");
						for(var i = 1;i<=parseInt(opts.pageCount);i++){
							var option = new Option(i,i);
							selectObj.options.add(option);
						}
						spanObj.html("");	//清空原内容.
						//内容处理.
						var varLeft = tipInfo.substr(0,tipInfo.indexOf("{select}"));
						var varRight = tipInfo.substr(tipInfo.indexOf("{select}")+"{select}".length).replace("{sumPage}", opts.pageCount);
						spanObj.append(varLeft);
						spanObj.append(selectObj);
						spanObj.append(varRight);
						
						opts.selectId = opts.id+"Select";	//全局共享此select对象
						
						str += spanObj.outerHTML();
					}
				}
				//alert(str);
				return str;
			}
			
			//得到面板提示信息
			function getDetailPanelInfo() {
				var str = "";
				//str += '<div style="position: absolute;left:3px;"> 共&nbsp;100&nbsp;条&nbsp;&nbsp; 第&nbsp;<span style="color:red;font-weight:bold;">1</span>/2&nbsp;页&nbsp;&nbsp; <select><option>10</option><option>15</option></select>条/页 </div>';
				str += '<div style="position: absolute;left:'+getLeft()+';">';
				if(opts.detailPanel.dataTotalInfo_on){
					var tipInfo = opts.detailPanel.dataTotalInfo;
					if(tipInfo.indexOf("{dataTotal}") != -1){
						tipInfo =tipInfo.replace("{dataTotal}",opts.dataTotal);
						
						str += tipInfo;
					}
				}
				if(opts.detailPanel.currPageInfo_on){
					var tipInfo = opts.detailPanel.currPageInfo;
					if(tipInfo.indexOf("{currPage}") != -1 && tipInfo.indexOf("{pageCount}") != -1){
						tipInfo = tipInfo.replace("{currPage}",opts.currPage).replace("{pageCount}",opts.pageCount);
						str += tipInfo;
					}
				}
				if(opts.detailPanel.selectPageSizeInfo_on){
					//生成select框.
					var tipInfo = opts.detailPanel.selectPageSizeInfo;
					if(tipInfo.indexOf("{selectPageSize}") != -1){
						var selectObj = document.createElement("select");
						var pageSizeArr = opts.detailPanel.selectPageSizeArr;
						var pageSizeArrCount = pageSizeArr.length -1 ;
						for(var i = 0;i<=pageSizeArrCount;i++){
							var option = new Option(pageSizeArr[i],pageSizeArr[i]);
							selectObj.options.add(option);
						}
						//调用js的outerHTML.
						tipInfo = tipInfo.replace("{selectPageSize}", selectObj.outerHTML);
						
						str += tipInfo;
					}
				}
				str += '</div>';
				//alert(str);
				return str;
			}
			
			//开始请求
			function onRequest(){
				debug(opts.id);
				debug("ajax请求参数列表:");
				debug(getParam());
				if(opts.ajax.on){
					//开启了ajax请求有效
					opts.ajax.ajaxStart();
					$.ajax({
					  url: opts.ajax.url,
					  // 请求Url地址
					  type: opts.ajax.type,
					  // 提交数据方式
					  data: getParam(),
					  // 参数
					  contentType: "application/x-www-form-urlencoded;charset=UTF-8",
					  // 发送信息给服务器编码类型
					  async: true,
					  // 异步
					  cache: false,
					  // 不缓存
					  timeout: 30000,
					  // 超时时间
					  error: function() {
						opts.ajax.ajaxError();
					  },
					  success: function(data) {
						opts.ajax.ajaxStop();	//调用stop事件.
						responseHandle(data);
						createPageBar();
					  }
					});
				}else{
					//var data = {t:1,q:2,pageCount:20};
					//opts.dataType = "json";
					//responseHandle(data);
					//var data = "<div id='d1'><span id='s1'>s</span><input type='hidden' id='pageCount' name='aas' value='20' /></div>";
					//opts.ajax.dataType = "html";
					
					//var data = '<?xml version="1.0" encoding="utf-8" ?> <books> <book title="藏地密码" imageurl="images/Tibet_Code.jpg"> <description> 这里是概况(www.jb51.net) </description> </book> <book title="剑桥雅思6"                          imageurl="images/ielts.jpg"> <description>                              这里是概况(www.jb51.net) </description> </book> <book title="Professional ASP.NET"                              imageurl="images/asp.jpg"> <description>                                这里是概况(www.jb51.net) </description> </book>                                 <pageCount>20</pageCount></books>';
					//opts.ajax.dataType = "xml";
					createPageBar();
				}
			}
			
			//返回处理
			function responseHandle(data){
				var pageCountId = opts.ajax.pageCountId;
				var resultPageCount = 1;	//设置为1
				var resultDataTotal = 1;	//默认为1
				switch ((opts.ajax.dataType) ) {
                case "json":
					try{
						data = eval("(" + data + ")"); // 转换为对象
					}catch(err){
						//debug("json返回数据解析错误，使用默认的pageCount=1");
					}finally{
						resultPageCount = eval("data." + pageCountId);
						if(opts.detailPanel.dataTotalInfo_on){
							resultDataTotal = data.dataTotal;
						}
					}
                  break;
                case "xml":
				  try{
					  resultPageCount = $(data).find(pageCountId).text();
					  if(opts.detailPanel.dataTotalInfo_on){
						resultDataTotal = $(data).find("dataTotal").text();
					  }
				  }catch(e){
					  debug("xml返回数据解析错误，使用默认的pageCount=1");
				  }
                  break;
                default:
				  try{
					  resultPageCount = $(data).find(":hidden[id='"+pageCountId+"']").val();
					  if(opts.detailPanel.dataTotalInfo_on){
						resultDataTotal = $(data).find(":hidden[id='dataTotal']").val();
					  }
				  }catch(e){
					  debug("html返回数据解析错误，使用默认的pageCount=1");
				  }
                  break;
                }
				//如果 resultPageCount 不能得到，则赋值为默认.
				if(!resultPageCount){
					resultPageCount = 1;
				}
				
				//如果开启了总数据条数显示
				if(opts.detailPanel.dataTotalInfo_on){
					//如果 resultDataTotal 不能得到，则赋值为默认.
					if(resultDataTotal &&  resultDataTotal == 0){
						resultDataTotal = 0;
					}else if(!resultDataTotal){
						resultDataTotal = 0;
					}
				}
								
				debug(opts.id);
				debug("返回总页数:"+resultPageCount);
				debug("返回数据总长度:"+resultDataTotal);
				opts.pageCount = resultPageCount;
				opts.dataTotal = resultDataTotal;
				opts.ajax.callback(data);
			}
			
			
			
			 // 得到页码操作

            function createPageBar() {
			  var links = opts.panel.links;
			  //opts.currPage = opts.currPage > opts.pageCount ? opts.pageCount : opts.currPage;
			  var currPage = opts.currPage ? opts.currPage : 1;	
			  var pageCount = parseInt(opts.pageCount);
			  var tempPage = parseInt (opts.pageNumber / 2);
			  var pageNumber = opts.pageNumber;
			  
			  var str = "";
			  
			  str += getDetailPanelInfo();
			 
			  //首页
              if (opts.panel.first_on) {
				str += "<a href='" + links + "' paged='1'>" + opts.panel.first + "</a>";
              }
			  
			  // 上一页
			  if (opts.panel.prev_on) {
				  if (currPage == 1) {
					str += "<span class=\"disabled\" paged=\"" + opts.panel.prev + "\">" + opts.panel.prev + " </span>";
				  }
			else {
					str += "<a href='" + links + "' paged='" + (currPage - 1) + "'>" + opts.panel.prev + " </a>";
				  }
			  }
			  
			  // 开始页和最后页			  
              var firstPage = lastPage = 1;
              // 当前页 - 中间数 > 0，则开始页 = 当前页 - 中间数，否则 开始页 = 1
			  firstPage = currPage - tempPage > 0 ? firstPage = currPage - tempPage : 1;
			  
              // 开始页 + 显示页数 > 总页数，则 最后页 = 最后页 +1，开始页 = 最后页 - 显示页，否则 最后页 = 开始页 +
              // 显示页
              if (firstPage + pageNumber > pageCount) {
                lastPage = pageCount + 1;
                firstPage = lastPage - pageNumber;
              }
              else {
                lastPage = firstPage + pageNumber;
              }
			  
			  //防止开始页数低于1
              if (firstPage <= 0) {
                firstPage = 1;
              }
			  
              // 生成链接
			  // 这里的 firstPage 需要看成是 currPage ，每一页都是当前页，生成链接。
              for (firstPage; firstPage < lastPage; firstPage++) {
                if (firstPage == currPage ) {	//此处做两次判断,用于兼容 当前页为为1.总页数为1的情况.
                  str += "<span class=\"current\" paged=\"" + firstPage + "\">" + firstPage + "</span>";;
                }
                else {
                  str += "<a href='" + links + "' paged='" + firstPage + "'>" + firstPage + "</a>";
                }
              }
			  
			  //下一页
			  if(opts.panel.next_on){
				  if (currPage == pageCount) {
					str += "<span class=\"disabled\" paged=\"" + opts.panel.next + "\">" + opts.panel.next + " </span>";
				  }
				  else {
					str += "<a href='" + links + "' paged='" + (currPage + 1) + "'>" + opts.panel.next + " </a>";
				  }
			  }
			  
			  //尾页
			  if(opts.panel.last_on){
				    str += "<a href='" + links + "' paged='" + pageCount + "'>" + opts.panel.last + "</a>";
			  }
			  
			  str += getPanelTipInfo();
			  obj.html(str);
			  
			  
			  debug("opts.id:"+opts.id);
			  debug("opts.inputTextId:"+opts.inputTextId);
			  debug("最终生成菜单：");
			  debug(str);
			  
			  //select初始化赋值.
			  obj.children("div").children("select:first").val(opts.pageSize);
			  obj.children("div").children("select:first").change(function(){
				 var pageSize = $(this).val();
				 opts.pageSize = pageSize;
                 onRequest();	//发送请求
			  });
			  
			  //select初始化赋值.
			  obj.children("span").children("select:first").val(opts.currPage);
			  //找到select.
			  obj.children("span").children("select:first").change(function(){
				 var page  = parseInt($(this).children('option:selected').val());
				 opts.currPage = page;
                 onRequest();	//发送请求
			  });
			  
			  //找到输入文本框.判断输入字符是否通过验证.
			  //限制输入可以为空，可以为数字.
			  obj.children("span").children(":text:first").keyup(function() {
				  var obj = $(this);
				  var varValue = $.trim($(this).val());
				  if(varValue.length == 0){
					  return ;
				  }
				  var patrn =  /^\+?[0-9][0-9]*$/ ;
				  if (!patrn.exec(varValue)) {
					   obj.val(1);
				  }
				});
			  
			  //文本框增加事件
              obj.children("span").children(":text:first").keypress(function(event) {
                var keycode = event.which;
                if (keycode == 13) {
                  var page = $.trim($(this).val());
                    //回车事件时，去除其他 a 标签的 click 事件
                    obj.children("a").unbind("click"); // 去除 所有 a 标签 click
                    //再次绑定所有a标签 click 事件
                    obj.children("a").each(function() {
                      $(this).click(function() {
                        return false;
                      });
                    });
					//如果转换异常，则默认赋值为1.
					try{
						page = parseInt(page);
					}catch(err){
						page = 1;
					}finally{
						opts.currPage = page;
                        onRequest();	//发送请求
					}
                }
              });
			  
			  // 增加事件
              obj.children("a").each(function(index,element) {
                //给与每个a 标签 增加 单击事件
				var obj = $(this);
                obj.click(function() {
				  //得到当前页数，以 paged 属性为容器存放
                  var page = parseInt(obj.attr("paged"));
				  page = page > 0 ? page : 1;
                  //单击某一个 a  标签时，去除其他 a 标签的 click 事件
                  obj.children("a").unbind("click"); // 去除 所有 a 标签 click
                  //再次绑定click 点击无效事件
                  obj.children("a").each(function() {
                    $(this).click(function() {
                      return false;
                    });
                  });
				  opts.currPage = page;
				  opts.ajax.onClick(page);
                  onRequest();	//发送请求
                  $(this).focus();
                  return false;
                }); // click
				
              });
            }
			
			//debug 调试
			function debug(str){
				if(opts.debug){
					$.fn.debug(str);
				}
			}
			
		 	//目标对象拥有了所有源对象所拥有的特性，可理解为继承
		  	// true 为深度拷贝，将子对象进行合并
			var opts = $.extend(true,defaults, param);

			opts.id = obj.attr("id");	//得到id
			
			 // 添加样式
            obj.addClass(opts.cssStyle);
			//开始请求
			onRequest();
			
			
			var method = {};	//方法
			
			method.id = opts.id;	//得到id
			
			//得到页数.
			method.getPage = function(){
				  return opts.currPage;
			  }
			  
			  //重新请求
			  method.onReload = function(){
				  debug("reload()");
				  onRequest();
			  }
			  
			  //指定加载数据
			  method.onLoad = function(param){
				  if(param){
					  debug(param);
					  opts.currPage = 1;
					  opts.ajax.param = param;
					  onRequest();
				  }
			  }
			  
			  //跳转指定页面
			  method.jumpPage = function(page){
				  debug("jumpPage("+page+")");
				  page = page < 1 ? 1 : page;	//如果page小于1，就为1
				  page = page > opts.pageCount ? opts.pageCount : page;	//如果page大于pageCount则为pageCount
				  opts.currPage = page;
				  onRequest();
			  }
			
			return method;
		}
		
		$.fn.debug = function(str){
			if(window.console && window.console.log){
				console.log(str);
			}
		}
			
      })(jQuery);