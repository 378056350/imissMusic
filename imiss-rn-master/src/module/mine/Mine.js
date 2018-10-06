import {
  StyleSheet,
  Text,
  View,
  SectionList
} from 'react-native';
import React, { Component } from 'react'
import Header from '@COMPONENT_PATH/header'
import MineCell from '@MINE_PATH/MineCell'
import MineFooter from '@MINE_PATH/MineFooter'

export default class Mine extends Component {

  data = ()=>{
    names = [
      {data: [
        {name: "夜间模式", isSwitch: true}]
      },
      {data: [
        {name: "截屏后提示分享", isSwitch: true},
        {name: "寻找并邀请好友", isSwitch: false},
        {name: "分享imiss", isSwitch: false},
        {name: "关于", isSwitch: false}]
      },
    ]
    return names;
  }

  render() {
    return (
      <View style={styles.table}>
        <Header/>
        <SectionList
          renderItem={({ item, index, section }) => <MineCell name={item.name} isSwitch={item.isSwitch}/>}
          renderSectionHeader={({ section: { title } }) => (
            <View style={{height: 20}}/>
          )}
          sections={this.data()}
          keyExtractor={(item, index) => item + index}
          ListFooterComponent={()=><MineFooter/>}
        />
      </View>
    );
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
});


