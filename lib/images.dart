import 'package:flutter/material.dart';
import 'package:messager/button.dart';

class ImagePanelWidget extends StatefulWidget {
  ImagePanelWidget({
    Key key,
  }) : super(key: key);

  @override
  _ImagePanelWidgetState createState() => _ImagePanelWidgetState();
}

class _ImagePanelWidgetState extends State<ImagePanelWidget> {
  int selectCounter;
  void initState() {
    super.initState();
    selectCounter = 0;
  }

  @override
  void dispose() {
    selectCounter = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> imageWidgets = List<Widget>();

    for (var i = 1; i < 16; i++) {
      imageWidgets.add(_imageWidgert(i));
    }

    return Container(
      color: Color(0xFFF0F0F0),
      child: Column(
        children: <Widget>[
          Container(height: 1, color: Color(0xFFF5F5F5)),
          Expanded(
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
              ),
              children: imageWidgets,
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageWidgert(index) {
    return RadioButton(
      height: 100,
      width: 100,
      onTap: (flag) {
        setState(() {});
      },
      text: "1",
      child: Container(
        padding: EdgeInsets.all(1.0),
        child: Image.asset('assets/img$index.jpg'),
      ),
    );
  }
}
