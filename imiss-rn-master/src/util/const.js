
import { Dimensions, Platform, PixelRatio } from 'react-native'

var fontScale = PixelRatio.getFontScale();
var pixelRatio = PixelRatio.get();
// 获取屏幕的dp
var screenW = Dimensions.get('window').width;
var screenH = Dimensions.get('window').height;
// 根据dp获取屏幕的px
var screenPxW = PixelRatio.getPixelSizeForLayoutSize(screenW);
var screenPxH = PixelRatio.getPixelSizeForLayoutSize(screenH);
// 高保真的宽度和告诉
const designWidth = 750.0;
const designHeight = 1334.0;

/**
 * 设置text
 * @param size  px
 * @returns {Number} dp
 */
export function setSpText(size) {
    console.log("screenW======"+screenW)
    console.log("screenPxW======"+screenPxW)
    var scaleWidth = screenW / designWidth;
    var scaleHeight = screenH / designHeight;
    var scale = Math.min(scaleWidth, scaleHeight);
    size = Math.round(size * scale/fontScale + 0.5);
    return size;
}

/**
 * 设置高度
 * @param size  px
 * @returns {Number} dp
 */
export function scaleSizeH(Number) {
    var scaleHeight = size * screenPxH / designHeight;
    size = Math.round((scaleHeight / pixelRatio + 0.5));
    return size;
}

/**
 * 设置宽度
 * @param size  px
 * @returns {Number} dp
 */
export function scaleSizeW(Number) {
    var scaleWidth = size * screenPxW / designWidth;
    size = Math.round((scaleWidth/pixelRatio + 0.5));
    return size;
}

/**
 * 设备是否为iphoneX
 * @returns {Boolean}
 */
export function isIphoneX() {
    const X_WIDTH = 375
    const X_HEIGHT = 812
    return (
        Platform.OS === 'ios' &&
        ((screenH === X_HEIGHT && screenW === X_WIDTH) ||
         (screenH === X_WIDTH && screenW === X_HEIGHT))
    )
}

global.StatusBarHeight = isIphoneX() ? 44 : 20;
global.NavigationBarHeight = 44 + StatusBarHeight;
global.SafeAreaBottomHeight = isIphoneX() ? 34 : 0;
global.TabbarHeight = isIphoneX() ? 49 + SafeAreaBottomHeight : 49;

global.SCREEN_WIDTH = screenW;
global.SCREEN_HEIGHT = screenH;

global.MainColor = '#FE6E6F';
global.kColor_BG = '#F5F5F5';
global.kColor_BG_Dark = '#F1F1F1';
global.kColor_Text_Black = '#231815';
global.kColor_Text_Gary = '#999999';
global.kColor_Text_Light = '#8B8B8B';

global.kColor_Line_Night = '#F9F9F9';

