/*
*���:ͼƬ�ϴ�����Ԥ����� v1.1
*����:����
*ʱ��:2013��11��26��
*����:����JQUERY��չ,ͼƬ�ϴ�Ԥ����� Ŀǰ���������(IE �ȸ� ���) ��֧��safari
*�����վ:http://keleyi.com/keleyi/phtml/image/16.htm
*����˵��: Img:ͼƬID;Width:Ԥ�����;Height:Ԥ���߶�;ImgType:֧���ļ�����;Callback:ѡ���ļ���ʾͼƬ��ص�����;
*ʹ�÷���: 
<div>
<img id="ImgPr" width="120" height="120" /></div>
<input type="file" id="up" />
����Ҫ����Ԥ����IMG��ǩ�� ��һ��DIV Ȼ����ϴ��ؼ�ID����uploadPreview�¼�
$("#up").uploadPreview({ Img: "ImgPr", Width: 120, Height: 120, ImgType: ["gif", "jpeg", "jpg", "bmp", "png"], Callback: function () { }});
*/
jQuery.fn.extend({
    uploadPreview: function (opts) {
        var _self = this,
            _this = $(this);
        opts = jQuery.extend({
            Img: "savedImg",
            Width: 300,
            Height: 200,
            ImgType: ["jpeg", "jpg", "bmp", "png"],
            Callback: function () {}
        }, opts || {});
        _self.getObjectURL = function (file) {
            var url = null;
            if (window.createObjectURL != undefined) {
                url = window.createObjectURL(file)
            } else if (window.URL != undefined) {
                url = window.URL.createObjectURL(file)
            } else if (window.webkitURL != undefined) {
                url = window.webkitURL.createObjectURL(file)
            }
            return url
        };
        _this.change(function () {
        	var f = document.getElementById(this.id).files;
        	var fileSize = 0;
        	if(f!=null){
        		if(typeof(f[0]) != "undefined"){
        			fileSize = Math.round(f[0].size*100/(1024 * 1024))/100;
        		}
        	}
        	
        	if(parseFloat(fileSize)>parseFloat(11.0)){
        		var $file = $("#"+this.id);
        		$file.after($file.clone().val(""));
        		$file.remove();
        		alertErrors("图片大小不能超过2M",2000);
        	}else{
        		if (this.value) {
                    if (!RegExp("\.(" + opts.ImgType.join("|") + ")$", "i").test(this.value.toLowerCase())) {
                        alert("选择文件错误,图片类型必须是" + opts.ImgType.join("，") + "中的一种");
                        this.value = "";
                        return false
                    }
                    if ($.browser.msie) {
                        try {
                            $("#" + opts.Img).attr('src', _self.getObjectURL(this.files[0]));
                        } catch (e) {
                            var src = "";
                            var obj = $("#" + opts.Img);
                            var div = obj.parent("div")[0];
                            _self.select();
                            if (top != self) {
                                window.parent.document.body.focus()
                            } else {
                                _self.blur()
                            }
                            src = document.selection.createRange().text;
                            document.selection.empty();
                            obj.hide();
                            obj.parent("div").css({
                                'filter': 'progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)',
                                'width': opts.Width + 'px',
                                'height': opts.Height + 'px'
                            });
                            
                            div.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = src
                        }
                    } else {
                        $("#" + opts.Img).attr('src', _self.getObjectURL(this.files[0]))
                    }
                    opts.Callback();
                }
        	}
        })
    }
});
