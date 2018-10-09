import '@CSS_PATH/mine.less'
import React, { Component } from 'react'
import { AdjustFont } from '@PUBLIC_PATH'
import { NavBar, List, Switch, Button } from 'antd-mobile'
import Cell from '@COMPONENT_PATH/Cell'

export default class mine extends Component {

  constructor(props) {
    super(props);
    this.state = {
      checked: false
    };
  }
  
  // 导航栏
  navbar = ()=>{
    return (
      <NavBar className="nav">
        账户
      </NavBar>
    )
  }

  // 头视图
  header = ()=>{
    return (
      <div className="header">
        <div className="login_none">
          <div className="name" style={{fontSize: AdjustFont(12)}}>登录imiss</div>
          <div className="desc" style={{fontSize: AdjustFont(12)}}>手机电脑端同步, 320k高音质无线下载</div>
          <Button className="login" inline size="large"><div style={{fontSize: '16px'}}>立即登录</div></Button>
        </div>
      </div>
    )
  }

  // Cell
  cell = (text)=>{
    return (
      <div className="cell">{text}</div>
    )
  }

  // 列表
  table = ()=>{
    return (
      <div className="table">
        <List renderHeader={()=>{}} className="my-list">
          <Cell 
            next={true} 
            name={"我的消息"}
            icon={"cm2_set_icn_mail@2x.png"}
            onClick={()=>{
              console.log("asdasdasda")
            }}
          />
        </List>

        <List renderHeader={() => ''} className="my-list">
          <Cell 
            next={true} 
            name={"设置"}
            icon={"cm2_set_icn_set@2x.png"}
          />
          <Cell 
            next={true} 
            name={"个性皮肤"}
            icon={"cm2_set_icn_skin@2x.png"}
          />
          <Cell 
            next={false} 
            name={"夜间模式"}
            icon={"cm2_set_icn_night@2x.png"}
            custom={<Switch 
                checked={this.state.checked}
                platform={"ios"}
                onChange={(checked)=>{
                  this.setState({
                    checked: checked
                  })
                }}
              />}
          />
          <Cell 
            next={true} 
            name={"定时关闭"}
            icon={"cm2_set_icn_time@2x.png"}
          />
        </List>

        <List renderHeader={() => ''} className="my-list">
          <Cell 
            next={true} 
            name={"分享imiss"}
            icon={"cm2_set_icn_share@2x.png"}
          />
          <Cell 
            next={true} 
            name={"关于"}
            icon={"cm2_set_icn_about@2x.png"}
          />
        </List>

        <List renderHeader={() => ''} renderFooter={() => ''} className="my-list">
          <Button><div className="quit">退出登录</div></Button>
        </List>
      
      </div>
    )
  }

  // 主视图
  render() {
    return (
      <div className="mine">
        {this.navbar()}
        {this.header()}
        {this.table()}
      </div>
    );
  }
}


