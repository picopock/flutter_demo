import 'package:flutter/material.dart';

class ToolTipDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('tool tips demo')),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Tooltip(
          message: '不要碰我，我怕痒',
          child: Image.network(
              'https://sjbz-fd.zol-img.com.cn/t_s320x510c/g5/M00/06/01/ChMkJli2X3CIUz-kAADDJ9x0xkQAAaUkADmvSAAAMM_04.jpeg',
              fit: BoxFit.fitWidth),
        ),
      ),
    );
  }
}
