import {
  StyleSheet,
  Text,
  View
} from 'react-native';
import React, { Component } from 'react'

export default class Music extends Component {
  static navigationOptions = ({ navigation }) => ({
    title: 'Music',
    tabBarVisible: false,
  });
  // static navigationOptions = {
  //   title: 'Music',
  //   tabBarVisible: false 
  // };
  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>
          Welcome to Music!
        </Text>
        <Text style={styles.instructions}>
          To get started, edit App.js
        </Text>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: kColor_BG,
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});


