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
            .vip-tip{
                width: 100%;
                height: 40px;
                line-height: 40px;
                color: #333;
                margin: 10px 0 0 20px;
                font-weight: lighter;
                font-size: 16px;
            }
            .card{
                width:100%;
                height: 130px;
                position: relative;
                top:0;
                left:0;
                
                border-radius: 20px;
            }
            .card-img{
                width:100%;
                height:130px;
                padding: 5px 3%;
                position: absolute;
                top:0;
                left:0;
            }
            .card4{
                width: 80px;
                height: 28px;
                line-height:28px;
                position: absolute;
                right: 28px;
                bottom: 20px;
                border-radius: 40px;
                background-color: #fff;
                text-align:center;
                font-size: 12px;
            }
            #item1-card4{
                color: #676DAB;
            }
            #item2-card4{
                color: #40A295;
            }
            #item3-card4{
                color: #F6A027;
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
            .radio-box{
                width:100%;
            }
            .radio-item{
                width:100%;
                height:40px;
                line-height:40px;

            }
            .change-title{
                width:100%;
                height:50px;
                line-height:50px;
                text-align:center;
                color:#FFA706;
                font-size:18px;
                font-weight:800;
            }
            .unchecked{
                float:left;
                position:relative;
                width:20px;
                height:20px;
                margin:10px 20px 0 30px;
                border-radius:50%;
                border:1px solid #FFA706;
            }
            .checked:after{
                content:'';
                position:absolute;
                left:50%;
                top:50%;
                transform:translate(-50%,-50%);
                width:14px;
                height:14px;
                background: #FFA706;
                border-radius:50%;
            }
            .radio-text{
                font-size:16px;
            }
            .sure-change-box{
                width:100%;
                height:50px;
            }
            .sure-change{
                width:100px;
                height:32px;
                line-height:32px;
                text-align:center;
                display:block;
                margin:0 auto;
                background-color:#FEA500;
                border-radius:25px;
                font-size:16px;
                color:#fff;

            }
            .text-color{
                color:#FEA500;
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
                            <p class="change-title">兑换方式</p>
                            <div class="radio-box">
                                <div class="radio-item">
                                    <div class="unchecked checked"></div>
                                    <div class="radio-text">A、<span class="text-color">9.9</span>元</div>
                                </div>
                                <div class="radio-item">
                                    <div class="unchecked"></div>
                                    <div class="radio-text">B、<span class="text-color">1</span>元 + <span class="text-color">890</span>积分</div>
                                </div>
                                
                            </div>
                            <div class="sure-change-box">
                                <p onclick="clickSureBtn()" class="sure-change">确认兑换</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--  --%>
        <div>
            <div class='page'>
                <div class="user-info-box clearfix">
                    <img class="user-avatar" src="https://chnedu-test-public-read.oss-cn-shanghai.aliyuncs.com/student_head_default_male.jpg" />
                    <p class="user-name">瞧瞧</p>
                    <p class="user-member-time">暂未开通会员</p>
                </div>
                
                <div class="vip-tip">VIP会员套餐 ( 当前积分: <span class="point-num">0</span> )</div>
                <div class="card-box">
                	
                    <div class='card' id='item1'>
                        <img class="card-img" src="/assets/images/card_month.png" />
                        <div class='card4' id='item1-card4' onclick="doPackModal(0)">立即开通</div>
                    </div>
                    <div class='card' id='item2' onclick='' data-index='2'>
                        <img class="card-img" src="/assets/images/card_half_year.png" />
                        <div class='card4' id='item2-card4' onclick="doPackModal(1)">立即开通</div>
                    </div>
                    <div class='card' id='item3' onclick='' data-index='3'>
                        <img class="card-img" src="/assets/images/card_year.png" />
                        <div class='card4' id='item3-card4' onclick="doPackModal(2)">立即开通</div>
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
            
            var curCardNum = 0;
            var curPointNum = 0;
            var curTypeAorB = "typeA";
            var curDetailType = 0;
            var curAudioSubscriberType = 0;
            // var curUnionId = "oRNQX0lC0p2yYDta5csvQm7iCqWM";
            // var curUnionId = "oRNQX0vainlpOoD12ZDPHTysV0Mc";
            var curUnionId=getQS('unionId');
            //三种会员对象
            var priceList = [
                {
                    allMoney:9.9, rateMoney:1, ratePoint:890,
                    detailType:0,
                    typeA:7, typeB:0,
                    
                },
                {
                    allMoney:26.9, rateMoney:6.9, ratePoint:1490,
                    detailType:2, 
                    typeA:8, typeB:2
                },
                {
                    allMoney:89, rateMoney:19.9, ratePoint:3900,
                    detailType:4, 
                    typeA:9, typeB:4
                }

            ]
            

            $(function($){
                hasToken(initPage);
                getSubscriberPrice()
            });
            //var wechatUnionId = "${wechatUnionId}";
			function getSubscriberPrice(){
				$.ajax({
                    // url:"http://192.168.2.196:8080/chnedu/audiobooksubscriber/checkAudioSubscriberStatus",
                    url:javaScript_Server_Name+"audio-book-subscriber-coupon/querySubscriberPrice",
                    method:'post',
                    data:{
                        token:token,
                    },
                    success:function(res){
                    	console.log(res)
                        if(res.resultCode == 0){
                        	let payTypeList = res.dataList;
                            //MONTH 0 | SEASON 2 | YEAR 4
						    payTypeList.map((item,index)=>{
						    	let currentIndex = 0
						      	if(item.type == "MONTH"){ currentIndex = 0 }
						      	if(item.type == "SEASON"){ currentIndex = 1 }
						      	if(item.type == "YEAR"){ currentIndex = 2 }
						      	if(item.price > 0 && item.point == 0){
					      			priceList[currentIndex].allMoney = item.price / 100
						      	}
						      	if(item.price > 0 && item.point > 0){
						      		priceList[currentIndex].rateMoney = item.price / 100
						        	priceList[currentIndex].ratePoint = item.point
						      	}
						    })
//						    console.log(priceList)
                        }
                    }
                })
			}
            //点选ab
            $('.radio-item').on('click',function(){
                let index = $('.radio-item').index($(this));
                curTypeAorB = index==0?'typeA':'typeB';
                $('.unchecked').removeClass('checked');
                $(this).children('.unchecked').addClass('checked');
                curAudioSubscriberType = priceList[curCardNum][curTypeAorB];
            })
            //包月-modal
            function doPackModal(type){
                curCardNum = type;
                let textObj = $('.text-color');
                let item = priceList[type];
                textObj.eq(0).html(item.allMoney);
                textObj.eq(1).html(item.rateMoney);
                textObj.eq(2).html(item.ratePoint);
                //每一次进入重置默认点选aq
                $('.radio-item').eq(0).click();
                $('#payModal').modal('show');
            }
            //点击确认兑换
            function clickSureBtn(){
                if(curTypeAorB == 'typeA'){
                    
                }else if(curTypeAorB == 'typeB'){
                    //测试待改
                    //curDetailType = priceList[curCardNum].detailType;
                    //测试待改
                    if(curPointNum < priceList[curCardNum].ratePoint){
                        toastr.warning('当前积分不足'+priceList[curCardNum].ratePoint);
                        return;
                    }else{
                        curDetailType = priceList[curCardNum].detailType;
                    }
                }
                //测试待改
                wxPay();
                //
                //dealReducePoint();
            }
            //查询当前积分
            function getUserAudioPoint(){
                $.ajax({
                    // url:"http://192.168.2.196:8080/chnedu/audiobooksubscriber/checkAudioSubscriberStatus",
                    url:javaScript_Server_Name+"audiobookpoint/queryAudioBookPoint",
                    method:'post',
                    data:{
                        token:token,
                        studentId:studentId
                        //studentId:414
                    },
                    success:function(res){
                        if(res.resultCode == 0){
                            curPointNum = res.dataList[0].remainingPoint;
                            $('.point-num').html(curPointNum);
                        }
                    }
                })
            }
            //查询是否是会员
            function isMember(){
                $.ajax({
                    // url:"http://192.168.2.196:8080/chnedu/audiobooksubscriber/checkAudioSubscriberStatus",
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
            //开通会员0  2  4
            function openMember(){
                $.ajax({
                    // url:"http://192.168.2.196:8080/chnedu/audiobooksubscriber/addSubscriber",
                    url:javaScript_Server_Name+"audiobooksubscriber/addSubscriber",
                    type:'get',
                    data:{
                        id:studentId,
                        startTime:'',
                        endTime:'',
                        memberType:curAudioSubscriberType,
                        orderId:'',
                        token:token
                    },
                    success:function(res){
                        if(res.resultCode == 0){
                            toastr.success('开通会员成功');
                            isMember();
                        }
                    }
                })
            }
            //拉起支付
            function wxPay(){
                $.ajax({
                    // url:"http://192.168.2.196:8080/chnedu/audiobooksubscriber/addSubscriber",
                    url:javaScript_Server_Name+"wxOfficialAccountsWxPay/createWxPayOrderForWxOfficialAccounts",
                    // url:'https://www.qiaoqiaochinese.com/chnedu/wx/createWxPayOrderForWechatApp?studentId=1682&token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NTAzMDQ2MzY2MTUsInBheWxvYWQiOiJ7XCJ1aWRcIjpcIm9qMXpUNVBFT1Q5em14ZmZyMjNycEVfdHpZM2dcIixcInJvbGVcIjpcInN0dWRlbnRcIixcIm5hbWVcIjpcIui9u-aziea8qua6quWViuWViuiMg-W-t-iQqOWPkVwiLFwiaWRcIjoxNjgyfSJ9.IgB2sEcOcajWEnR0bOiIZARHSNqLH1RK9GLJ7QtvHAo&audioSubscriberType=7',
                    // method:'post',
                    method:'post',
                    data:{
                        studentId:studentId,
                        token:token,
                        //unionId:curUnionId,
                        audioSubscriberType:curAudioSubscriberType
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
                        $('#payModal').modal('hide');
                        dealReducePoint();
                        //toastr.success('支付成功');
                        //window.open(baseUrl+"/static/view/success.html");
                        // location.href="https://student.qiaoqiaochinese.com/iosPayForWx";
                        //location.href="https://student-sit1.qiaoqiaochinese.com/iosPayForWx";
                    } else {
                        toastr.warning('支付失败,请重新支付');
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
                    // url:"http://192.168.2.196:8080/chnedu/wx/queryWxPayOrderForWechatApp",
                    url: javaScript_Server_Name + 'wx/queryWxPayOrderForWechatApp',
                    data: {
                        token:token,
                        id:studentId,
                        outTradeNo:outTradeNo
                    },
                    success: function(res) {
                        if(res.data.status==2){
                        //减积分操作，包月成功
                            dealReducePoint();
                        }else if(res.data.status==0){
                            getMyPayStatus(outTradeNo);
                        }else if(res.data.status==1){
                            toastr.warning('支付已取消,请重新支付');
                        }else if(res.data.status==3){
                            toastr.warning('已退款,请重新支付');
                        }
                        
                    }
                })
            }
            //减积分操作
            function dealReducePoint(){                
                if(curTypeAorB == 'typeA'){
                    if(curAudioSubscriberType==7){
                        curAudioSubscriberType=0;
                    }else if(curAudioSubscriberType==8){
                        curAudioSubscriberType=2;
                    }else if(curAudioSubscriberType==9){
                        curAudioSubscriberType=4;
                    }
                    openMember();
                    
                }else if(curTypeAorB == 'typeB'){
                    $.ajax({
                        url:javaScript_Server_Name + "audiobookpoint/recordAudioBookPoint",
                        data:{
                            studentId:studentId,
                            optType:1,
                            eventType:curDetailType,
                            token:token
                        },
                        success:function(res){
                            if(res.resultCode == 0){
                                getUserAudioPoint();
                                openMember();
                            }
                        }
                    })
                }
                
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
                            isMember();
                            //查询当前积分
                            getUserAudioPoint();
                        }
                    }
                })
            }

        
        </script>


    </body>
</html>