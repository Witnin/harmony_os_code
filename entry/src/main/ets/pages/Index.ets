import CommonConstants from '../common/constant/CommonConstant'
import ToDoItem from '../view/ToDoItem';
import DataModel from '../viewmodel/DataModel';
import router from '@ohos.router';

@Entry
@Component
struct Index {
  @State src: string = (router.getParams() as Record<string, string>)['src'];
  private totalTasks: Array<string> = [];

  aboutToAppear() {
    this.totalTasks = DataModel.getData();
  }

  build() {
    Column() {
      Row(){
        Image($r('app.media.ic_public_arrow_left'))
          .onClick(()=>{
          router.back();
        })
          .margin({
            right: $r('app.float.vp_32'),
            top: $r('app.float.title_margin_top'),
            bottom: $r('app.float.title_margin_bottom')
          })
          .height($r('app.float.vp_20'))
        Text(this.src)
          .fontSize($r('app.float.title_font_size'))
          .fontWeight(FontWeight.Bold)
          .lineHeight($r('app.float.title_font_height'))
          .width(CommonConstants.TITLE_WIDTH)
          .margin({
            top: $r('app.float.title_margin_top'),
            bottom: $r('app.float.title_margin_bottom')
          })
          .textAlign(TextAlign.Start)
      }

      ForEach(this.totalTasks, (item: string) => {
        ToDoItem({ content: item })
      }, (item: string) => JSON.stringify(item))
    }.width(CommonConstants.FULL_LENGTH)
    .height(CommonConstants.FULL_LENGTH)
    .backgroundColor($r('app.color.start_window_background'))

  }
}