

export const MainColor = '#EE2C2C';
export const kColor_Text_Black = 'rgba(35, 24, 21, 1)';
export const kColor_Text_Gary = '#999999';
export const kColor_Text_White = 'rgba(255, 255, 255, 1)';
export const kColor_BG = 'rgba(245, 245, 245, 1)';


export const SCREEN_WIDTH = document.body.clientWidth;
export const SCREEN_HEIGHT = document.body.clientHeight;
export const AdjustFont = (size)=>{
    // iPhone 8+ (8+, 7+, 6S+, 6+)
    if (SCREEN_WIDTH >= 430) {
        return (size + 2) + "px"
    }
    // iPhone 8 (8, 7, 6S, 6)
    else if (SCREEN_WIDTH >= 375) {
        return (size + 1) + "px"
    }
    // iPhone SE（SE, 5S, 5C）
    else if (SCREEN_WIDTH >= 320) {
        return (size) + "px"
    }
    return (size) + "px"
}
