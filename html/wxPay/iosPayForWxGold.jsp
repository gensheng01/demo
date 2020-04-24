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
		<link rel="stylesheet" href="/assets/css/ace-fonts.css" />
		<link rel="stylesheet" href="/assets/css/ace.min.css" />
		<link rel="stylesheet" href="/assets/css/ace-rtl.min.css" />
		<link rel="stylesheet" href="/assets/plugins/datepicker/datepicker3.min.css" />
        <link rel="stylesheet" href="/assets/plugins/select2/select2.min.css" />  
        <link rel="stylesheet" href="/assets/plugins/toastr/toastr.css" />  
        <link rel="stylesheet" href="/assets/plugins/imgRotate/viewer.css" />  
        <link rel="stylesheet" href="/assets/css/common.css" />
        <link rel="stylesheet" href="/assets/css/overview.css?v=4" />
        <link rel="stylesheet" href="/assets/css/competition.css?v=17" />
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
            .vip-tip{
                width: 100%;
                height: 40px;
                line-height: 40px;
                color: #333;
                margin: 10px 0 0 20px;
                font-weight: lighter;
                font-size: 16px;
            }
            .user-info-box{
                width:100%;
                height:150px;
                background:url('/assets/images/bg.png') no-repeat;
                background-size:100% 150px;
                box-shadow:5px 5px 15px rgba(0,0,0,0.2);
            }
            .user-avatar{
                float:left;
                width:80px;
                height:80px;
                border-radius:50%;
                margin:35px 20px 0 20px;
            }
            .user-name{
                float:left;
                width:calc(100% - 130px);
                height:30px;
                line-height:30px;
                margin-top:50px;
                overflow:hidden;
                white-space:nowrap;
                text-overflow:ellipsis;
                font-size:16px;
            }
            .modal-box{
                border-radius:10px;
            }
            .goldTypeBox ul{
            	margin: 0;
            	padding: 2%;
            }
            .goldTypeBox ul li{
            	float: left;
            	width: 48%;
            	height: 40px;
            	margin-left: 2%;
            	margin-top: 10px;
            	text-align: center;
            	line-height: 40px;
            	line-height: 40px;
            	border: 1px solid #fea500;
            	font-size: 16px;
            	border-radius: 6px;
            }
            
            .goldTypeBox ul li span{
            	font-size: 11px;
            }
            .liActive{
            	background: #fea500;
            	color: #fff;
            }
            .buyBtn{
            	width: 60%;
            	height: 36px;
            	color: #fff;
            	font-size: 16px;
            	background: #fea500;
            	border: 0;
            	border-radius: 18px;
            	margin-top: 20px;
            	margin-left: 20%;
            	outline: none;  
            }
            .goVipWrap{
			  width: 92%;
			  border: 1px solid #999;
			  margin: 40px 4% 0;
			  display:flex;
			  flex-direction:row;
			  justify-content:space-around;
			  align-items:center;
			}
			.left{
			  width: 50%;
			  padding:20px 0;
			}
			.right{
			  width: 35%;
			}
			.tipsWrap{
			  padding: 30px;
			}
			
			.tipText{
			  text-align: left;
			  color: #999;
			  font-size: 12px;
			  text-indent: 24px;
			}
			.tipTitle{
			  text-align: left;
			  font-size: 18px;
			  margin-bottom: 10px;
			}
			.goVipBtn{
				width: 80%;
			    height: 30px;
			    border-radius: 3px;
			    border: 0;
			    float: right;
			}
			
			#warningTop{
				width: 100%;
				height: 100%;
				position: fixed;
				left: 0;
				top: 0;
				background: none;
				display: none;
			}
			.warningContentWrap{
				width: 100%;
				height: 100%;
				display: flex;
				justify-content: center;
				align-items: center;
			}
			.warningContent{
				width: 50%;
				padding: 20px;
				background: rgba(0,0,0,0.5);
				border-radius: 6px;
				color: #fff;
				text-align: center;
				font-size: 14px;
			}

        </style>
            
    </head>
    <body class="">
        <%-- 兑换方式模态框 --%>
        <div id="payModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="modal-box">
                            <div id="warning">警告</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--  --%>
        <div id="warningTop">
        	<div class="warningContentWrap">
	        	<div class="warningContent">
	        	
	        	</div>
        	</div>
        </div>
        <div>
            <div class='page'>
                <div class="user-info-box clearfix">
                    <img class="user-avatar" src="https://chnedu-test-public-read.oss-cn-shanghai.aliyuncs.com/student_head_default_male.jpg" />
                    <p class="user-name">瞧瞧</p>
                    <p class="user-member-time">暂未开通会员</p>
                </div>
                
                <div class="vip-tip"> 拥有金币: <span class="point-num">0</span> </div>
                <div class="goldTypeBox">
                	<ul class="clearfix">
                		<!--<li data-id="111">200金币 (<span>20元</span>)</li>-->
                	</ul>
                	<button class="buyBtn" onclick="showModal()">购买</button>
                	
                	<div class="goVipWrap">
				       <div class="left">
				         <div class="tipTitle"> 开通会员</div>
				         <p class="tipText">充值的金币不能购买会员，请点击右侧按钮开通会员，开通后即可畅听海量精品内容</p>
				       </div>
				       <div class="right">
				         <button class="goVipBtn" onclick="goToVipPage()">开通会员</button>
				       </div>
				       
				     </div>
				     <div class="tipsWrap">
				        <div class="tipTitle">温馨提示</div>
				        <p class="tipText">1.金币充值成功后无法退款、提现或转让他人；</p>
				        <p class="tipText">2.充值的金币不能用于购买会员；</p>
				        <p class="tipText">3.充值金额不可自定义；</p>
				        <p class="tipText">4.如遇到问题，请关注【QiaoQiaoEducation】公众号</p>
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
        <script src="/assets/js/common.js?v=1"></script>
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
            var qiaoqiao_token = javaScript_qiaoqiao_token;
            console.log("qiaoqiao_token is "+qiaoqiao_token);
            if(qiaoqiao_token != null && qiaoqiao_token != ""){
                setQiaoQiaoCookie(qiaoqiao_token,GLOBAL_TOKEN_TIME);
            }
            
            //
            toastr.options=showToast();
            //
            //var studentId = javaScript_user_id;
            var studentId = 0;
            var token=javaScript_qiaoqiao_token;
            function initPage(){
                let avatarImgStr = 'https://chnedu-test-public-read.oss-cn-shanghai.aliyuncs.com/student_head_default_male.jpg';
                avatarImgStr = javaScript_user_headphoto == ''?avatarImgStr:javaScript_user_headphoto;
                let nameStr = javaScript_user_name == ''?'瞧瞧':javaScript_user_name;
                $('.user-avatar').attr('src',avatarImgStr);
                $('.user-name').html(nameStr);
                //关联studentId
                transformStudentId();
            }
            
         
            
            var curUnionId=getQS('unionId');
            var productId = '';
           
            $(function($){
                hasToken(initPage);
            });
            //var wechatUnionId = "${wechatUnionId}";

            $('.goldTypeBox').on('click','li',function(){
            	console.log($(this).data("id"))
            	productId = $(this).data("id")
            	$(this).addClass("liActive").siblings().removeClass(); 
            })
            //
            function showModal(){
            	console.log(productId)
            	if(productId == ''){
            		showWarning("请选择购买金币数量")
            		return;
            	}
            	wxPay();
            }
            //警示框显示
            function showWarning(text){
            	$(".warningContent").html(text)
            	$('#warningTop').show();
                var timer = setTimeout(function(){
                	$('#warningTop').hide();
                },1500)
            }
            //查询用户金币
            function getUserGold(){
                $.ajax({
                    url:javaScript_Server_Name+"gold-coin-state/findByStudentId",
                    method:'post',
                    data:{
                        token:token,
                        studentId:studentId
                    },
                    success:function(res){
                        if(res.resultCode == 0){
                            curPointNum = res.data;
                            $('.point-num').html(curPointNum);
                        }
                    }
                })
            }
            
            //查询当前金币类型
            function getGoldCoinType(){
                $.ajax({
                    url:javaScript_Server_Name+"gold-coin-state/findAllGoldCoinType",
                    method:'post',
                    data:{
                        token:token,
                        studentId:studentId
                    },
                    success:function(res){
//                  	console.log(res)
                        if(res.resultCode == 0){
                        	let getTypeList = res.dataList
//                      	console.log(getTypeList)
                            goldCoinTypeModel(getTypeList)
                        }
                    }
                })
            }
           
            function goldCoinTypeModel(getTypeList){
//          	console.log(getTypeList)
            	let html = ''
                for(var i = 0;i<getTypeList.length;i++){
                	let item = getTypeList[i]
                	let RMGNUm = item.cnyNum / 100
                	html +='<li data-id="'+item.productId+'">'+item.goldCoinNum+'金币 <span>'+RMGNUm+'元</span></li>';
                	
                }
                
                $(".goldTypeBox ul").html(html)
                
            }
            //查询是否是会员
            function isMember(){
                $.ajax({
                    url:javaScript_Server_Name+"audiobooksubscriber/checkAudioSubscriberStatus",
                    type:'get',
                    data:{
                        token:token,
                        id:studentId
                    },
                    success:function(res){
                        if(res.resultCode == 0){
                            let userInfoObj = res.dataMap;
                            
                            if(userInfoObj.isMembership){
                                let timeStartStr = new Date(userInfoObj.startTime).format('yyyy/MM/dd');
                                let endStartStr = new Date(userInfoObj.endTime).format('yyyy/MM/dd');
                                $('.user-member-time').html(timeStartStr+'-'+endStartStr);
                            }else{
                                $('.user-member-time').html('暂未开通会员');
                            }
                        }
                        
                    }

                })
            }
            
            //拉起支付
            function wxPay(){
                $.ajax({
                    url:javaScript_Server_Name+"wxpay/createPayOrder",
                    method:'post',
                    data:{
                        studentId:studentId,
                        token:token,
                        productId:productId,
                        scene:'GZhH'
                    },
                    success:function(res){
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
//                      $('#payModal').modal('hide');
//                      dealReducePoint();
                        showWarning("支付成功");
                        getUserGold();//刷新用户金币数量
                    } else {
//                      toastr.warning('支付失败,请重新支付');
                        showWarning("支付失败,请重新支付")
                    }
                    /* console.log(res)
                    console.log(2)
                    //轮询
                    let outTradeNo=res.data.outTradeNo;
                    getMyPayStatus(outTradeNo);    */
                    
                })
            }
            //轮询
            function getMyPayStatus(outTradeNo) {
                $.ajax({
                    url: javaScript_Server_Name + 'wxpay/queryPayOrderStatus',
                    data: {
                        token:token,
                        id:studentId,
                        outTradeNo:outTradeNo
                    },
                    success: function(res) {
                        if(res.data.status==2){
                        //减积分操作，包月成功
//                          dealReducePoint();
                        }else if(res.data.status==0){
                            getMyPayStatus(outTradeNo);
                        }else if(res.data.status==1){
                        	showWarning("支付已取消,请重新支付")
                        }else if(res.data.status==3){
                        	showWarning("已退款,请重新支付")
                        }
                        
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
//                          studentId = 97//测试数据
                            //查询会员信息
                            isMember();
                            //查询当前用户金币数量
                            getUserGold();
                            //获取金币购买列表
                            getGoldCoinType();
                        }
                    }
                })
            }
            
            function goToVipPage(){
            	window.location.href = "./iosPayForWx";
            }

        
        </script>


    </body>
</html>