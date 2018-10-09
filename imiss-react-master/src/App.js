import 'antd-mobile/dist/antd-mobile.css';
import React, { Component } from 'react';
import Tabbar from '@TABBAR_PATH/tabbar';
import Ranking from '@HOME_PATH/ranking';
import store from './redux/store/Store';
import { Provider } from 'react-redux';
import { BrowserRouter as Router, Route } from 'react-router-dom';

class App extends Component {
  render() {
    return (
      <Provider store={store}>
        <Router>
          <div>
            <Route path="/" component={Tabbar} />
            <Route path="/Ranking" component={Ranking} />
          </div>
        </Router>
      </Provider>
    );
  }
}

export default App;
