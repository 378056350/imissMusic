import '@CSS_PATH/tabbar.less';
import React from 'react';
import PropTypes from 'prop-types';
import { withStyles } from '@material-ui/core/styles';
import BottomNavigation from '@material-ui/core/BottomNavigation';
import BottomNavigationAction from '@material-ui/core/BottomNavigationAction';
import RestoreIcon from '@material-ui/icons/Restore';
import FavoriteIcon from '@material-ui/icons/Favorite';
import LocationOnIcon from '@material-ui/icons/LocationOn';

import Home from '@HOME_PATH/home';
import Sheet from '@SHEET_PATH/sheet';
import Mine from '@MINE_PATH/mine';


class SimpleBottomNavigation extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      value: 0,
    };
  }

  handleChange = (event, value) => {
    this.setState({ value });
  };

  _onChang = (event, value) => {
    this.setState({ value });
  }

  // 显示某个页面
  displayModule = () => {
    var index = this.state.value
    var arr = [];
    arr.push (<div className={index == 0 ? "module" : "module hide"}><Home/></div>)
    arr.push (<div className={index == 1 ? "module" : "module hide"}><Sheet/></div>)
    arr.push (<div className={index == 2 ? "module" : "module hide"}><Mine/></div>)
    return arr;
  }

  render() {
    const { classes } = this.props;
    const { value } = this.state;

    return (
      <div className="tabbar">
        <div className="content">
          {this.displayModule()}
        </div>
        <BottomNavigation
          value={value}
          onChange={this.handleChange}
          className={classes.root}
        >
          <BottomNavigationAction label="" icon={<RestoreIcon />} />
          <BottomNavigationAction label="" icon={<FavoriteIcon />} />
          <BottomNavigationAction label="" icon={<LocationOnIcon />} />
        </BottomNavigation>
      </div>
    );
  }
}


const styles = {
  root: {
    width: '100%',
    borderTop: '1px solid lightgray;'
  }
};

SimpleBottomNavigation.propTypes = {
  classes: PropTypes.object.isRequired,
};

export default withStyles(styles)(SimpleBottomNavigation);