import '@CSS_PATH/mine.less'
import React, { Component } from 'react'
import { AdjustFont } from '@PUBLIC_PATH'
import Header from '@COMPONENT_PATH/Header'

export default class mine extends Component {

  constructor(props) {
    super(props);
    this.state = {
      
    };
  }
  
  // 主视图
  render() {
    return (
      <div className="kk_mine">
        <Header name={"AAAA"}/>
      </div>
    );
  }
}


