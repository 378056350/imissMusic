import {
  StyleSheet,
  Text,
  View,
} from 'react-native';
import React, { Component } from 'react'
import Header from '@COMPONENT_PATH/header'

export default class About extends Component {
  static navigationOptions = ({ navigation, navigationOptions }) => {
    const { params } = navigation.state;
    if (params) {
      return {
        tabBarVisible: false
      }
    }
  }
  render() {
    return (
      <View style={styles.container}>
        <Header name={"About"}/>
        <Text style={styles.content}>没什么好说的, 要是有问题可以联系我: 378056350</Text>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: kColor_BG,
  },
  content: {
    marginLeft: 15,
    color: kColor_Text_Gary
  }
});


