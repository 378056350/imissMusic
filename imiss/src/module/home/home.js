import {
  StyleSheet,
  Text,
  View,
  Button
} from 'react-native';
import React, { Component } from 'react'

export default class Home extends Component {
  
  static navigationOptions = {
    title: 'Home',
  };

  render() {
    const { navigate } = this.props.navigation;
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>
          Welcome to Hom123e!
        </Text>
        <Button 
          onPress={() => navigate('Music')}
          title="Learn More"
        />
        
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


