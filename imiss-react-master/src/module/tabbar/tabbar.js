import '@CSS_PATH/tabbar.less'
import React, { Component } from 'react'
import { MainColor, kColor_Text_Gary } from '@PUBLIC_PATH'
import { TabBar } from 'antd-mobile';
import Home from '@HOME_PATH/home'
import Sheet from '@SHEET_PATH/sheet'
import Mine from '@MINE_PATH/mine'

export default class tabbar extends Component {
  constructor(props) {
    super(props);
    this.state = {
      selectedTab: 'blueTab',
      hidden: false,
    };
  }

  tabbar_item = (title, object, img, select_img, select_tab)=>{
    return (
      <TabBar.Item
        title={title}
        key="Life"
        icon={
          <img 
            style={{
              width: '22px',
              height: '22px',
              marginBottom: '2px'
            }}
            src={img}
            alt={""}
          />
        }
        selectedIcon={
          <img 
            style={{
              width: '22px',
              height: '22px',
              marginBottom: '2px'
            }}
            src={select_img}
            alt={""}
          />
        }
        selected={this.state.selectedTab === select_tab}
        onPress={() => {
          this.setState({
            selectedTab: select_tab,
          });
        }}
      >
        {object}
      </TabBar.Item>

    )
  }

  render() {
    return (
      <div className="tabbar">
        <TabBar
          unselectedTintColor={kColor_Text_Gary}
          tintColor={MainColor}
          barTintColor="white"
          hidden={this.state.hidden}
        >
          {this.tabbar_item(
            "", 
            <Home/>, 
            require('@IMAGE_PATH/cm4_btm_icn_discovery@3x.png'), 
            require('@IMAGE_PATH/cm4_btm_icn_discovery_prs@3x.png'), 
            'blueTab')
          }
          {this.tabbar_item(
            "", 
            <Sheet/>, 
            require('@IMAGE_PATH/cm4_btm_icn_music@3x.png'), 
            require('@IMAGE_PATH/cm4_btm_icn_music_prs@3x.png'), 
            'redTab')
          }
          {this.tabbar_item(
            "", 
            <Mine/>, 
            require('@IMAGE_PATH/cm4_btm_icn_account@3x.png'), 
            require('@IMAGE_PATH/cm4_btm_icn_account_prs@3x.png'), 
            'greenTab')
          }
        </TabBar>
      </div>
    );
  }
}

