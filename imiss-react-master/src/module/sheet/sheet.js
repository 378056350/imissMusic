import '@CSS_PATH/sheet.less'
import React, { Component } from 'react'
import { AdjustFont } from '@PUBLIC_PATH'

export default class Sheet extends Component {

  constructor(props) {
    super(props);
    this.state = {
      
    };
  }
  
  
  // 主视图
  render() {
    return (
      <div className="sheet">
        <div>sheet</div>
      </div>
    );
  }
}


