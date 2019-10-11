import React, { Component } from 'react';
import {
  StyleSheet,
  SafeAreaView,
  Text,
  View,
  Easing,
  TouchableOpacity,
  ImageBackground,
  Dimensions,
  Animated
} from 'react-native';
import Orientation from 'react-native-orientation';//横屏设置

var {height,width} =  Dimensions.get('window');

export default class Animated extends Component {

  constructor(props) {
    super(props);
  
    this.state = {
      animatedValue: new Animated.Value(0),
      color:'red',
      text:'正面',
      direction:'left',
      changeRotateY:'' ,
      displayNone:'none',
      displayBlock:'block'
    };
    this.rotateAnimated = Animated.timing(
      this.state.animatedValue,
      {
          toValue: 1,
          duration: 1000,
          easing: Easing.in,
      }
  );
  }
  componentWillMount() {

    // Orientation.lockToLandscape();//强制横屏

  }
  componentWillUnmount() {

    // Orientation.lockToPortrait();//强制竖屏

    this.timer && clearTimeout(this.timer);//关闭定时器

  }

  _startAnimated() {
    
    this.timer = setTimeout(
        () => {
            if(this.state.direction==='left'){
                this.setState({
                    direction:'right',
                    displayNone:'none',
                    displayBlock:'block',
                    text:'反面'
                })
            }else {
                this.setState({
                    direction:'left',
                    displayNone:'block',
                    displayBlock:'none',
                    text:'正面'
                })
            }
            },//延时操作
        1500       //延时时间
    );
    this.state.animatedValue.setValue(0);
    this.rotateAnimated.start();
  } 
  _nextPage(){
    this.setState({
        direction:'right',
        text:'反面'
    })
    this.state.animatedValue.setValue(0);
    this.rotateAnimated.start();
  }
  _proPage(){
    this.setState({
      direction:'left',
      text:'正面'
    })
    this.state.animatedValue.setValue(0);
    this.rotateAnimated.start();
  }
  //侧拉的实现方式
  render() {
    const rotateY = this.state.animatedValue.interpolate({
      inputRange: [0, 1],
      outputRange: ['0deg', '180deg' ]
    });
    const rotateY2 = this.state.animatedValue.interpolate({
      inputRange: [0, 1],
      outputRange: ['180deg', '0deg' ]
    });

    const getDirection = this.state.direction
    let changeRotate = rotateY2
    if(getDirection == 'left'){
      changeRotate = rotateY
    }
    let displayNone = this.state.displayNone
    let displayBlock = this.state.displayBlock
    return (
      <View style={styles.container}>
      
        <SafeAreaView style={styles.mainStyle}>
          <Animated.View
              style={{
                  alignSelf:'center',
                  marginTop: 10,
                  width:width,
                  height:200,
                  justifyContent:'center',
                  alignItems:'center',
                  flexDirection:'row',
                  position:'absolute',
                  backfaceVisibility:'hidden',
                  zIndex:5,
                  fontSize: 18,
                  color: 'white',
                  transform: [
                      {rotateY:changeRotate}
                  ]
              }}
          >
              <View style={{width: width, height: '100%',flexDirection:'row'}}>
                <View style={{height:'100%',flex:1,overflow:'hidden',position:'relative'}}>
                 {/* {if(getDirection == 'left'){ */}
                    <View style={{height:'100%',overflow:'hidden'}}>
                    <ImageBackground source={require('./img1.jpg')} style={{width: width, height: 200}}>
                    
                    </ImageBackground>
                  </View>
                  {/* }else{ */}
                    <View style={{height:'100%',overflow:'hidden',transform: [{rotateY:'180deg'}]}}>
                      <ImageBackground source={require('./img1.jpg')} style={{width: width, height: 200,position:'relative',left:-width/2}}>
                      
                      </ImageBackground>
                    </View>
                  {/* }} */}
                    
                </View>
                

                <Text style={{color:'#fff',width:width/2,height:'100%',flex:1}}>
                </Text>
              </View>
              
              
          </Animated.View>
          <Animated.View
              style={{
                  alignSelf:'center',
                  marginTop: 10,
                  width:width,
                  height:200,
                  justifyContent:'center',
                  alignItems:'center',
                  flexDirection:'row',
                  position:'absolute',
                  // left:'-50%',
                  borderStyle:'solid',
                  borderColor:'#f00',
                  borderWdith:3,
                  zIndex:2,
                  fontSize: 18,
                  color: 'white',
                  transform: [
                    {translateX:-width/2}
                      // {rotateY:changeRotate}
                  ]
              }}
          >

              <View style={{width: width, height: '100%',flexDirection:'row'}}>
                <Text style={{color:'#fff',width:width/2,height:'100%',flex:1,backgroundColor:'#f00'}}>
                      左 左 左 左 左
                </Text>

                <View style={{height:'100%',flex:1,overflow:'hidden'}}>
                  <ImageBackground source={require('./img1.jpg')} style={{width: width, height: 200}}>
                    <Text>左 左 左 左 左</Text>
                  </ImageBackground>
                </View>
                
              </View>



          </Animated.View>
          <Animated.View
              style={{
                  alignSelf:'center',
                  marginTop: 10,
                  width:width,
                  height:200,
                  justifyContent:'center',
                  alignItems:'center',
                  flexDirection:'row',
                  position:'absolute',
                  zIndex:1,
                  fontSize: 18,
                  color: 'white',
                  transform: [
                      // {rotateY:changeRotate}
                  ]
              }}
          >
          <ImageBackground source={require('./img1.jpg')} style={{width: '100%', height: '100%',flexDirection:'row'}}>
              <Text style={{color:'#fff',height:'100%',flex:1,}}>
              右右右右右
              </Text>
              <Text style={{color:'#fff',height:'100%',flex:1,fontSize:30,textAlign:'center'}}>
              右右右右右
              </Text>
              </ImageBackground>
          </Animated.View>
        </SafeAreaView>

              {/* <View style={{width:width/2,height:200,overflow:'hidden',position:'relative',transform: [{rotateY:'180deg'}]}}>
                <ImageBackground source={require('./img1.jpg')} style={{width: width, height: 200,position:'relative',left:-width/2}}>
                
                </ImageBackground>
              </View> */}
        
        <View style={styles.btnWrap}>
          <TouchableOpacity style={styles.touchStyle} onPress={this._proPage.bind(this)}>
                <Text style={{width:200,height:100,textAlign:'center',lineHeight:100}}>上一页</Text>
            </TouchableOpacity>
            <TouchableOpacity style={styles.touchStyle} onPress={this._nextPage.bind(this)}>
                <Text style={{width:200,height:100,textAlign:'center',lineHeight:100}}>下一页</Text>
            </TouchableOpacity>
        </View>
        
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  mainStyle:{
    width:width,
    height:200,
    flex:1,
  },
  btnWrap:{
    flexDirection:'row'
  },
  touchStyle:{
      padding:10,
      alignSelf:'flex-end'
  }
});