import '@CSS_PATH/mine.less'
import React, { Component } from 'react'
import PropTypes from 'prop-types'
import List from '@material-ui/core/List'
import ListItem from '@material-ui/core/ListItem'
import ListItemText from '@material-ui/core/ListItemText'
import ListItemSecondaryAction from '@material-ui/core/ListItemSecondaryAction'
import Divider from '@material-ui/core/Divider'
import IconButton from '@material-ui/core/IconButton'
import CommentIcon from '@material-ui/icons/Comment'
import Switch from '@material-ui/core/Switch'
import Header from '@COMPONENT_PATH/Header'
import Share from '@COMPONENT_PATH/Share'

import ReactIScroll from 'react-iscroll'
import iScroll from 'iscroll'

export default class mine extends Component {

  constructor(props) {
    super(props);
    this.state = {
      checked: ['night', 'screen'],
    };
  }

  componentDidMount = () => {
    
  }

  // 夜间模式 | 截屏后提示分享
  handleToggle = value => () => {
    const { checked } = this.state;
    const currentIndex = checked.indexOf(value);
    const newChecked = [...checked];

    if (currentIndex === -1) {
      newChecked.push(value);
    } else {
      newChecked.splice(currentIndex, 1);
    }

    this.setState({
      checked: newChecked,
    });
  };

  // 主视图
  render() {
    return (
      <div className="kk_mine">
        <Header name={"Mine"}/>
        {this.list()}
        <Share name={"邀请好友"} status={"Share"} ref={"invite"}/>
        <Share name={"分享"} status={"Invite"} ref={"share"}/>
      </div>
    );
  }
  // List
  list = () => {
    var list = []
    list.push (
      <Divider />
    )
    list.push (
      <div className="wrapper">
        <ReactIScroll iScroll={iScroll}
                      options={this.props.options}
                      onScrollStart={this.onScrollStart}>
          <List component="li">
        {/* 夜间模式 */}
        <ListItem>
          <ListItemText primary="夜间模式" className="name"/>
          <ListItemSecondaryAction>
            <Switch
              onChange={this.handleToggle('night')}
              checked={this.state.checked.indexOf('night') !== -1}
            />
          </ListItemSecondaryAction>
        </ListItem>
        {/* 寻找并邀请好友 */}
        <ListItem button component="div" onClick={()=>{this.refs.invite._onShowClick()}}>
          <ListItemText primary="寻找并邀请好友" />
          <ListItemSecondaryAction>
            <IconButton aria-label="Comments">
              <CommentIcon />
            </IconButton>
          </ListItemSecondaryAction>
        </ListItem>
        {/* 分享imiss */}
        <ListItem button component="div" onClick={()=>{this.refs.share._onShowClick()}}>
          <ListItemText primary="分享imiss" />
          <ListItemSecondaryAction>
            <IconButton aria-label="Comments">
              <CommentIcon />
            </IconButton>
          </ListItemSecondaryAction>
        </ListItem>
        {/* 关于 */}
        <ListItem button component="a" href="/About">
          <ListItemText primary="关于" />
          <ListItemSecondaryAction>
            <IconButton aria-label="Comments">
              <CommentIcon />
            </IconButton>
          </ListItemSecondaryAction>
        </ListItem>
      </List>
        </ReactIScroll>
      </div>
    )
    return list;
  }

}


