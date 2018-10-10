import '@CSS_PATH/home.less'
import React, { Component } from 'react'
import PropTypes from 'prop-types'
import Paper from '@material-ui/core/Paper'
import Tabs from '@material-ui/core/Tabs'
import Tab from '@material-ui/core/Tab'
import HomePopular from '@HOME_PATH/homePopular'
import HomeRecommend from '@HOME_PATH/homeRecommend'

export default class home extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      value: 0
    };
  }

  handleChange = (event, value) => {
    this.setState({ value });
  };

  render() {
    const { value } = this.state;
    return (
      <Paper className="kk_home">
        <Tabs
          value={this.state.value}
          onChange={this.handleChange}
          indicatorColor="primary"
          textColor="primary"
          centered
        >
          <Tab label="Popular" />
          <Tab label="Recommend" />
        </Tabs>
        {value === 0 && <HomePopular/>}
        {value === 1 && <HomeRecommend/>}
      </Paper>
    );
  }
}


