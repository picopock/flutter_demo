import 'package:flutter/material.dart';

class TextFieldAndForm extends StatefulWidget {
  @override
  _TextFieldAndFormState createState() => _TextFieldAndFormState();
}

class _TextFieldAndFormState extends State<TextFieldAndForm> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _selectionController = TextEditingController();

  TextEditingController _unameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();

  String _password;

  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  FocusNode _focusNode3 = FocusNode();
  FocusScopeNode _focusScopeNode;

  @override
  void initState() {
    super.initState();
    //监听输入改变
    _usernameController.addListener(() {
      print('unameController: ${_usernameController.text}');
    });
    // 设置默认值，并从第三个之后选中文本
    _selectionController.text = 'Hello world!';
    _selectionController.selection = TextSelection(
      baseOffset: 2,
      extentOffset: _selectionController.text.length - 1,
    );

    // 监听焦点的改变
    // 获得焦点时focusNode.hasFocus值为true，失去焦点时为false。
    _focusNode1.addListener(() {
      print('hasFocus: ${_focusNode1.hasFocus}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('输入框和表单'),
      ),
      body: SingleChildScrollView(
        child: Theme(
          data: Theme.of(context).copyWith(
            hintColor: Colors.pink[200], // 定义下划线颜色
            inputDecorationTheme: InputDecorationTheme(
              labelStyle: TextStyle(
                color: Colors.green, // 定义label字体样式
              ),
              hintStyle: TextStyle(
                // 定义提示文本样式
                color: Colors.red,
                fontSize: 20.0,
              ),
            ),
          ),
          child: Column(
            children: <Widget>[
              TextField(
                autofocus: true,
                controller: _usernameController,
                focusNode: _focusNode1,
                keyboardType: TextInputType.text,
                onChanged: (String val) {
                  print('username: $val');
                },
                decoration: InputDecoration(
                  labelText: '用户名',
                  hintText: '用户名或邮箱',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              TextField(
                onChanged: (String val) {
                  setState(() {
                    _password = val;
                  });
                },
                focusNode: _focusNode2,
                decoration: InputDecoration(
                  labelText: '密码',
                  hintText: '您的登录密码',
                  prefixIcon: Icon(Icons.lock),
                  hintStyle: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 16.0,
                  ),
                ),
                obscureText: true,
              ),
              TextField(
                controller: _selectionController,
              ),
              Builder(
                builder: (BuildContext ctx) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      RaisedButton(
                          child: Text('移动焦点'),
                          onPressed: () {
                            // 第一种写法： FocusScope.of(ctx).requestFocus(_focusNode2)
                            if (null == _focusScopeNode) {
                              _focusScopeNode = FocusScope.of(ctx);
                            }
                            _focusScopeNode.requestFocus(_focusNode2);
                          }),
                      RaisedButton(
                        child: Text('隐藏键盘'),
                        onPressed: () {
                          // 当所有输入框失去焦点是键盘就会收起
                          _focusNode1.unfocus();
                          _focusNode2.unfocus();
                          _focusNode3.unfocus();
                        },
                      )
                    ],
                  );
                },
              ),
              Container(
                child: TextField(
                  focusNode: _focusNode3,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: '电子邮件地址',
                    prefixIcon: Icon(Icons.email),
                    border: InputBorder.none, // 隐藏下划线
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: _focusNode3.hasFocus
                          ? Colors.lightBlue
                          : Colors.grey[300],
                      style: BorderStyle.solid,
                      width: 3.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 24.0),
                child: Form(
                  key: _formKey, // 设置globalKey, 用于后面获取 FormState
                  autovalidate: true, // 开启自动校验
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        autofocus: true,
                        controller: _unameController,
                        decoration: InputDecoration(
                          labelText: '用户名',
                          hintText: '用户名或邮箱',
                          icon: Icon(Icons.person),
                        ),
                        // 校验用户名
                        validator: (String val) {
                          return val.trim().length > 0 ? null : '用户名不能为空';
                        },
                      ),
                      TextFormField(
                        controller: _pwdController,
                        decoration: InputDecoration(
                          labelText: '密码',
                          hintText: '您的登录密码',
                          icon: Icon(Icons.lock),
                        ),
                        obscureText: true,
                        // 校验密码
                        validator: (String val) {
                          return val.trim().length > 5 ? null : '密码不能少于6位';
                        },
                      ),
                      // 登录按钮
                      Padding(
                        padding: const EdgeInsets.only(top: 28.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: RaisedButton(
                                padding: EdgeInsets.all(15.0),
                                child: Text('登录'),
                                color: Theme.of(context).primaryColor,
                                textColor: Colors.white,
                                onPressed: () {
                                  // 在这里不能通过此方式获取FormState, context 不对=
                                  // print(Form.of(context));

                                  // 通过 _formKey.currentState 获取 FormState 后，
                                  // 调用 validate() 方法校验用户名密码是否����法，校验通过后再提交数据
                                  if ((_formKey.currentState as FormState)
                                      .validate()) {
                                    // 验证通过提交数据
                                  }
                                },
                              ),
                            ),
                            Expanded(
                              // 通过 builder 来获取 RaisedButton 所在widget 树的真正 context(Element)
                              child: Builder(
                                builder: (context) {
                                  return RaisedButton(
                                    padding: EdgeInsets.all(15.0),
                                    child: Text('登录'),
                                    color: Theme.of(context).primaryColor,
                                    textColor: Colors.white,
                                    onPressed: () {
                                      // 由于本widget也是Form 的子代 widget，所以可以通过下面的方式获取FormState
                                      if (Form.of(context).validate()) {
                                        // 校验通过提交数据
                                      }
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
