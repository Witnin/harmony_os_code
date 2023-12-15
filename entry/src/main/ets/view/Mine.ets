import CommonConstants from '../common/constant/CommonConstant'
import router from '@ohos.router'
import ItemData from '../viewmodel/ItemData'
import mainViewModel from '../viewmodel/MainViewModel';

@Component
export default struct Setting {
  @Builder settingCell(item: ItemData) {
    Row() {
      Row({ space: CommonConstants.number_12 }) {
        Image(item.img)
          .width($r('app.float.setting_size'))
          .height($r('app.float.setting_size'))
        Text(item.title)
          .fontSize($r('app.float.normal_text_size'))
      }

      if (item.others === null) {
        Image($r('app.media.right_grey'))
          .width($r('app.float.setting_jump_width'))
          .height($r('app.float.setting_jump_height'))
      } else {
        Toggle({ type: ToggleType.Switch, isOn: false })
      }
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .width(CommonConstants.FULL_LENGTH)
    .padding({
      left: $r('app.float.setting_settingCell_left'),
      right: $r('app.float.setting_settingCell_right')
    })
  }

  build() {
    Scroll() {
      Column({ space: CommonConstants.number_12 }) {
        Row() {
          Image($r('app.media.account'))
            .width($r('app.float.setting_account_size'))
            .height($r('app.float.setting_account_size'))
          Column() {
            Text($r('app.string.setting_account_name'))
              .fontSize($r('app.float.setting_account_fontSize'))
            Text($r('app.string.setting_account_email'))
              .fontSize($r('app.float.little_text_size'))
              .margin({ top: $r('app.float.setting_name_margin') })
          }
          .alignItems(HorizontalAlign.Start)
          .margin({ left: $r('app.float.setting_account_margin') })
        }
        .margin({ top: $r('app.float.setting_account_margin') })
        .alignItems(VerticalAlign.Center)
        .width(CommonConstants.FULL_LENGTH)
        .height($r('app.float.setting_account_height'))
        .backgroundColor(Color.White)
        .padding({ left: $r('app.float.setting_account_padding') })
        .borderRadius($r('app.float.setting_account_borderRadius'))
        .onClick(()=>{
          router.pushUrl({
            url: 'pages/Login',
          }, router.RouterMode.Single)
        })

        List() {
          ForEach(mainViewModel.getSettingListData(), (item: ItemData) => {
            ListItem() {
              this.settingCell(item)
            }
            .height($r('app.float.setting_list_height'))
          }, (item:ItemData) => JSON.stringify(item))
        }
        .backgroundColor(Color.White)
        .width(CommonConstants.FULL_LENGTH)
        .divider({
          strokeWidth: $r('app.float.setting_list_strokeWidth'),
          color: Color.Grey,
          startMargin: $r('app.float.setting_list_startMargin'),
          endMargin: $r('app.float.setting_list_endMargin')
        })
        .borderRadius($r('app.float.setting_list_borderRadius'))
        .padding({ top: $r('app.float.setting_list_padding'), bottom: $r('app.float.setting_list_padding') })

        Blank()

        Button($r('app.string.setting_button'), { type: ButtonType.Capsule })
          .width(CommonConstants.percentage_90)
          .height($r('app.float.login_button_height'))
          .fontSize($r('app.float.normal_text_size'))
          .fontColor($r('app.color.setting_button_fontColor'))
          .fontWeight(FontWeight.Medium)
          .backgroundColor($r('app.color.setting_button_backgroundColor'))
          .margin({ bottom: $r('app.float.setting_button_bottom')})
          .onClick(()=>{
            router.pushUrl({
              url: 'pages/Login',
            }, router.RouterMode.Single)
          })
      }
      .height(CommonConstants.FULL_LENGTH)
    }
  }
}