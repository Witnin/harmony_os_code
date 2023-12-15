

/**
 * List item data entity.
 */
export default class PageResource {
  /**
   * Text of list item.
   */
  title: Resource;
  /**
   * Image of list item.
   */
  img: Resource;

  url:String
  /**
   * Other resource of list item.
   */
  others?: Resource;

  constructor(title: Resource, img: Resource,url?:String, others?: Resource) {
    this.title = title;
    this.img = img;
    this.url = url;
    this.others = others;
  }
}