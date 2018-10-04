import {
  StyleSheet,
  Text,
  View
} from 'react-native';
import React, { Component } from 'react';
import { Provider } from 'react-redux';
import Tabbar from '@TABBAR_PATH/tabbar';
import store from '@STORE_PTAH/Store';

export default class App extends Component {
  render() {
    return (
      <Provider store={store}>
        <Tabbar/>
      </Provider>
    );
  }
}