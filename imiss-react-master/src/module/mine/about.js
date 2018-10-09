import '@CSS_PATH/about.less'
import React, { Component } from 'react'
import Header from '@COMPONENT_PATH/Header'

export default class about extends Component {

  constructor(props) {
    super(props);
    this.state = {
      
    };
  }
  // 返回
  _onBackclick = () => {
    this.props.history.goBack()
  }
  // 主视图
  render() {
    return (
      <div className="kk_about">
        <Header name={"关于"} showBack={true} onBackClick={this._onBackclick}/>
        <div className="content">没什么好说的, 烦, 看谁都烦</div>
      </div>
    );
  }
}
