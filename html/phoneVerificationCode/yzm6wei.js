$(".buy-confirm").on("click", function() {
	// 打开支付密码对话框并生成订单
	$('.pay-part').css("display", "block");
})

$(".cancel-btn").on("click", function() {
	$('.pay-part').css("display", "none");
	$inputs.each(function() { //input清空
		$(this).val("");
	})
	pwd = "";
	$(".real-ipt").val("");
})

$(".confirm-btn").on("click", function() {
	//console.log("password:" + pwd);
	if(len === 6 && pwd) { //付款
		window.location.href = 'activity_buy_result.html'
	} else {

	}
})

var pwd = "";
var len = 0;
// type=tel input框
var $inputs = $(".surface-ipt input");
$(".real-ipt").on("input", function() {
	if(!$(this).val()) { //无值
	}
	if(/^[0-9]*$/g.test($(this).val())) { //有值且只能是数字（正则）
		pwd = $(this).val().trim();
		len = pwd.length;
		for(var i in pwd) {
			$inputs.eq(i).val(pwd[i]);
		}
		$inputs.each(function() { //将有值的当前input 后面的所有input清空
			var index = $(this).index();
			if(index >= len) {
				$(this).val("");
			}
		})
		if(len === 6) {
			//执行付款操作
		}

	} else { //清除val中的非数字，返回纯number的value
		var arr = $(this).val().match(/\d/g);
		try {
			$(this).val($(this).val().slice(0, $(this).val().lastIndexOf(arr[arr.length - 1]) + 1));
		} catch(e) {
			// console.log(e.message)
			//清空
			$(this).val("");
		}
	}
	//console.log("password:" + pwd);
})

//  获取焦点事件避免输入键盘挡住对话框
$('.real-ipt').on('focus', function() {
	$('.pay-dialog').css('top', '1rem')
})

$('.real-ipt').on('blur', function() {
	$('.pay-dialog').css('top', '3rem')
})
