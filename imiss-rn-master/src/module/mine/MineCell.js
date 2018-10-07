import {
  StyleSheet,
  Text,
  View,
  Switch,
  Image,
  TouchableHighlight
} from 'react-native';
import PropTypes from 'prop-types';
import React, { Component } from 'react'

export default class MineCell extends Component {
  render() {
    return (
      <TouchableHighlight 
        underlayColor={kColor_BG_Dark} 
        style={styles.touch}
        onPress={this.props.canOnPress == true ? this.props.onPress : null}
      >
        <View style={styles.container}>
          <Text style={styles.name}>{this.props.name}</Text>
          {this.props.isSwitch && <Switch/>}
          {!this.props.isSwitch && <Image style={styles.icon} source={require('@RESOURCE_PATH/img/next.png')}/>}
        </View>
      </TouchableHighlight>
    );
  }
}

const styles = StyleSheet.create({
  touch: {
    width: SCREEN_WIDTH, 
    height: 44,
  },
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


MineCell.propTypes = {
  name: PropTypes.string,
  isSwitch: PropTypes.bool,
  canOnPress: PropTypes.bool,
  onPress: PropTypes.func,
};
MineCell.defaultProps = {
  name: '',
  isSwitch: true,
  canOnPress: true,
  onPress: ()=>{}
};

