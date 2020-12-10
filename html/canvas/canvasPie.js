const app = getApp();
const utils = require('../../utils/util.js');
//
Component({
  options: {
    addGlobalClass: true, //使用全局的css样式
      
  },
  /**
   * 组件的属性列表
   */
  properties: {
    canvasId: {
      type: String,
      value: ''
    },


  },

  /**
   * 组件的初始数据
   */
  data: {
    canvasW: 560,
    canvasH: 480,
    radius: 190,
    lineW: 70,
    // screenW: wx.getSystemInfoSync().windowWidth,
    canvasDataList: [
      {
        bgColor: '#6E7AFF',
        name: '办公室办',
        ratio: 0.05,
      },
      {
        bgColor: '#89C4FF',
        name: '办公室办公室办公室办公室办公室办公室办公室办公室',
        ratio: 0.15,
      },
      {
        bgColor: '#FFD58D',
        name: '办公室办公室办公室办公室办公室办公室办公室办公室',
        ratio: 0.8,
      },

      
    ]

  },

  ready() {
    //转换数组
    this.dealDataList();
    this.drawCanvas();
    
  },

  /**
   * 组件的方法列表
   */
  methods: {
    dealDataList() {
      let arr01 = [...new Set(this.data.canvasDataList.map(item => item.ratio))].sort((a,b) => a-b);
      let arr02 = [];
      arr01.map(item => {
        arr02 = arr02.concat(this.data.canvasDataList.filter(it => item == it.ratio));
      })

      arr02.map((item,index) => {
        item.degRatio = arr02.reduce((prev,cur,i) => {
          if (index>=i) {
            prev += cur.ratio;
          }
          return prev;
        },0);
      })
      this.setData({
        canvasDataList: arr02
      })
    },
    drawCanvas() {
      let originX = utils.rpxToPx(this.data.canvasW) / 2;
      let originY = utils.rpxToPx(this.data.canvasH) / 2;
      let radius = utils.rpxToPx(this.data.radius);
      let lineW = utils.rpxToPx(this.data.lineW);
      let PI = Math.PI;
      let PI2 = 2 * Math.PI;

      let startPosX = originX;
      let startPosY = originY - radius;
      let EndPosX = originX;
      let EndPosY = originY - radius;

      let startDeg = 1.5 * PI;
      let endDeg = 1.5 * PI;
       
      var context = wx.createCanvasContext(this.data.canvasId,this);

      this.data.canvasDataList.map((item,index) => {
        startDeg = endDeg;
        endDeg = (item.degRatio * 2 + 1.5) * PI;
        
        //
        context.beginPath();
        context.arc(originX,originY,radius,startDeg,endDeg);
        context.setStrokeStyle(item.bgColor);
        context.setLineWidth(lineW);
        context.stroke();

      })

      //字号大小转化
      let transFontSize = utils.rpxToPx(24);
      let curStartDeg = 0;
      let curEndDeg = 0;
      let textPosX = 0;
      let textPosY = 0;
      this.data.canvasDataList.map((item,index,arr) => {
        startPosX = EndPosX;
        startPosY = EndPosY;

        curStartDeg = curEndDeg;
        curEndDeg = item.degRatio * PI2;
        
        EndPosX = originX + radius * Math.sin(item.degRatio * PI2);
        EndPosY = originY - radius * ( Math.cos(item.degRatio * PI2));
        

        if (index == 0) {
          //起点圈
          context.beginPath();
          context.arc(startPosX,startPosY,lineW/2,0,PI2);
          context.setFillStyle(item.bgColor);
          context.setLineWidth(1);
          context.fill();
        } 
        if (index != arr.length-1) {
          //终点圈
          context.beginPath();
          context.arc(EndPosX,EndPosY,lineW/2,0,PI2);
          context.setFillStyle(item.bgColor);
          context.setLineWidth(1);
          context.fill();
        }
        textPosX = this.dealTextPos(originX,originY,radius,PI,index,arr,curStartDeg,curEndDeg).x-12;
        textPosY = this.dealTextPos(originX,originY,radius,PI,index,arr,curStartDeg,curEndDeg).y+5;
        context.beginPath();
        context.setFillStyle('#fff');
        context.setFontSize(transFontSize);
        context.fillText(item.ratio*100+'%',textPosX,textPosY);
        context.fill();
        
      })

      context.draw();
  
      
  
    },
    //计算文本坐标值
    dealTextPos(originX,originY,radius,PI,index,arr,deg01,deg02) {
      let obj = {};
      let a = radius * Math.sin(deg01);
      let b = radius * Math.cos(deg01);
      let c = radius * Math.sin(deg02);
      let d = radius * Math.cos(deg02);
      let k = (b+d)/(a+c);
      let num = Math.sqrt(Math.pow(radius,2) / (1+Math.pow(k,2)));
      num = Math.abs(num);
      let numX = (a + c) / 2;
      let numY = (b + d) / 2;
      let numX01 = num;
      let numY01 = k * numX01;
      let numX02 = 0 - num;
      let numY02 = k * numX02;
      let dis01 = Math.pow((numX01 - numX),2) + Math.pow((numY01 - numY),2);
      let dis02 = Math.pow((numX02 - numX),2) + Math.pow((numY02 - numY),2);

      //求两点间的坐标，如果角度小于派，取最近，反之，取远值
      
      if (deg02 - deg01 < PI) {
        if (dis01 < dis02) {
          obj.x = numX01 + originX;
          obj.y = originY - numY01;
        } else {
          obj.x = numX02 + originX;
          obj.y = originY - numY02;
        }
      } else if (deg02 - deg01 == PI) {
        if (index == arr.length-1) {
          if (numX01 < 0) {
            obj.x = numX01 + originX;
            obj.y = originY - numY01;
          } else {
            obj.x = numX02 + originX;
            obj.y = originY - numY02;
          }
        } else {
          if (numX01 > 0) {
            obj.x = numX01 + originX;
            obj.y = originY - numY01;
          } else {
            obj.x = numX02 + originX;
            obj.y = originY - numY02;
          }
        }
      } else {
        if (dis01 > dis02) {
          obj.x = numX01 + originX;
          obj.y = originY - numY01;
        } else {
          obj.x = numX02 + originX;
          obj.y = originY - numY02;
        }
      }

      return obj;
    },


  }
    
})
