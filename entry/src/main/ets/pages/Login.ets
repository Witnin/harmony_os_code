import router from '@ohos.router'

@Entry
@Component
struct Login {
  @State message: string = 'Hello World'
  @State text: string = ''

  build() {
    Column({
      space:5
    }) {
      Image($r('app.media.app_icon')).height(100).margin({
        top: $r('app.float.vp_100')
      })
      Text('登录界面').fontSize(24).margin({
        top: $r('app.float.vp_14')
      }).fontWeight(FontWeight.Bold).textAlign(TextAlign.Center)

      Text('登录账号以使用服务').fontWeight(100).margin({
        top: $r('app.float.vp_14')
      }).fontSize(16).textAlign(TextAlign.Center)
      TextInput({ placeholder: '请输入帐号' })
        .placeholderColor(0x999999)
        .caretColor(Color.Blue)
        .type(InputType.Normal)
        .width('90%')
        .margin({
          top: $r('app.float.vp_14')
        })
        .onChange((value: string) => {
          this.text = value
        })
        .fontColor(Color.Blue)
        .fontSize(20)
        .fontStyle(FontStyle.Italic)
        .fontWeight(FontWeight.Bold)
        .fontFamily('Arial')
      TextInput({ placeholder: '请输入密码' })
        .placeholderColor(0x999999)
        .caretColor(Color.Blue)
        .type(InputType.Password)
        .width('90%')
        .margin({
          top: $r('app.float.vp_14')
        })
        .onChange((value: string) => {
          this.text = value
        })
        .fontColor(Color.Blue)
        .fontSize(20)
        .fontStyle(FontStyle.Italic)
        .fontWeight(FontWeight.Bold)
        .fontFamily('Arial')
      Text(this.text)
      Button('登录', { type: ButtonType.Capsule, stateEffect: true })
        .width('90%')
        .height(40)
        .fontSize(16)
        .margin({
          top: $r('app.float.vp_14')
        })
        .fontWeight(FontWeight.Medium)
        .backgroundColor('#007DFF')
        .onClick(() => {
          router.back()
        })
      LoadingProgress()
        .color(Color.Blue)
        .visibility(Visibility.Visible)
        .height(40)
      Row(){
        Text("验证码登录")
        Text("忘记密码")
      }.justifyContent(FlexAlign.SpaceAround)
      .width('100%')
    }

  }
}