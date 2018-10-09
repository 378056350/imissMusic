import '@CSS_PATH/account.less'
import React, { Component } from 'react'
import { MainColor } from '@PUBLIC_PATH'
import { NavBar, List } from 'antd-mobile';
import Cell, {Status} from '@COMPONENT_PATH/Cell'

export default class account extends Component {

  nav = ()=>{
    return (
      <NavBar
        style={{backgroundColor: MainColor}}
        mode="dark"
      >我的</NavBar>
    )
  }
  sectionHeader = ()=>{
    return (
      <div className={"section"}>
        我创建的歌单
        <img alt={""}/>
      </div>
    )
  }
  table = ()=>{
    return (
      <div className="table">
        <List renderHeader={()=>{}} className="my-list">
          <Cell 
            next={true} 
            icon={"cm2_set_icn_mail@2x.png"}
            name={"本地音乐"}
            detail={"1"}
            onClick={()=>{
              console.log("asdasdasda")
            }}
          />
          <Cell 
            next={true} 
            icon={"cm2_set_icn_mail@2x.png"}
            name={"最近播放"}
            detail={"1"}
            onClick={()=>{
              console.log("asdasdasda")
            }}
          />
        </List>

        <List renderHeader={this.sectionHeader()} className="my-list">
          <Cell 
            name={"设置"}
            icon={"cm2_set_icn_set@2x.png"}
            status={Status.detail}
          />
          <Cell 
            name={"个性皮肤"}
            icon={"cm2_set_icn_skin@2x.png"}
            status={Status.detail}
          />
        </List>

      
      </div>
    )
  }
  recommend = ()=>{
    var arr = []
    for (var i=0; i<3; i++) {
      arr.push(
        <div className="grid_item">
          <img src={require('@IMAGE_PATH/placeholder_square.png')} alt={""}/>
          <div>AAAAAAAABBBBBBBB啊</div>
        </div>
      )
    }
    return (
      <div className="grid">
        {arr}
      </div>
    )
  }

  render() {
    return (
      <div className={"account"}>
        {this.nav()}
        {this.table()}
        <div className="recommend">
          <div className="name">推荐歌单</div>
          {this.recommend()}
        </div>
      </div>
    )
  }
}


