import {
  StyleSheet,
  Text,
  View,
  Switch
} from 'react-native';
import React, { Component } from 'react'

export default class MineFooter extends Component {
  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.name}>asdasdasdasdasdasdasdasdasd</Text>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    marginLeft: 15,
    alignItems: 'center',
    justifyContent: 'space-between',
    borderTopWidth: 0.5,
    borderTopColor: kColor_Line_Night,
  },
  name: {
    fontSize: 12,
    fontWeight: '300',
    marginTop: 5,
    color: kColor_Text_Gary,
    alignSelf: 'flex-start'
  }
});


