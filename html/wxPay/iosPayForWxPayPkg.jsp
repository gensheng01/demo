<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common/commonInclude.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
    <%@ page isELIgnored="false" %>
    
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta charset="utf-8" />
        <title><%=SYSTEM_NAME%></title>
        <meta name="description" content="User login page" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
        
        <link rel="stylesheet" href="/assets/css/bootstrap.min.css" />
		<link rel="stylesheet" href="/assets/css/font-awesome.min.css" /> 
        <style>
        	.clearfix:after {
        		content: "";
        		display: block;
        		height: 0;
        		clear: both;
        		visibility: hidden
        	}
        	
        	.clearfix {
        		zoom:1;
        	}
           
            .user-info-box{
                width:100%;
                height:50px;
                background:url('/assets/images/bg.png') no-repeat;
                background-size:100% 60px;
                box-shadow:5px 5px 10px rgba(0,0,0,0.2);
                display: flex;
                text-align: center;
                justify-content: center;
            }
            .user-avatar{
                float:left;
                width:40px;
                height:40px;
                border-radius:50%;
                margin-right:10px;
            }
            .user-name{
                /*float:left;*/
                /*width:calc(100% - 130px);*/
                /*height:30px;*/
                /*margin-top:10px;*/
                line-height:50px;
                overflow:hidden;
                white-space:nowrap;
                text-overflow:ellipsis;
                font-size:16px;
            }
            .modal-box{
                border-radius:10px;
            }
            
            .text-color{
                color:#FEA500;
            }
            .chooseWrap{
            	text-align: center;
            	margin:15px 0;
            }
            #chooseName{
            	width: 60%;
            	height: 30px;
            	line-height: 30px;
            	padding-left: 20px;
            	border: 1px solid #333;
            	border-radius: 15px;
            }
            .storyWrap{
            	float: left;
            	width: 31%;
            	margin: 1%;
            	display: flex;
            	flex-direction:column;
            	align-items: center;
            	justify-content: center;
            }
            .imgWrap{
            	width: 100px;
            	height: 100px;
            	position: relative;
            }
            img{
            	width: 100%;
            	height: 100%;
            	border-radius: 6px;
            }
            .title{
            	width: 100px;
            	text-align: left;
            }
            .title h4{
            	width: 100%;
                overflow:hidden;
                white-space:nowrap;
                text-overflow:ellipsis;
            	margin: 0;
            	padding: 0;
            	font-size: 14px;
            	margin: 5px 0;
            	font-weight: 800;
            }
            .title p{
            	width: 100%;
            	font-size: 12px;
                overflow:hidden;
                white-space:nowrap;
                text-overflow:ellipsis;
            	margin: 0;
            	padding: 0;
            }
            .price{
            	text-align: right;
            }
            #listWrap{
            	padding-bottom: 30px;
            }
			.nav-tabs{
				border:none;
			}
			.nav-tabs>li {
				width: 50%;
				border: 1px solid #ff6224;
			}
			.nav-tabs>li>a:hover{
				border:none;
			}
			.nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover{
				background: #FF6224;
				color: #fff;
			}
			.nav-tabs>li>a{
				width: 100%;
				text-align: center;
				font-size: 16px;
				color: #333;
			}
			#mianWrap{
				padding: 20px;
			}
			#myTab{
				margin-bottom: 20px;
			}
			.vipImg{
				width: 29px;
				height: 12px;
				position: absolute;
				right: 4px;
				bottom: 8px;
				border-radius: 0;
			}
			
        </style>
            
    </head>
    <body class="">
        <div>
            <div class='page'>
                <div class="user-info-box clearfix">
                    <img class="user-avatar" src="https://chnedu-test-public-read.oss-cn-shanghai.aliyuncs.com/student_head_default_male.jpg" />
                    <p class="user-name">瞧瞧</p>
                </div>
                
                <div id="mianWrap">
                	<ul id="myTab" class="nav nav-tabs">
						<li class="active">
							<a href="#pictureBookMenu" data-toggle="tab">
								看绘本
							</a>
						</li>
						<li>
							<a href="#audioBookMenu" data-toggle="tab">听故事</a>
						</li>
					</ul>
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade in active" id="pictureBookMenu">
			                <div id="pictureBookListWrap" class="clearfix">
			                	
			                </div>
						</div>
						<div class="tab-pane fade" id="audioBookMenu">
							<div class="chooseWrap">
			                	<input type="text" name="chooseName" id="chooseName" value="" placeholder="搜索故事名"/>
			                	<button onclick="search()">搜索</button>
			                </div>
			                
			                <div id="listWrap" class="clearfix">
			                	
			                </div>
						</div>
					</div>
                </div>
                
                

                <!-- 支付时蒙版  -->
                <%-- <div class="modal-pay">
                    <div class="deal-change">您的交易正在处理中,请稍后~</div>
                </div> --%>
            </div>
        </div>



        <script src="/assets/js/jquery.js"></script>
        <script src="/assets/js/jquery.cookie.js"></script>
        <script src="/assets/js/sha1.js"></script>
        <script src="/assets/plugins/ejs/ejs.min.js"></script>
        <script src="/assets/plugins/imgRotate/viewer.js"></script>
        <script src="/assets/plugins/datepicker/bootstrap-datepicker.js"></script>
        <script src="/assets/plugins/select2/select2.min.js"></script>
        <script src="/assets/plugins/toastr/toastr.js"></script>
        <script src="/assets/plugins/qrcode/jquery.qrcode.min.js"></script>
        <script src="/assets/plugins/nativeShare/nativeShare.js"></script>
        <script src="/assets/plugins/clipboard/clipboard.min.js"></script>
        <script src="https://www.promisejs.org/polyfills/promise-6.1.0.js"></script>
        <script type="text/javascript" src="https://gosspublic.alicdn.com/aliyun-oss-sdk.min.js"></script>
        <script src="/assets/js/common.js?v=2"></script>
        <script src="/assets/js/bootstrap.js?v=1"></script>
        <script src="https://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>

        <script>
	        //var javaScript_user_id = "${user.id}";
            var javaScript_user_name = "${sessionScope.sessionUser.name}";
            var javaScript_user_headphoto = "${sessionScope.sessionUser.headPhotoOssAddress}";
	        var javaScript_qiaoqiao_token = "${qiaoqiao_token}";
	    </script>
        
        <script>
            //getToken
            //javaScript_Server_Name = 'https://www.qiaoqiaochinese.com/chnedu/';
//          javaScript_Server_Name = 'http://192.168.2.196:8080/chnedu/'
            var qiaoqiao_token = javaScript_qiaoqiao_token;
//          console.log("qiaoqiao_token is "+qiaoqiao_token);
            if(qiaoqiao_token != null && qiaoqiao_token != ""){
                setQiaoQiaoCookie(qiaoqiao_token,GLOBAL_TOKEN_TIME);
            }
            
            //
            toastr.options=showToast();
            //
            //var studentId = javaScript_user_id;
            var studentId = 97;
            var token=javaScript_qiaoqiao_token;
            function initPage(){
                let avatarImgStr = 'https://chnedu-test-public-read.oss-cn-shanghai.aliyuncs.com/student_head_default_male.jpg';
                avatarImgStr = javaScript_user_headphoto == ''?avatarImgStr:javaScript_user_headphoto;
                let nameStr = javaScript_user_name == ''?'瞧瞧':javaScript_user_name;
                $('.user-name').html(nameStr);
                //关联studentId
                transformStudentId();
            }
            
            
            // var curUnionId = "oRNQX0lC0p2yYDta5csvQm7iCqWM";
            // var curUnionId = "oRNQX0vainlpOoD12ZDPHTysV0Mc";
            var curUnionId=getQS('unionId');
//          console.log("curUnionId:--" + curUnionId)
            //存储已购买包信息
            var audioBookChargedList = []
            var pictureBookChargedList = []
            
            

            $(function($){
                hasToken(initPage);
            });
            //用户已购买信息
			queryAllPurchasedBook();
			//付费绘本
			queryPictureBookCharged();
			//付费音频包
			search();
            
           	function wxPayJudge(type,id){
				if(type == 2){
					wxPayPictureBook(id);
					return;
				}
				wxPayAudioBookPkg(id)
           	}
           
            //拉起支付（普通音频）
            function wxPayAudioBookPkg(id){
            	console.log("wxPayAudioBookPkg--id---" + id)
                $.ajax({
                    url:javaScript_Server_Name+"wxpay/gongzhonghao/purchase-audio-pkg/createPayOrder",
                    // url:'https://www.qiaoqiaochinese.com/chnedu/wx/createWxPayOrderForWechatApp?studentId=1682&token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NTAzMDQ2MzY2MTUsInBheWxvYWQiOiJ7XCJ1aWRcIjpcIm9qMXpUNVBFT1Q5em14ZmZyMjNycEVfdHpZM2dcIixcInJvbGVcIjpcInN0dWRlbnRcIixcIm5hbWVcIjpcIui9u-aziea8qua6quWViuWViuiMg-W-t-iQqOWPkVwiLFwiaWRcIjoxNjgyfSJ9.IgB2sEcOcajWEnR0bOiIZARHSNqLH1RK9GLJ7QtvHAo&audioSubscriberType=7',
                    // method:'post',
                    method:'post',
                    data:{
                        studentId:studentId,
                        token:token,
						productType: "AUDIO_BOOK_PKG",
						productId:id
                    },
                    success:function(res){
//                  	console.log(res)
                        if (typeof WeixinJSBridge == "undefined"){
                            if( document.addEventListener ){
                                document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
                            }else if (document.attachEvent){
                                document.attachEvent('WeixinJSBridgeReady', onBridgeReady); 
                                document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
                            }
                        }else{
                            var myObj=res.data;
                            onBridgeReady(myObj);
                        }
                        
                    }
                })
            }
            //拉起支付（翻页绘本）
            function wxPayPictureBook(id){
            	console.log("wxPayPictureBook--id---" + id)
                $.ajax({
                    url:javaScript_Server_Name+"wxpay/gongzhonghao/purchase-audio-pkg/createPayOrder",
                    // url:'https://www.qiaoqiaochinese.com/chnedu/wx/createWxPayOrderForWechatApp?studentId=1682&token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NTAzMDQ2MzY2MTUsInBheWxvYWQiOiJ7XCJ1aWRcIjpcIm9qMXpUNVBFT1Q5em14ZmZyMjNycEVfdHpZM2dcIixcInJvbGVcIjpcInN0dWRlbnRcIixcIm5hbWVcIjpcIui9u-aziea8qua6quWViuWViuiMg-W-t-iQqOWPkVwiLFwiaWRcIjoxNjgyfSJ9.IgB2sEcOcajWEnR0bOiIZARHSNqLH1RK9GLJ7QtvHAo&audioSubscriberType=7',
                    // method:'post',
                    method:'post',
                    data:{
                        studentId:studentId,
                        token:token,
						productType: "PICTURE_BOOK",
						productId:id
                    },
                    success:function(res){
//                  	console.log(res)
                        if (typeof WeixinJSBridge == "undefined"){
                            if( document.addEventListener ){
                                document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
                            }else if (document.attachEvent){
                                document.attachEvent('WeixinJSBridgeReady', onBridgeReady); 
                                document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
                            }
                        }else{
                            var myObj=res.data;
                            onBridgeReady(myObj);
                        }
                        
                    }
                })
            }
            //
            function onBridgeReady(json) {
                WeixinJSBridge.invoke('getBrandWCPayRequest', json, function(res) {
                    // 使用以上方式判断前端返回,微信团队郑重提示：res.err_msg将在用户支付成功后返回    ok，但并不保证它绝对可靠。
                    if (res.err_msg == "get_brand_wcpay_request:ok") {
                    	
                        toastr.success('支付成功,可以在小程序听这个故事啦！');
                        //更新页面
                        //用户已购买信息
						queryAllPurchasedBook();
						//付费绘本
						queryPictureBookCharged();
						//付费音频包
						search();
                          
                    } else {
                        toastr.warning('支付失败,请重新支付');
                    }
                    
                })
            }
        
            //根据unionId去关联小程序数据库里面的studentId
            function transformStudentId(){
                $.ajax({
                    url:javaScript_Server_Name + "student/getStudentIdByUnionId",
                    data:{
                        unionId:curUnionId,
                        token:token
                    },
                    success:function(res){
                        if(res.resultCode == 0){
                            studentId = res.data;
                            //查询会员信息
                        }
                    }
                })
            }
           
            //查询用户所有的已经购买的信息
            function queryAllPurchasedBook(){
            	$.ajax({
					type:"get",
                    url:javaScript_Server_Name + "audio-book/package/queryStudentPurchased",
                    dataType: "json",
                  	data: {
						"studentId": studentId,
						"token": token,
					},
                    success:function(res){
                    	if(res.resultCode == 0 ){
							let arr01 = [];
							let arr02 = [];
							if(res.dataMap.AUDIO_BOOK_PKG != undefined && res.dataMap.AUDIO_BOOK_PKG.length != 0){
								arr01 = res.dataMap.AUDIO_BOOK_PKG;
							}
							if(res.dataMap.PICTURE_BOOK != undefined && res.dataMap.PICTURE_BOOK.length != 0){
								arr02 = res.dataMap.PICTURE_BOOK;
							}
							
							audioBookChargedList = arr01
            				pictureBookChargedList = arr02
							
							}
                    	
                    }
                })
            }
            
            //搜索
			function search(){
				var keyword = $("#chooseName").val()
//				console.log(keyword)
				var getDate ={
					name : keyword,
					charged: true
				}
				
				$.ajax({
					type:"GET",
                    url:javaScript_Server_Name + "audiobook/queryAllAudioBookPkg",
                    data:getDate,
                    success:function(res){
//                  	console.log(res)
//                  	var res = JSON.parse(res)
                    	$("#listWrap").empty();
                        if(res.resultCode == 0){
                            for(var i=0;i<res.dataList.length;i++){
                            	var dataItem =  res.dataList[i];
//                          	console.log(dataItem)
                            	var falg = true
                            	
                        		audioBookChargedList.forEach((item,index)=>{
                        			if(item == dataItem.id){
//                          				console.log("BookId---" + item)
                        				falg = false
                        			}
                        		})
                        		
                            	if(falg){
                            		pkgItemModel(dataItem,$("#listWrap"),1)
                            	}else{
                            		continue;
                            	}
                            }
                        }
                    }
                })
			}
			//查询付费翻页绘本/picture-book-header/queryCharged
            function queryPictureBookCharged(){
            	$.ajax({
					type:"get",
                    url:javaScript_Server_Name + "picture-book-header/queryCharged",
                    dataType: "json",
//                  data:JSON.stringify(getData),
                    success:function(res){
//                  	console.log(res)
                    	for(var i=0;i<res.dataList.length;i++){
                        	var dataItem =  res.dataList[i];
//                          	console.log(dataItem)
                        	var falg = true
                    		pictureBookChargedList.forEach((item,index)=>{
                    			if(item == dataItem.id){
//                          				console.log("pictureBookId---" + item)
                    				falg = false
                    			}
                    		})
                        	if(falg){
                        		pkgItemModel(dataItem,$("#pictureBookListWrap"),2)
                        	}else{
                        		continue;
                        	}
                        }
                    }
                })
            }
            
        	function pkgItemModel(item,divWrap,type){
//      		console.log(item)
        		var str = ''
        			str += '<dl class="storyWrap" onclick="wxPayJudge(#type,#pkgId)">'
                		str += '<dt class="imgWrap">';
                			str += '<img src="' + javaScript_OSS_Url + '#imgUrl" />';
                			str += '<img class="vipImg" src="/assets/images/vip_icon.png" />';
                		str += '</dt>';
                		str += '<dd class="title">';
                			str += '<h4>#pkgTitle</h4>';
                			str += '<p class="price">价格：<span>#pkgPrice</span>元</p>';
                		str += '</dd>';
                	str += '</dl>';
                let numOfBooks = item.numOfBooks
                
                if(numOfBooks == undefined){
                	numOfBooks = 1
                }
				let title = item.despShort ;
				
				let getId = item.id;
				let imgUrl = "audioBookPkg/"+item.pkgImg;
				if(type == 2){
					title = item.title;
					imgUrl = "picture_book/cover_image/"+item.coverImageName
				}
				title = title + "("+numOfBooks+"个故事)"
				
                str = str.replace(/#type/g,type);  
                str = str.replace(/#pkgId/g,getId);  
                str = str.replace(/#imgUrl/g,imgUrl);  
                str = str.replace(/#pkgTitle/g,title);  
                str = str.replace(/#pkgPrice/g,item.price/100);
                
                divWrap.append(str)
        	}
        </script>


    </body>
</html>