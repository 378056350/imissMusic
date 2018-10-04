
// 首页Action
let actions = {
    // 首页数据
    homeRecommendData: ()=>({
        type: "homeRecommendData"
    }),
    // 轮播图
    homeImage: ()=>({
        type: "homeImage"
    }),
    // 主编推荐
    homeRecommend: ()=>({
        type: "homeRecommend"
    }),
    // 热门佳作
    homeHot: ()=>({
        type: "homeHot"
    }),
    // 完结推荐
    homeEditor: ()=>({
        type: "homeEditor"
    }),
}

export default actions;