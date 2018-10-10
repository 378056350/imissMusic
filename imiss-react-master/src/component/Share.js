import React, { Component, PureComponent } from 'react'
import PropTypes from 'prop-types'
import Modal from '@material-ui/core/Modal'

export default class Share extends PureComponent {

  constructor(props) {
    super(props);
    this.state = {
      openShare: false,
    };
  }

  // 显示
  _onShowClick = () => {
    this.setState({ openShare: true });
  }
  // 隐藏
  _closeShare = () => {
    this.setState({ openShare: false });
  }

  // 数据
  render() {
    return (
      <Modal
        aria-labelledby="simple-modal-title"
        aria-describedby="simple-modal-description"
        open={this.state.openShare}
        onClose={this._closeShare}
        style={styles.share}
      >
        <div style={styles.shareContent}>
          <div style={styles.shareName}>{this.props.name}</div>
          {this.sharePlatform()}
          <div style={styles.shareName} onClick={this._closeShare}>取消</div>
        </div>
      </Modal>
    )
  }
  // 分享平台
  sharePlatform = () => {
    var arr = [];
    for (var i=0; i<6; i++) {
      arr.push (
        <div style={styles.sharePlatform}>
          <div style={styles.sharePlatformContent}>
            <img style={styles.sharePlatformIcon}/>
            <div style={styles.sharePlatformName}>asd</div>
          </div>
        </div>
      )
    }
    return arr;
  }
}

const styles = {
  share: {
    position: 'absolute',
    width: '100%',
    bottom: 0,
    justifyContent: 'center',

    display: 'flex',
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center'
  },
  shareContent: {
    width: 200,
    backgroundColor: 'white',
    flexDirection: 'row',
    flexWrap: 'wrap',
    display: 'inline-block',
    borderRadius: '5px',
  },
  shareName: {
    width: 200,
    height: 35,
    textAlign: 'center',
    lineHeight: '30px',
    color: 'gray',
    fontSize: 14,
  },
  sharePlatform: {
    width: 200 / 3,
    display: 'inline-block',
    borderTopColor: 'lightGray',
    botderTopWidth: 1,
  },
  sharePlatformContent: {
    display: 'flex',
    flexDirection: 'column',
    justifyContent: 'center',
    alignItems: 'center',
    paddingTop: 5,
    paddingBottom: 5
  },
  sharePlatformIcon: {
    width: 30,
    height: 30,
  },
  sharePlatformName: {
    fontSize: 14,
    color: 'gray',
    fontSize: 12,
  }
}

Share.defaultProps = {
  name: '',
  status: 'Share'
};

Share.propTypes = {
  name: PropTypes.string.isRequired,
  status: PropTypes.oneOf(['Share', 'Invite']),
};




