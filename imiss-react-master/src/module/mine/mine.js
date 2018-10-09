import '@CSS_PATH/mine.less'
import React, { Component } from 'react'
import PropTypes from 'prop-types'
import List from '@material-ui/core/List'
import ListItem from '@material-ui/core/ListItem'
import ListItemText from '@material-ui/core/ListItemText'
import Divider from '@material-ui/core/Divider'
import IconButton from '@material-ui/core/IconButton'
import CommentIcon from '@material-ui/icons/Comment'
import Switch from '@material-ui/core/Switch'
import ListItemSecondaryAction from '@material-ui/core/ListItemSecondaryAction'
import Header from '@COMPONENT_PATH/Header'
import Modal from '@material-ui/core/Modal'
import Typography from '@material-ui/core/Typography'

export default class mine extends Component {


  constructor(props) {
    super(props);
    this.state = {
      checked: ['night', 'screen'],
      openShare: false
    };
  }

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

  // 分享
  _onShareClick = () => {
    this.setState({ openShare: true });
  }
  _closeShare = () => {
    this.setState({ openShare: false });
  }

  // 主视图
  render() {
    return (
      <div className="kk_mine">
        {this.header()}
        {this.list()}
        {this.model()}
      </div>
    );
  }
  // Header
  header = () => {
    return (
      <Header name={"AAAA"}/>
    )
  }
  // List
  list = () => {
    var list = []
    list.push (
      <Divider />
    )
    list.push (
      <List component="li" className={"list"}>
        <ListItem>
          <ListItemText primary="夜间模式" className="name"/>
          <ListItemSecondaryAction>
            <Switch
              onChange={this.handleToggle('night')}
              checked={this.state.checked.indexOf('night') !== -1}
            />
          </ListItemSecondaryAction>
        </ListItem>
        <ListItem>
          <ListItemText primary="截屏后提示分享" />
          <ListItemSecondaryAction>
            <Switch
              onChange={this.handleToggle('screen')}
              checked={this.state.checked.indexOf('screen') !== -1}
            />
          </ListItemSecondaryAction>
        </ListItem>
        <ListItem button component="a" href="#simple-list">
          <ListItemText primary="寻找并邀请好友" />
          <ListItemSecondaryAction>
            <IconButton aria-label="Comments">
              <CommentIcon />
            </IconButton>
          </ListItemSecondaryAction>
        </ListItem>
        <ListItem button component="div" onClick={this._onShareClick}>
          <ListItemText primary="分享imiss" />
          <ListItemSecondaryAction>
            <IconButton aria-label="Comments">
              <CommentIcon />
            </IconButton>
          </ListItemSecondaryAction>
        </ListItem>
        <ListItem button component="a" href="/About">
          <ListItemText primary="关于" />
          <ListItemSecondaryAction>
            <IconButton aria-label="Comments">
              <CommentIcon />
            </IconButton>
          </ListItemSecondaryAction>
        </ListItem>
      </List>
    )
    return list;
  }
  // Modal
  model = () => {
    const { classes } = this.props;
    return (
      <Modal
        aria-labelledby="simple-modal-title"
        aria-describedby="simple-modal-description"
        open={this.state.openShare}
        onClose={this._closeShare}
      >
        <div style={styles.share}>
          <div style={styles.shareContent}>
            {this.shareItem()}
          </div>
          <div style={styles.shareCancle}>
            取消
          </div>
        </div>
      </Modal>
    )
  }
  // 分享
  shareItem = () => {
    var arr = [];
    for (var i=0; i<30; i++) {
      arr.push (
        <div style={styles.shareItem}>
          <img style={styles.shareItemIcon}/>
          <div style={styles.shareItemName}>asd</div>
        </div>
      )
    }
    return arr;
  }

}


const styles = {
  // 分享框
  share: {
    position: 'absolute',
    width: '100%',
    backgroundColor: 'white',
    bottom: 0,
    boxShadow: '10px 10px 5px #888888',
    justifyContent: 'center',
  },
  // 分享内容框
  shareContent: {
    flexDirection: 'row',
    display: 'flex',
    width: '100%',
    width: '100%',
    height: '100%',
    overflowX: 'scroll',
    overflowY: 'hidden',
    backgroundColor: 'white'
  },
  // 分享控件
  shareItem: {

  },
  shareItemIcon: {
    width: 130,
    height: 30,
    backgroundColor: 'yellowgreen',
    marginTop: 10,
    marginBottom: 3,
  },
  shareItemName: {
    textAlign: 'center',
    textSize: 14,
    color: 'gray',
  },
  // 分享取消按钮
  shareCancle: {
    width: '100%',
    height: '40px',
    backgroundColor: 'white',
    textAlign: 'center',
    lineHeight: '40px',
    borderBottomColor: 'lightGray',
    borderBottomWidth: 0.5,
    color: 'gray',
    fontSize: 16,
  }
}



