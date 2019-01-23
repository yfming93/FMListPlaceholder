# FMListPlaceholder
![](https://ws1.sinaimg.cn/large/006tNc79gy1fz8ipkdw88j30va0b4q48.jpg)

[![platform](https://img.shields.io/badge/platform-iOS-blue.svg?style=plastic)](#)
[![languages](https://img.shields.io/badge/language-objective--c-blue.svg)](#) 
[![cocoapods](https://img.shields.io/badge/cocoapods-supported-4BC51D.svg?style=plastic)](https://cocoapods.org/pods/FMListPlaceholder)
[![support](https://img.shields.io/badge/support-iOS9%2B-orange.svg)](#) 

[There is an English version of README here. just click it！](https://github.com/yfming93/FMListPlaceholder/blob/master/README.md)


一个优雅的占位图解决方案。适用于 UITableView 和 UICollectionView。

**一行代码处理空列表占位图逻辑**

### 0x001 与其他的同类三方库对比的优点：

- 首次进入列表占位图是不显示的。只在网络请求完成后，再次刷新列表时才处理相关逻辑；
- 简单、高效、实用，最快一行代码就可以集成;
- 提供更加全面丰富、高度自定义的效果；
- 可一行代码设置一套自己项目专属的默认方案，然后也可以在某个特殊的列表单独二次自定义效果；
- 支持用户自行自定义的视图作为占位图；

### 0x002 效果演示
![](https://ws1.sinaimg.cn/large/006tNc79gy1fz8jghf5d0g30hj0dsx6p.gif)


### 0x003 如何使用
- CocoaPods 使用:
    - 在  `Podfile`  文件新增 `pod "FMListPlaceholder"` ；
    - 打开终端, 切换到项目文件目录。 执行 `pod install`；
    - 导入主头文件：`#import <FMListPlaceholder.h>`
- 手动拖入 使用：
    - 下载演示工程，把 `FMListPlaceholder` 文件夹拖入自己项目中；
    - 导入主头文件：`#import "FMListPlaceholder.h"`；


##### 一行代码使用 
    _tableView.needPlaceholderView = YES;   //the same as UICollectionView
    

或者如下自定义
##### 自定义全局默认

``` objc
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [FMListPlaceholder fm_defaultBackgroundColor:UIColor.whiteColor coverName:@"xxx" tips:@"Sorroy,nil here!" tipsTextColor:UIColor.grayColor tipsFont:[UIFont systemFontOfSize:16] coverSize:CGSizeZero coverCenterYOffset:-30 coverSpaceToTips:10];

    return YES;
}
```
#### 0x004 自定义
##### 自定义某个特殊列表 
 根据自己需求自行调用如下某些接口设置，UITableView 和 UICollectionView 接口相同。

``` objc
[_tableView fm_emptyCoverName:@"fm_placeholder_nil" emptyTips:@" "];
[_tableView fm_backgroundColor:[UIColor colorWithRed:0.91 green:0.90 blue:0.90 alpha:1.00] tipsTextColor:UIColor.redColor tipsFont:nil];
[_tableView fm_coverCenterYOffset:-80 coverSize:CGSizeMake(90, 120) coverSpaceToTips:20];
// the same as UICollectionView
```
<br/>

##### 点击刷新逻辑
（如果需要点击刷新逻辑，可实现如下 block）

``` objc
_tableView.reloadBlock = ^(UIScrollView *listView) {
  // Reload Handle is Here!
  // [listView.mj_header beginRefreshing]; // reloadData
};
```
##### 更加详细请见演示工程


### 0x005 希望
- 如果您在使用过程中有任何疑问或想要更多界面进行自定义，您可以发给我！

- 如果您想参与本项目的维护或具有良好的设计风格，欢迎拉动请求！
- 如果您在使用时有任何问题，请与我联系。 
    - 博客网站: [www.yfmingo.cn](www.yfmingo.cn)  
    - 邮箱: yfmingo@163.com.
- 希望能够共同完善这个项目，让它变得更强大，能够满足大多数用户的需求！

### 0x006 更新记录
#### 2019.01.23 V1.1.0

- `[+]` 新增支持用户自定义视图作为全局默认占位图 或 某个列表的占位图
- `[+]` 新增一些使用示例 在 演示工程的 `FMTableViewPlaceholder.m` 文件中

### 0x007 QQ 群
![](https://ws3.sinaimg.cn/small/006tNc79gy1fz8aavckscj30f10kl0us.jpg)

### 0x008 要求
- iOS 9.0 or later
- Xcode 9.0 or later

### 0x009 [许可证](https://github.com/yfming93/FMListPlaceholder/blob/master/LICENSE)
**All source code is licensed under the MIT [License](https://github.com/yfming93/FMListPlaceholder/blob/master/LICENSE).**


> MIT License

> Copyright (c) 2019 Fleeming

> Permission is hereby granted, free of charge, to any person obtaining a copy
> of this software and associated documentation files (the "Software"), to deal
> in the Software without restriction, including without limitation the rights
> to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> copies of the Software, and to permit persons to whom the Software is
> furnished to do so, subject to the following conditions:

> The above copyright notice and this permission notice shall be included in all
> copies or substantial portions of the Software.

> THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
> AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
> SOFTWARE.


