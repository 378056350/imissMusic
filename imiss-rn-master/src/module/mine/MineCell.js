import {
  StyleSheet,
  Text,
  View,
  Switch,
  Image
} from 'react-native';
import React, { Component } from 'react'

export default class MineCell extends Component {
  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.name}>{this.props.name}</Text>
        {this.props.isSwitch && <Switch/>}
        {!this.props.isSwitch && <Image style={styles.icon} source={require('@RESOURCE_PATH/img/next.png')}/>}
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    paddingLeft: 15,
    paddingRight: 15,
    height: 44,
    alignItems: 'center',
    justifyContent: 'space-between',
    flexDirection: 'row',
  },
  name: {
    fontSize: 14,
    fontWeight: '400',
    color: kColor_Text_Gary
  },
  icon: {
    width: 25,
    height: 25,
  }
});


