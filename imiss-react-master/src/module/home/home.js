import '@CSS_PATH/home.less'
// import { Link } from "react-router-dom";
import React, { Component } from 'react'
import { InputItem, Carousel, WingBlank } from 'antd-mobile';
import Server from '../../network/server';

export default class home extends Component {

  constructor(props, context) {
    super(props, context);
    this.state = {
      data: ['1', '2', '3'],
      imgHeight: 176,
    };
  }

  componentDidMount() {
    
  }

  //============================ 点击 ============================//
  onItemClick = (index)=>{
    
  }

  //============================ 界面 ============================//
  // 导航栏
  navbar = ()=>{
    return (
      <div className="nav">
      
      </div>
    )
  }
  render() {
    return (
      <div className="home">
        {this.navbar()}
      </div>
    )
  }
}


