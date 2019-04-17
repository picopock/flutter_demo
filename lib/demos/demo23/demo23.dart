import 'package:flutter/material.dart';

class SwitchAndCheckBox extends StatefulWidget {
  _SwitchAndCheckBoxState createState() => _SwitchAndCheckBoxState();
}

class _SwitchAndCheckBoxState extends State<SwitchAndCheckBox> {
  bool _switchSelected = false;
  bool _checkboxSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('单选开关和复选框'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Switch(
              inactiveThumbColor: Colors.red, // 为 off 时的颜色
              inactiveTrackColor: Colors.redAccent,
              activeColor: Colors.green,
              activeTrackColor: Colors.lightGreenAccent,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              value: _switchSelected,
              onChanged: (bool selected) {
                setState(() {
                  _switchSelected = selected;
                });
              },
            ),
            Checkbox(
              activeColor: Colors.yellow, // 选框的背景色
              checkColor: Colors.green, // 对勾的颜色
              tristate: true, // 值为 true 时有三种状态： true, false, null
              value: _checkboxSelected,
              onChanged: (bool checked) {
                print('checked: $checked');
                setState(() {
                  _checkboxSelected = checked;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
