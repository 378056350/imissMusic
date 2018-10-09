import { combineReducers } from 'redux';
import HomeRecommendReducer from './HomeRecommendReducer';

const rootReducer = combineReducers({
    HomeRecommendReducer: HomeRecommendReducer,
});

export default rootReducer;

