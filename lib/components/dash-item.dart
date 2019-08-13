import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DashItem extends StatelessWidget {
  IconData _icon;
  String _title;
  String _subTitle;
  Function _callback;

  DashItem({icon, title, subTitle, onTap}): _icon = icon, _title = title, _subTitle = subTitle, _callback = onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff353531),
        boxShadow: [BoxShadow(blurRadius: 4, offset: Offset(0, 2))],
      ),
      // color: Colors.red,
      child: Material(
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  _icon,
                  color: Color(0xffe4dfda),
                ),
                Text(
                  _title,
                  style: TextStyle(
                    color: Color(0xffe4dfda),
                  ),
                ),
              ],
            ),
          ),
          onTap: _callback,
        ),
        color: Color(0x00353531),
        // elevation: 5,
      ),
    );
  }
}
