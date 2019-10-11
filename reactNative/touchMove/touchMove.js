import React, { Component } from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View
} from 'react-native';
let gestureHandlers = {};
export default class TouchMove extends Component {
  constructor(props, context) {
    super(props, context);
    this.config = {
      changeX: 0,
      changeY: 0,
      xDiff: 0,
      yDiff: 0
    }
    this.state = {
      bg: 'white',
      left: 0,
      top: 0
    }
  }
  componentWillMount(){
    gestureHandlers = {
    onStartShouldSetResponder: (e) => {
      console.log(e.nativeEvent); 
      console.log("start");
      return true
    },
    onMoveShouldSetResponder: (e) => {console.log("move begin"); return true},
    onResponderGrant: (e) => {
      console.log("grant");
      this.config.changeY = e.nativeEvent.pageY;
      this.config.changeX = e.nativeEvent.pageX;
      this.setState({bg: 'red'});
    },
    onResponderMove: (e) => {
      console.log("moving"); 
      this.config.yDiff = e.nativeEvent.pageY - this.config.changeY;
      this.config.xDiff = e.nativeEvent.pageX - this.config.changeX;
      this.state.left = this.state.left + this.config.xDiff;
      this.state.top = this.state.top + this.config.yDiff;
      this.config.changeY = e.nativeEvent.pageY;
      this.config.changeX = e.nativeEvent.pageX;
      this.setState({left: this.state.left, top: this.state.top});
    },
    onResponderRelease: (e) => {console.log("release"); this.setState({bg: 'white'})}
  }
}

  render() {
    console.log("begin render");
    return (
     <View style={styles.container}>
      <Text>Begin</Text>
       <View
         {...gestureHandlers}
         style={[styles.rect, {
          "backgroundColor": this.state.bg,
          "left": this.state.left,
          "top": this.state.top        
         }]}>
       </View>
      </View>
    );
  }
}
const styles = StyleSheet.create({
 container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  rect: {
    width: 200,
    height: 200,
    borderWidth: 1,
    borderColor: 'black',
    position: 'absolute'
  }
});