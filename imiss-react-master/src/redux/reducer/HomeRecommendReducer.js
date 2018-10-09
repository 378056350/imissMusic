
import Immutable from 'immutable';

// reducer  
const initialState = {  
    // 轮播图
    homeImage: [],
    // 分类
    homeCategory: [],
    // 主编推荐
    homeRecommend: [],
    // 热门佳作
    homeHot: [],
    // 完结推荐
    homeEditor: [],
}  


const reducer = (state = initialState, action) => {
    switch (action.type) {   
        case 'homeImage': {
            state = Immutable.fromJS(state);   //转成immutable
            state = state.merge({homeImage : action.homeImageJsons});
            return state.toJS()    // 转回原生js
        }  
        case 'homeCategory': {
            state = Immutable.fromJS(state);   //转成immutable
            state = state.merge({homeCategory : action.homeCategoryJsons});
            return state.toJS()    // 转回原生js
        }
        case 'homeRecommend': {
            state = Immutable.fromJS(state);   //转成immutable
            state = state.merge({homeRecommend : action.homeRecommendJsons});
            return state.toJS()    // 转回原生js
        }
        case 'homeHot': {
            state = Immutable.fromJS(state);   //转成immutable
            state = state.merge({homeHot : action.homeHotJsons});
            return state.toJS()    // 转回原生js
        }
        case 'homeEditor': {
            state = Immutable.fromJS(state);   //转成immutable
            state = state.merge({homeEditor : action.homeEditorJsons});
            return state.toJS()    // 转回原生js
        }
        default: 
            return state;  
    }  

}  

export default reducer;