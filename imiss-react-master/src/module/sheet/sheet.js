import '@CSS_PATH/sheet.less'
import React, { Component } from 'react'
import { AdjustFont } from '@PUBLIC_PATH'
import { NavBar, List, Switch, Button } from 'antd-mobile'
import Cell from '@COMPONENT_PATH/Cell'

export default class Sheet extends Component {

  constructor(props) {
    super(props);
    this.state = {
      
    };
  }
  
  // 导航栏
  navbar = ()=>{
    return (
      <NavBar className="nav">
      </NavBar>
    )
  }

  


  // 主视图
  render() {
    return (
      <div className="mine">
        {this.navbar()}
      </div>
    );
  }
}


