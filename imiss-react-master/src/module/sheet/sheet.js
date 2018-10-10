import '@CSS_PATH/sheet.less'
import React, { Component } from 'react'
import Header from '@COMPONENT_PATH/Header'

import ReactIScroll from 'react-iscroll'
import iScroll from 'iscroll'

export default class Sheet extends Component {

  constructor(props) {
    super(props);
    this.state = {
      
    };
  }
  
  // 主视图
  render() {
    return (
      <div className="kk_sheet">
        <Header name={"Sheet"}/>
        {this.sheet()}
        {this.list()}
      </div>
    );
  }
  // 歌单
  sheet = () => {
    var arr = []
    for (var i=0; i<200; i++) {
      arr.push (
        <div className="content">
          <img/>
        </div>
      )
    }
    return (
      <div>
        <ReactIScroll iScroll={iScroll}
                      options={{mouseWheel: true, scrollbars: false, scrollX: true}}
                      onScrollStart={this.onScrollStart}>
          <div className="sheet" style={{width: 1000}}>
            {arr}
          </div>
        </ReactIScroll>
      </div>
    )
  }
  // 歌曲列表
  list = () => {
    return (
      <div className="wrapper">
        <ReactIScroll iScroll={iScroll}
                      options={this.props.options}
                      onScrollStart={this.onScrollStart}>
          <div className="list">
            <div>aasdsada</div>
            <div>aasdsada</div>
            <div>aasdsada</div>
            <div>aasdsada</div>
            <div>aasdsada</div>
            <div>aasdsada</div>
            <div>aasdsada</div>
            <div>aasdsada</div>
            <div>aasdsada</div>
            <div>aasdsada</div>
            <div>aasdsada</div>
            <div>aasdsada</div>
            <div>aasdsada</div>
            <div>aasdsada</div>
            <div>aasdsada</div>
            <div>aasdsada</div>
            <div>aasdsada</div>
            <div>aasdsada</div>
            <div>aasdsada</div>
            <div>aasdsada</div>
            <div>aasdsada</div>
            <div>aasdsada</div>
            <div>aasdsada</div>
            <div>aasdsada</div>
            <div>aasdsada</div>
            <div>aasdsada</div>
            <div>aasdsada</div>
            <div>aasdsada</div>
            <div>aasdsada</div>
            <div>aasdsada</div>
            <div>aasdsada</div>
            <div>aasdsada</div>
            <div>aasdsada</div>
            <div>aasdsada</div>
            <div>aasdsada</div>
            <div>13</div>
          </div>
        </ReactIScroll>
      </div>
    )
  }
}


