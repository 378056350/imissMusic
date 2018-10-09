import '@CSS_PATH/home.less'
import { Link } from "react-router-dom";
import React, { Component } from 'react'
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
        <div>asd</div>
        <Link to='/Ranking'>asdasdsadas</Link>
      </div>
    )
  }
}


