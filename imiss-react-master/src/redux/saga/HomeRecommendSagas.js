// import { takeEvery, takeLatest } from 'redux-saga'
import { takeLatest } from 'redux-saga'
// import { call, put } from 'redux-saga/effects'
// // 请求
// import { 
//   homeImage,
//   homeCategory,
//   homeRecommend,
//   homeHot,
//   homeEditor
// } from '../../service/HomeApi';

function* homeRecommendData() {
  // // 轮播图, 分类
  // const [image, category] = yield [call(homeImage), call(homeCategory)];
  // yield put({type: 'homeImage', homeImageJsons: image});
  // yield put({type: 'homeCategory', homeCategoryJsons: category});
  // // 推荐
  // const recommend = yield call(homeRecommend);
  // yield put({type: 'homeRecommend', homeRecommendJsons: recommend});
  // // 热门
  // const hot = yield call(homeHot);
  // yield put({type: 'homeHot', homeHotJsons: hot});
  // // 完结
  // const editor = yield call(homeEditor);
  // yield put({type: 'homeEditor', homeEditorJsons: editor});
}

export function* homeRecommendSaga() {
  yield* takeLatest("homeRecommendData", homeRecommendData);
}
