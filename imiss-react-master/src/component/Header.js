import React, { Component } from 'react';
import PropTypes from 'prop-types';
import '@CSS_PATH/header.less';

class Header extends Component {

  render() {
    return (
      <div className="kk_header">
        {this.props.name}
      </div>
    )
  }
}

Header.defaultProps = {
  name: ''
};

Header.propTypes = {
  name: PropTypes.string.isRequired
};

export default Header;

