import {
  StyleSheet,
  Text,
  View,
  Button
} from 'react-native';
import React, { Component } from 'react'
import PropTypes from 'prop-types'

export default class Header extends Component {
  
  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.name}>{this.props.name}</Text>
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

Header.propTypes = {
  name: PropTypes.string,
};
Header.defaultProps = {
  name: '',
};

