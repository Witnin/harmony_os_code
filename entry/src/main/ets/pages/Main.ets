import router from '@ohos.router'
import CommonConstants from '../common/constant/CommonConstant';
@Entry
@Component
struct Main {
  @State message: string = 'home'
  @State currentIndex: number = CommonConstants.HOME_TAB_INDEX;
  private tabsController: TabsController = new TabsController();

  @Builder TabBuilder(title: string, index: number, selectedImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.currentIndex === index ? selectedImg : normalImg)
        .width($r('app.float.mainPage_baseTab_size'))
        .height($r('app.float.mainPage_baseTab_size'))
      Text(title)
        .margin({ top: $r('app.float.mainPage_baseTab_top') })
        .fontSize($r('app.float.main_tab_fontSize'))
        .fontColor(this.currentIndex === index ? $r('app.color.mainPage_selected') : $r('app.color.mainPage_normal'))
    }
    .justifyContent(FlexAlign.Center)
    .height($r('app.float.mainPage_barHeight'))
    .width(CommonConstants.FULL_LENGTH)
    .onClick(() => {
      this.currentIndex = index;
      this.tabsController.changeIndex(this.currentIndex);
    })
  }

  build() {
    Tabs({
      barPosition: BarPosition.End,
      controller: this.tabsController
    }){
      TabContent() {
            Button(){
              Text($r('app.string.page_title'))
            }
            .margin(
              {
                bottom: $r('app.float.vp_20')
              }
            )
            .width('50%')
            .onClick(()=>{
              router.pushUrl({
                url: 'pages/Index',
                params: {
                  src: '待办事项',
                }
              }, router.RouterMode.Single)
            })
      }
      .padding({ left: $r('app.float.vp_14'), right: $r('app.float.vp_14') })
      .backgroundColor($r('app.color.mainPage_backgroundColor'))
      .tabBar(this.TabBuilder(CommonConstants.HOME_TITLE, CommonConstants.HOME_TAB_INDEX,
        $r('app.media.home_selected'), $r('app.media.home_normal')))
      TabContent() {
            Button(){
              Text('登陆页面')
            }
            .width('50%')
            .onClick(()=>{
              router.pushUrl({
                url: 'pages/Login',
              }, router.RouterMode.Single)
            })
      }
      .padding({ left: $r('app.float.vp_14'), right: $r('app.float.vp_14') })
      .backgroundColor($r('app.color.mainPage_backgroundColor'))
      .tabBar(this.TabBuilder(CommonConstants.MINE_TITLE, CommonConstants.MINE_TAB_INDEX,
        $r('app.media.mine_selected'), $r('app.media.mine_normal')))
    }
    .width(CommonConstants.FULL_LENGTH)
    .backgroundColor(Color.White)
    .barHeight($r('app.float.vp_56'))
    .barMode(BarMode.Fixed)
    .onChange((index: number) => {
      this.currentIndex = index;
    })
    // Row() {
    //   Column() {
    //     Text(this.message)
    //       .fontSize(50)
    //       .fontWeight(FontWeight.Bold)
    // }
    // .height('100%')
  }
}