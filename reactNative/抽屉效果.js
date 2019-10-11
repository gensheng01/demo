import React, { Component } from 'react';
import Drawer from 'react-native-drawer'
import {
AppRegistry,
StyleSheet,
Text,
View
} from 'react-native';

export default class Test extends Component {
closeControlPanel = () => {
    this._drawer.close()
};
openControlPanel = () => {
    this._drawer.open()
};
render() {
return (
    <Drawer

        side="right" //抽屉方向 top／left／right／bottom

        open={false}//默认是否打开抽屉
        tapToClose={true}//点击内容处 会关闭抽屉
        type='displace' //抽屉出现的方式：overlay：抽屉覆盖内容 static:抽屉一只在内容后面 打开的时内容会滑动，displace：不会覆盖的 进出
        openDrawerOffset={0} // 抽屉占整个屏幕的百分比（1-0.6=0.4）
        closedDrawerOffset={0}//关闭抽屉后 抽屉在屏幕中的显示比例
        styles={drawerStyles}//抽屉样式，背景色 透明度，阴影啥的
        ref={(ref) => this._drawer = ref}
        content={<View style={{flex:1,backgroundColor:'red'}}><Text onPress={()=>{this.closeControlPanel()}} style={{fontSize:100}}>抽屉的内容</Text></View>}
    >
        <View style={{flex:1,backgroundColor:'blue'}}><Text onPress={()=>{this.openControlPanel()}} style={{fontSize:30,}}>打开抽屉</Text></View>
    </Drawer>
);
}   
}

const drawerStyles = {
    drawer: { flex:1,backgroundColor:'#000',shadowColor: '#0000ff', opacity: 0.6, shadowRadius: 3},
}