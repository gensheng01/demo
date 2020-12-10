//时间格式 例如 "5分钟之前"
export function timestampFormat(timestamp) {
    //console.log(timestamp)
        function zeroize(num) {
            return(String(num).length == 1 ? '0' : '') + num;
        }
        
        //单位年、月、日、时、分 转化为毫秒
        var minute = 1000 * 60;
        var hour = minute * 60;
        var day = hour * 24;
        var halfamonth = day * 15;
        var month = day * 30;
        
        var curTimestamp = parseInt(new Date().getTime()); //当前时间戳
        var timestampDiff = curTimestamp - timestamp; // 参数时间戳与当前时间戳相差秒数
        
        // 计算差异时间的量级(传入时间戳与当前时间的差值)
        var monthC = timestampDiff / month;
        var weekC = timestampDiff / (7 * day);
        var dayC = timestampDiff / day;
        var hourC = timestampDiff / hour;
        var minC = timestampDiff / minute;
    
        var curDate = new Date(curTimestamp); // 当前时间日期对象
        var tmDate = new Date(timestamp); // 参数时间戳转换成的日期对象
        
        //获取 传入 时间戳的年、月、日、时、分、秒
        var Y = tmDate.getFullYear(),
            m = tmDate.getMonth() + 1,
            d = tmDate.getDate();
        var H = tmDate.getHours(),
            i = tmDate.getMinutes(),
            s = tmDate.getSeconds();
            
        let backData = '';
        
        if(curDate.getFullYear() == Y && curDate.getMonth()+1 == m && curDate.getDate() == d ) { //判断是否为当天
            if (hourC >= 1) {
                backData = parseInt(hourC) + "小时前";
            } else if (minC >= 1) {
                backData = parseInt(minC) + "分钟前";
            }else{
                backData = '刚刚';
            }		
        } else {
            var newDate = new Date((curTimestamp - day)); // 参数中的时间戳减一天转换成的日期对象，判断是否为当前时间的前一天
        
            if(newDate.getFullYear() == Y && newDate.getMonth() + 1 == m && newDate.getDate() == d) {
                backData = '昨天'
            } else if(curDate.getFullYear() == Y) {
                backData = zeroize(m) + '月' + zeroize(d) + '日 ';
            } else {
                backData = Y + '年' + zeroize(m) + '月' + zeroize(d) + '日 ';
            }
        }
        
        return backData
    }

export function formatDate (date, fmt) {
    date = new Date(date)
    if (/(y+)/.test(fmt)) {
        fmt = fmt.replace(RegExp.$1, (date.getFullYear() + '').substr(4 - RegExp.$1.length));
    }
    let o = {
        'M+': date.getMonth() + 1,
        'd+': date.getDate(),
        'h+': date.getHours(),
        'm+': date.getMinutes(),
        's+': date.getSeconds()
    };
    for (let k in o) {
        if (new RegExp(`(${k})`).test(fmt)) {
        let str = o[k] + '';
        fmt = fmt.replace(RegExp.$1, (RegExp.$1.length === 1) ? str : padLeftZero(str));
        }
    }
    return fmt;
};
    
function padLeftZero (str) {
    return ('00' + str).substr(str.length);
};


//数组对象方法排序:
export function sortByKey(array,key){
    return array.sort(function(a,b){
        var x=a[key];
        var y=b[key];
        return ((x<y)?-1:((x>y)?1:0));
    });
};