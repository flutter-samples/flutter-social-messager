import 'package:flutter/material.dart';

class ToolBarWidget extends StatefulWidget {
  final Function onPressed;

  ToolBarWidget({
    this.onPressed,
    Key key,
  }) : super(key: key);

  @override
  _ToolBarWidgetState createState() => _ToolBarWidgetState();
}

class _ToolBarWidgetState extends State<ToolBarWidget> {
  int currentActive;
  void initState() {
    super.initState();
    currentActive = 0;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 49.2,
      padding: EdgeInsets.only(
        top: 0.0,
        left: 0.0,
        right: 0.0,
        bottom: 0,
      ),
      color: Colors.teal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 0.6,
            color: Theme.of(context).primaryColor,
          ),
          Container(
            height: 48.0,
            decoration: BoxDecoration(color: Colors.white),
            width: MediaQuery.of(context).size.width,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      left: 5,
                      right: 5,
                    ),
                    child: Ink(
                      decoration: ShapeDecoration(
                        color: Colors.lightBlue,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        color: currentActive == 0
                            ? Theme.of(context).primaryColor
                            : Colors.black,
                        icon: Icon(
                          Icons.text_fields,
                          size: 24.0,
                        ),
                        onPressed: () {
                          setState(() {
                            currentActive = 0;
                          });
                          widget.onPressed(0);
                        },
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: 5,
                      right: 5,
                    ),
                    child: Ink(
                      decoration: ShapeDecoration(
                        color: Colors.lightBlue,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        color: currentActive == 1
                            ? Theme.of(context).primaryColor
                            : Colors.black,
                        icon: Icon(
                          Icons.wallpaper,
                          size: 22.0,
                        ),
                        onPressed: () {
                          setState(() {
                            currentActive = 1;
                          });
                          widget.onPressed(1);
                        },
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: 5,
                      right: 5,
                    ),
                    child: Ink(
                      decoration: ShapeDecoration(
                        color: Colors.lightBlue,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        color: currentActive == 2
                            ? Theme.of(context).primaryColor
                            : Colors.black,
                        icon: Icon(
                          Icons.tag_faces,
                          size: 24.0,
                        ),
                        onPressed: () {
                          setState(() {
                            currentActive = 2;
                          });
                          widget.onPressed(2);
                        },
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: 5,
                      right: 5,
                    ),
                    child: Ink(
                      decoration: ShapeDecoration(
                        color: Colors.lightBlue,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        color: currentActive == 3
                            ? Theme.of(context).primaryColor
                            : Colors.black,
                        icon: Icon(
                          Icons.alternate_email,
                          size: 24.0,
                        ),
                        onPressed: () {
                          setState(() {
                            currentActive = 3;
                          });
                          widget.onPressed(3);
                        },
                      ),
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
