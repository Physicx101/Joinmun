import 'package:flutter/material.dart';
import 'package:joinmun_2019/utils/joinmun.dart';

class ErrorDialog extends StatelessWidget {
  final Widget child;
  final error;
  final Function onTap;

  ErrorDialog(
      {Key key, this.child, this.error = Joinmun.some_error_text, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(error),
                SizedBox(
                  height: 10,
                ),
                FlatButton(
                  colorBrightness: Brightness.dark,
                  child: Text(Joinmun.try_again_text),
                  color: Colors.red,
                  onPressed: () {
                    Navigator.pop(context);
                    if (onTap != null) {
                      onTap();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
