import {
  StyleSheet,
  Text,
  View,
  SectionList,
  Modal,
  ScrollView,
  Image
} from 'react-native';
import React, { Component } from 'react'
import PropTypes from 'prop-types'
import Header from '@COMPONENT_PATH/header'
import MineCell from '@MINE_PATH/MineCell'
import MineFooter from '@MINE_PATH/MineFooter'
import KKShare from '@COMPONENT_PATH/KKShare'

export default class Mine extends Component {

  constructor(props) {
    super(props);
    this.state = {
      
    }
  }
  // models
  data = ()=>{
    names = [
      {section: 0, data: [
        {name: "夜间模式", isSwitch: true}]
      },
      {section: 1, data: [
        {name: "截屏后提示分享", isSwitch: true},
        {name: "寻找并邀请好友", isSwitch: false},
        {name: "分享imiss", isSwitch: false},
        {name: "关于", isSwitch: false}]
      },
    ]
    return names;
  }
  // 主界面
  render() {
    // ['mine_share_wzone', 'mine_share_wc', 
    //  'mine_share_zone', 'mine_share_qq', 
    //  'mine_share_wb', 'mine_share_link']

    return (
      <View style={styles.table}>
        <Header name={"Mine"}/>
        <SectionList
          renderItem={({ item, index, section }) => (
            <MineCell 
              name={item.name} 
              isSwitch={item.isSwitch}
              canOnPress={section.section == 1 && index >= 1}
              onPress={()=>this._onItemClick(section, index)}
            />
          )}
          renderSectionHeader={({ section: { title } }) => (
            <View style={{height: 20}}/>
          )}
          sections={this.data()}
          keyExtractor={(item, index) => item + index}
          ListFooterComponent={()=><MineFooter/>}
        />
      </View>
      // <View style={styles.container}>
      //   <View style={styles.content}>
      //     <ScrollView 
      //       style={styles.scroll}
      //       horizontal={true}
      //     >
      //       {this.createItem()}
      //       {this.createItem()}
      //       {this.createItem()}
      //       {this.createItem()}
      //       {this.createItem()}
      //       {this.createItem()}
      //     </ScrollView>
      //   </View>
      // </View>
    );
  }

  _onItemClick = (section, index)=>{
    if (section.section == 0) {

    }
    else if (section.section == 1) {
      if (index == 0) {
        
      }
      else if (index == 1) {
        
      }
      else if (index == 2) {
        
      }
      // 关于
      else if (index == 3) {
        const { navigate } = this.props.navigation;
        navigate('About');
      }
    }
  }

  createItem = ()=>{
    return (
      <View style={styles.item}>
        <Image style={styles.icon} source={require('@RESOURCE_PATH/img/mine_share_wzone.png')}/>
        <Text style={styles.name}>123</Text>
      </View>
    )
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    backgroundColor: kColor_BG,
  },
  table: {
    flex: 1,
    backgroundColor: kColor_BG,
  }

  // container: {
  //   flex: 1,
  //   backgroundColor: 'red',
  //   // width: SCREEN_WIDTH,
  //   // height: SCREEN_HEIGHT,
  //   justifyContent: 'flex-end',
  //   // backgroundColor: 'rgba(0,0,0,0.3)'
  // },
  // content: {
  //   width: SCREEN_WIDTH,
  //   height: 140,
  //   backgroundColor: 'white',
  // },
  // scroll: {
  //   width: SCREEN_WIDTH,
  //   height: 30,
  //   backgroundColor: 'orange',
  // },
  // item: {
  //   width: SCREEN_WIDTH / 4.5,
  //   height: 100,
  //   backgroundColor: 'red',
  //   alignItems: 'center',
  //   justifyContent: 'center'
  // },
  // icon: {
  //   width: SCREEN_WIDTH / 4.5 / 2,
  //   height: SCREEN_WIDTH / 4.5 / 2,
  //   backgroundColor: 'orange'
  // },
  // name: {
  //   marginTop: 5,
  // }
});


