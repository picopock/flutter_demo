import 'package:flutter/material.dart';
import 'dart:ui';

class FrostedGlass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ConstrainedBox(
            // 约束盒子组件，添加额外的限制条件
            constraints: const BoxConstraints.expand(),
            child: Image.network(
                'http://www.deskier.com/uploads/allimg/170405/1-1F405143304.jpg'),
          ),
          Center(
            child: ClipRect(
              // 矩形切割
              child: BackdropFilter(
                // 背景过滤器
                filter: ImageFilter.blur(
                  sigmaX: 5.0,
                  sigmaY: 5.0,
                ),
                child: Opacity(
                  opacity: 0.5,
                  child: Container(
                    width: 500.0,
                    height: 740.0,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                    ),
                    child: Center(
                      child: Text(
                        'JSPang',
                        style: Theme.of(context).textTheme.display3,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
