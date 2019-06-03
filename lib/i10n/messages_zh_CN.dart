// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_CN locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

// ignore: unnecessary_new
final messages = new MessageLookup();

// ignore: unused_element
final _keepAnalysisHappy = Intl.defaultLocale;

// ignore: non_constant_identifier_names
typedef MessageIfAbsent(String message_str, List args);

class MessageLookup extends MessageLookupByLibrary {
  get localeName => 'zh_CN';

  static m0(howMany) => "${Intl.plural(howMany, zero: '没有未读邮件', one: '有${howMany}封未读邮件', other: '有${howMany}封未读邮件')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "about" : MessageLookupByLibrary.simpleMessage("关于"),
    "animatedList" : MessageLookupByLibrary.simpleMessage("AnimatedList: 添加或删除，并伴有动画效果"),
    "bezierCurveCutting" : MessageLookupByLibrary.simpleMessage("贝塞尔曲线切割"),
    "bottomNavigation" : MessageLookupByLibrary.simpleMessage("底部导航栏"),
    "bottomNavigationWithDocker" : MessageLookupByLibrary.simpleMessage("带凹槽的底部导航栏"),
    "containerWidget" : MessageLookupByLibrary.simpleMessage("容器类 Widgets"),
    "customWidget" : MessageLookupByLibrary.simpleMessage("自定义 Widget"),
    "dragDrop" : MessageLookupByLibrary.simpleMessage("拖拽"),
    "eventHandlingNotification" : MessageLookupByLibrary.simpleMessage("事件处理与通知"),
    "expandClosedCase" : MessageLookupByLibrary.simpleMessage("展开闭合案例"),
    "fileIO" : MessageLookupByLibrary.simpleMessage("读写文件: dart:io path_provider"),
    "frostedGlass" : MessageLookupByLibrary.simpleMessage("毛玻璃效果"),
    "functionalWidget" : MessageLookupByLibrary.simpleMessage("功能型 Widgets"),
    "gridList" : MessageLookupByLibrary.simpleMessage("Grid List"),
    "i10n" : MessageLookupByLibrary.simpleMessage("国际化"),
    "imageIcon" : MessageLookupByLibrary.simpleMessage("图片和 Icon"),
    "inputBoxForm" : MessageLookupByLibrary.simpleMessage("输入框和表单"),
    "intl" : MessageLookupByLibrary.simpleMessage("Flutter 国际化"),
    "languageToggle" : MessageLookupByLibrary.simpleMessage("语言切换"),
    "layout" : MessageLookupByLibrary.simpleMessage("布局"),
    "netRequest" : MessageLookupByLibrary.simpleMessage("网络请求: dio"),
    "platformChannel" : MessageLookupByLibrary.simpleMessage("Platform Channel"),
    "radioSwitchCheckBox" : MessageLookupByLibrary.simpleMessage("单选开关和复选框\'"),
    "remainingEmailsMessage" : m0,
    "retainPageStatus" : MessageLookupByLibrary.simpleMessage("保留页面状态"),
    "rightArrawReturnPreviousPage" : MessageLookupByLibrary.simpleMessage("右滑返回上一页"),
    "roundAvatarRoundedEffect" : MessageLookupByLibrary.simpleMessage("圆形头像和圆角效果"),
    "routeAnimation" : MessageLookupByLibrary.simpleMessage("渐隐渐现的路由动画效果"),
    "scrollableWidget" : MessageLookupByLibrary.simpleMessage("可滚动 Widgets"),
    "searchBar" : MessageLookupByLibrary.simpleMessage("搜索条"),
    "signOut" : MessageLookupByLibrary.simpleMessage("退出登录"),
    "slidingOff" : MessageLookupByLibrary.simpleMessage("滑动关闭"),
    "splashScreenAnimation" : MessageLookupByLibrary.simpleMessage("打开应用的闪屏动画"),
    "textFontStyleButton" : MessageLookupByLibrary.simpleMessage("文本、字体样式，按钮"),
    "themeToggle" : MessageLookupByLibrary.simpleMessage("主题切换"),
    "title" : MessageLookupByLibrary.simpleMessage("Flutter 应用"),
    "tooltip" : MessageLookupByLibrary.simpleMessage("Tooltip"),
    "useRedux" : MessageLookupByLibrary.simpleMessage("Use Redux"),
    "wrapStreamingLayout" : MessageLookupByLibrary.simpleMessage("Wrap 流式布局")
  };
}
