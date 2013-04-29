// Auto-generated from littleben_clock.html.
// DO NOT EDIT.

library littleben_clock_html;

import 'dart:html' as autogenerated;
import 'dart:svg' as autogenerated_svg;
import 'package:web_ui/web_ui.dart' as autogenerated;
import 'package:web_ui/observe/observable.dart' as __observe;
import 'dart:async';
import 'package:web_ui/web_ui.dart';


// Original code


final __changes = new __observe.Observable();

String __$currentTime;
String get currentTime {
  if (__observe.observeReads) {
    __observe.notifyRead(__changes, __observe.ChangeRecord.FIELD, 'currentTime');
  }
  return __$currentTime;
}
set currentTime(String value) {
  if (__observe.hasObservers(__changes)) {
    __observe.notifyChange(__changes, __observe.ChangeRecord.FIELD, 'currentTime',
        __$currentTime, value);
  }
  __$currentTime = value;
}

void main() {
  var oneSecond = new Duration(seconds:1);
  new Timer.periodic(oneSecond, updateTime);
  updateTime(null);
}

void updateTime(Timer _) {
  DateTime today = new DateTime.now();
  currentTime = formatTime(today.hour, today.minute, today.second);
}

String formatTime(int h, int m, int s) {
  if (h > 12) { h = h - 12; }
  String minute = (m <= 9) ? '0$m' : '$m';
  String second = (s <= 9) ? '0$s' : '$s';
  return '$h:$minute:$second';
}

// Additional generated code
void init_autogenerated() {
  var _root = autogenerated.document.body;
  var __e1;
  var __t = new autogenerated.Template(_root);
  __e1 = _root.nodes[3];
  var __binding0 = __t.contentBind(() => currentTime, false);
  __e1.nodes.addAll([new autogenerated.Text('\n      The current time is: '),
      __binding0,
      new autogenerated.Text('\n    ')]);
  __t.create();
  __t.insert();
}

//@ sourceMappingURL=littleben_clock.dart.map