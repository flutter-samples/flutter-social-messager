import 'package:flutter/material.dart';
import 'package:messager/images.dart';
import 'package:messager/emojis.dart';

class WrapperWidget extends StatefulWidget {
  final TextEditingController textController;
  final ScrollController scrollController;
  final int index;
  final int start;
  final int end;
  final Function onInsert;
  WrapperWidget({
    this.textController,
    this.scrollController,
    this.index,
    this.start,
    this.end,
    this.onInsert,
    Key key,
  }) : super(key: key);

  @override
  _WrapperWidgetState createState() => _WrapperWidgetState();
}

class _WrapperWidgetState extends State<WrapperWidget> {
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _mainWidget();
  }

  Widget _contentWidget() {
    switch (widget.index) {
      case 1:
        return ImagePanelWidget();
        break;
      case 2:
        return EmojiPanelWidget(
          textController: widget.textController,
          start: widget.start,
          end: widget.end,
          onInsert: widget.onInsert,
        );
        break;
      default:
        return Container();
    }
  }

  Widget _mainWidget() {
    return Container(
      decoration: BoxDecoration(color: Colors.transparent),
      child: _contentWidget(),
    );
  }
}
