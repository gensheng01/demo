import React, {
    Component, PropTypes,
} from 'react';
import {
    StyleSheet,
    View,
    Text,
    TouchableOpacity

} from 'react-native';


export default class Test extends Component {
    constructor(props) {
        super(props);
        this.state = {
            changeType: 'info'
        };
      }

    render() {
        return (
            <View style={styles.container}>
                <View style={styles.menuList}>
                    <TouchableOpacity onPress={() => {this.chooseTab("info")}}>
                        <Text>课程详情</Text>
                    </TouchableOpacity>
                    <TouchableOpacity onPress={() => {this.chooseTab("cont")}}>
                        <Text>内容安排</Text>
                    </TouchableOpacity>
                </View>
 
                <View>
                     {this.contentTab()}
                </View>
 
            </View>
        );
    }
    

    // 选项卡头部 课程详情、内容安排、同学评价、更新日志
    chooseTab(e) {
        if(e!=this.state.changeType){
            this.setState({
                changeType: e,
            })
        }

    }

   // 选项卡内容切换
   contentTab() {
    if(this.state.changeType==='info') {
        return(
            <View >
               <Text>课程组合</Text>
            </View>
        )

    }else if(this.state.changeType==='cont') {
        return(
            <View >
                <Text >课程初识</Text>
            </View>
        )

    }
}

}
const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: '#dddddd',
    },
    menuList:{
        width:'80%',
        height:30,
        flexDirection:'row'
    },
    menuCount:{
        width:'80%',
        height:500,
        flex:1
    }

});