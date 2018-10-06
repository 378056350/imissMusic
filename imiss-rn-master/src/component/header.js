import {
  StyleSheet,
  Text,
  View,
  Button
} from 'react-native';
import React, { Component } from 'react'

export default class Header extends Component {
  
  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.name}>Header</Text>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    width: SCREEN_WIDTH,
    height: NavigationBarHeight,
    justifyContent: 'center',
  },
  name: {
    marginTop: StatusBarHeight,
    fontSize: 20,
    marginLeft: 15,
    color: kColor_Text_Gary
  }
});


