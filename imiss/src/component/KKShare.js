import {
  StyleSheet,
  Text,
  View,
  Button,
  Modal,
  Animated
} from 'react-native';
import React, { Component } from 'react'

export default class KKShare extends Component {
  
  render() {
    return (
      <Modal
        animationType="fade"
        transparent={true}
        visible={true}
        onRequestClose={() => {
          alert("Modal has been closed.");
        }}
      >
        <View style={styles.container}>
          <View style={styles.content}>
          
          </View>
        </View>
      </Modal>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    width: SCREEN_WIDTH,
    height: SCREEN_HEIGHT,
    backgroundColor: 'rgba(0,0,0,0.3)'
  },
  content: {

  }
});


