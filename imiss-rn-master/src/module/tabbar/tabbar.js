import {
  StyleSheet,
  Text,
  View,
  Image
} from 'react-native'
import React, { Component } from 'react'
import { createStackNavigator, createBottomTabNavigator } from 'react-navigation'
import Home from '@HOME_PATH/home'
import Sheet from '@SHEET_PATH/sheet'
import Mine from '@MINE_PATH/Mine'
import Music from '@MUSIC_PATH/music'

const HomeStack = createStackNavigator (
  { 
    Home: { 
      screen: Home,
      navigationOptions: {
        header: null
      }
    },
    Music: { 
      screen: Music,
      navigationOptions: {
        header: null
      }
    },
  },
  {
    mode: 'card',
    gesturesEnabled: 'false'
  }
);

const TabMainScreenNavigator = createBottomTabNavigator (
  {
    Home: { 
      screen: HomeStack,
      navigationOptions: {
        tabBarLabel: '首页',
        tabBarIcon: ({focused}) => (                
          <Image          
            source={focused == true ? require('@RESOURCE_PATH/img/cm4_btm_icn_music_prs.png') : require('@RESOURCE_PATH/img/cm4_btm_icn_music.png')}                
          />            
        )
      }
    },
    Sheet: { 
      screen: Sheet,
      navigationOptions: {
        tabBarLabel: '歌单',
        tabBarIcon: ({focused}) => (                
          <Image          
            source={focused == true ? require('@RESOURCE_PATH/img/cm4_btm_icn_discovery_prs.png') : require('@RESOURCE_PATH/img/cm4_btm_icn_discovery.png')}                
          />            
        )
      }
    },
    Mine: { 
      screen: Mine,
      navigationOptions: {
        tabBarLabel: '我的',
        tabBarIcon: ({focused}) => (                
          <Image          
            source={focused == true ? require('@RESOURCE_PATH/img/cm4_btm_icn_account_prs.png') : require('@RESOURCE_PATH/img/cm4_btm_icn_account.png')}                
          />            
        )
      }
    },
  },
  {
    tabBarPosition: 'bottom',
    animationEnabled: true,
    tabBarOptions: {
      activeTintColor: MainColor,
      showIcon: true,
      showLabel: false,
      tabStyle: {
        backgroundColor: kColor_BG,
      }, 
    }, 
  }
);
export default TabMainScreenNavigator;
