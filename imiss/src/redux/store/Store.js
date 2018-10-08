
import { createStore, applyMiddleware  } from 'redux';
import { createLogger } from 'redux-logger';
import thunk from 'redux-thunk';
import reducer from '../reducer/index';
import createSagaMiddleware from 'redux-saga';
import saga from '../saga/index';

// 中间件: redux-logger
const logger = createLogger({
  // 是否折叠打印日志
  collapsed: true,
  // 每个action持续时间
  duration: false,
  // 每个action时间戳
  timestamp: false,
  // 日志级别
  level : 'log',
  // 颜色
  colors: {
      // type颜色
      title: () => 'inherit',
      // prev state
      prevState: () => '#9E9E9E',
      // action
      action: () => '#03A9F4',
      // next state
      nextState: () => '#4CAF50',
      // error
      error: () => '#F20404',
  }
});
// 中间件: redux-saga
const sagaMiddleware = createSagaMiddleware();
// store
// const store = createStore(reducer, applyMiddleware(thunk, sagaMiddleware));
const store = createStore(reducer, applyMiddleware(thunk, sagaMiddleware, logger)); 
if (module.hot) {
    module.hot.accept('../reducer', () => {
      const nextRootReducer = require('../reducer/index');
      store.replaceReducer(nextRootReducer);
    });
}
// 监听saga
sagaMiddleware.run(saga);
export default store;