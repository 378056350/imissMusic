import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { Button } from 'antd-mobile';
import '@CSS_PATH/cell.less';

export const Status = {
  default: 1,
  detail: 2,
} 

class Cell extends Component {

  left = ()=>{
    return (
      <div className="left">
        {this.props.icon.length !== 0 && <img className="icon" src={require("@IMAGE_PATH/" + this.props.icon)} alt=""/>} 
        {/* 单行 */}
        {this.props.status === Status.default &&
          <div className="name_content">
            <div className="name">{this.props.name}</div>
          </div>
        }
        {/* 双行 */}
        {this.props.status === Status.detail && 
          <div className="name_content">
            <div className="name1">{this.props.name}</div>
            <div className="name2">{this.props.name}</div>
          </div>
        }
      </div>
    )
  }

  right = ()=>{
    return (
      <div className="right">
          {this.props.custom === null && <div className="detail">{this.props.detail}</div>}
          {this.props.custom !== null && this.props.custom}
          {this.props.custom !== null && this.props.next !== false && <div className="padding"/>}
          {this.props.next === true && <img className="next" src={require("@IMAGE_PATH/next.png")} alt=""/>} 
        </div>
    )
  }

  render() {
    return (
      <Button className="kk_cell" onClick={this.props.onClick}>
        <div className="kk_content">
          {this.left()}
          {this.right()}
        </div>
      </Button>
    )
  }
}

Cell.defaultProps = {
  name: '',
  detail: '',
  icon: '',
  next: false,
  custom: null,
  status: Status.default
};

Cell.propTypes = {
  name: PropTypes.string,
  detail: PropTypes.string,
  icon: PropTypes.string,
  next: PropTypes.bool,
  custom: PropTypes.object,
  status: PropTypes.oneOf([Status.default, Status.detail])
};

export default Cell;

