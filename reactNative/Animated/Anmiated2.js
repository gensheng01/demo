import React from 'react';
import {
    View,
    Animated,
    StyleSheet,
    Easing,
} from 'react-native';


export default class Test extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            spin: new Animated.Value(0),
            animatedValue: new Animated.Value(0),
        }
    }

    componentDidMount() {
        this._spin();
        this._twoAnimate();
    }

    _spin() {
        this.state.spin.setValue(0);
        Animated.timing(
            this.state.spin,
            {
                toValue: 1,
                duration: 4000,
                easing: Easing.linear
            }
        ).start(() => this._spin());
    }

    _twoAnimate() {
        this.state.animatedValue.setValue(0);
        Animated.timing(
            this.state.animatedValue, {
                toValue: 1,
                duration: 2000,
                easing: Easing.linear
            }
        ).start(() => this._twoAnimate());
    }

    render() {
        const spin = this.state.spin.interpolate({
            inputRange: [0, 1],
            outputRange: ['0deg', '360deg']
        });

        const rmarginLeft = this.state.animatedValue.interpolate({
            inputRange: [0, 1],
            outputRange: [0, 300]
        });
        const ropacity = this.state.animatedValue.interpolate({
            inputRange: [0, 0.5, 1],
            outputRange: [0, 1, 0],
        });
        const rmoveMargin = this.state.animatedValue.interpolate({
            inputRange: [0, 0.5, 1],
            outputRange: [0, 300, 0]
        });
        const rtextSize = this.state.animatedValue.interpolate({
            inputRange: [0, 0.5, 1],
            outputRange: [16, 32, 16]
        });
        const rrotateX = this.state.animatedValue.interpolate({
            inputRange: [0, 0.5, 1],
            outputRange: ['0deg', '180deg', '0deg']
        });

        return (
            <View style={{flex: 1, marginTop: 44}}>
                {/* <Animated.Image
                    style={{
                        transform: [{rotate: spin}]
                    }}
                    source={require('./img/a.jpg')}/> */}


                <Animated.View style={{
                    backgroundColor: 'green',
                    marginVertical: 10,
                    marginLeft: rmarginLeft,
                    width: 30,
                    height: 30
                }}/>
                <Animated.View style={{
                    backgroundColor: 'black',
                    marginVertical: 10,
                    opacity: ropacity,
                    width: 30,
                    height: 30
                }}/>
                <Animated.View style={{
                    backgroundColor: 'red',
                    marginVertical: 10,
                    transform: [{rotateX: rrotateX}],
                    width: 30,
                    height: 30
                }}/>
                <Animated.View style={{
                    backgroundColor: 'blue',
                    marginVertical: 10,
                    transform: [{translateX: rmoveMargin}],
                    width: 30,
                    height: 30
                }}/>


                <Animated.Text
                    style={{fontSize: rtextSize}}
                    onPress={() => {
                        alert('zuhe')
                    }}>组合动画</Animated.Text>
            </View>)
    }


}

const styles = StyleSheet.create({
    text: {
        marginVertical: 15
    },
    container: {
        width: 375,
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: 'green',
        //  height:50
    },
})