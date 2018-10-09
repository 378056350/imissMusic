// import { takeEvery } from 'redux-saga'
import { call } from 'redux-saga/effects'
// import { call, put } from 'redux-saga/effects'

import { homeRecommendSaga } from './HomeRecommendSagas';

function* saga() {
  yield [
    call(homeRecommendSaga), 
  ]
}

export default saga;