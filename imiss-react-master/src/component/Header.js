import React, { Component } from 'react';
import PropTypes from 'prop-types';
import '@CSS_PATH/header.less';

class Header extends Component {

  backButton = () => {
    return (
      <img className="icon" onClick={this.props.onBackClick}/>
    )
  }
  nameLab = () => {
    return (
      <div className="name" onClick={this.props.onBackClick}>{this.props.name}</div>
    )
  }
  render() {
    return (
      <div className="kk_header">
        {this.props.showBack == true && this.backButton()}
        {this.nameLab()}
      </div>
    )
  }
}

Header.defaultProps = {
  name: '',
  showBack: false,
  onBackClick: ()=>{},
};

Header.propTypes = {
  name: PropTypes.string.isRequired,
  showBack: PropTypes.bool.isRequired,
  onBackClick: PropTypes.func,
};

export default Header;

