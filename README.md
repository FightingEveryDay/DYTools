# DYTools
主要思想是简化oc过长的方法名.和增加一些经常用到的工具,但是oc语言中并没有的功能
QQ群：553633494
# 增加cocoapods管理
```
 pod 'DYTools'
```
### 即可使用最新第三方DYTools

# 导入头文件即可使用 
```apple js
#import "DYTool.h"
```
## 更新,增加color的hexcolor赋值,以及修改方法名,避免冲突

### 2017-11-17更新
1. 增加UIColor的宏定义DY_HEXCOLOR
2. 增加DYTools全局单例类

### - 2017-12-12更新
1. 增加获取通讯录信息,需要在plist文件中添加授权
2. 增加机型获取

### - 2017-12-15更新
1. 简化封装NSMutableAttributedString富文本追加方法

### - 2017-12-25更新
1. 增加正则判断方法
2. 增加UUID的随机字符串的生成
3. 增加NSDictionary转JSON字符串方法

### - 2017-1-25更新
1. 增加UIView的findview方法

### - 2017-2-9更新
1. 增加按钮的倒计时方法,一行代码搞定
2. 增加图片放大缩小方法
3. 增加view的block点击方法

### - 2018-4-9更新
1. 增加UITextField的placeholder的左边内边距
2. 增加获取缓存,清除缓存方法,查找沙盒路径方法
3. 增加时间比较方法
4. 增加字典安全取值方法
5. 修改UIView增加点击手势方法

### - 2019-05-30更新
1. 简化字符串和富文本字符串的高度获取
2. 增加UIButton的排列方向(增加4种方向)
	- DYButtonImageTopTextBottom:图上文下
	- DYButtonImageBottomTextTop:图下文上
	- DYButtonImageLeftTextRight:图左文右
	- DYButtonImageRightTextLeft:图右文左
3. 增加UIview的扩展方法
	- 寻找指定的父视图
4. 增加NSDate的扩展方法 
	- 增加时间计算,类似活动秒杀,返回NSDateComponents对象
	- 增加返回到指定时间的秒数
5. 增加NSString(金额类型)的精度计算(默认保留2位小数)
6. 增加图片压缩到指定size
7. UITextView添加placeholder属性
8. 增加rootViewController切换方法

# 持续更新中,欢迎加入
