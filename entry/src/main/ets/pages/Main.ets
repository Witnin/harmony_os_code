import router from '@ohos.router'
@Entry
@Component
struct Main {
  @State message: string = 'home'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
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
      .width('100%')
    }
    .height('100%')
  }
}