// pages/scale_book/scale_book.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    imageScale:false,
    scaleTop:0,
    scaleLeft:0,
    aHeight:"75%"
  },
  scaleClick:function(e){
    var getClass = e.currentTarget.dataset.classname
    var thiz = this
    //创建节点选择器
    var query = wx.createSelectorQuery();
    var scaleImgWidth, scaleImgHeiht
    var boxLeft,boxTop;
    query.select('.scale-image').boundingClientRect(function (rect) {
      scaleImgWidth = rect.width
      scaleImgHeiht = rect.height
    }).exec();
    query.select('.' + getClass).boundingClientRect(function (rect) {
      console.log(rect)
      boxLeft = rect.left;
      boxTop = rect.top;
    }).exec();
    setTimeout(function () {
      //要延时执行的代码
      var imageScale = thiz.data.imageScale;
      var eDetail = e.detail;//点击信息
      var systemInfo = wx.getSystemInfoSync();//可视窗口的大小
      var scaleTop = 0;
      var scaleLeft = 0;
      if (!imageScale) {
        scaleTop = boxTop * 3;
        scaleLeft = boxLeft * 3;
        if (scaleTop > scaleImgHeiht * 2){
          scaleTop = scaleImgHeiht * 2
        }
        if (scaleLeft > scaleImgWidth * 2){
          scaleLeft = scaleImgWidth * 2
        }
      }
      // console.log(scaleImgWidth + "---" + scaleImgHeiht)
      // console.log(systemInfo.windowWidth + "---" + systemInfo.windowHeight)
      // console.log(scaleTop + "---" + scaleLeft)
      thiz.setData({
        imageScale: !imageScale,
        scaleTop: scaleTop,
        scaleLeft: scaleLeft,
      })
    }, 100) //延迟时间 这里是100毫秒
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {

  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  }
})