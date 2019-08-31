import 'package:flutter/material.dart';

class InputStoryWidget extends StatefulWidget {
  final FocusNode storyInputNode;
  final TextEditingController textController;
  final Function onChange;
  final Function onTap;
  InputStoryWidget({
    this.storyInputNode,
    this.textController,
    this.onChange,
    this.onTap,
    Key key,
  }) : super(key: key);
  @override
  _InputStoryWidgetState createState() => _InputStoryWidgetState();
}

class _InputStoryWidgetState extends State<InputStoryWidget>
    with AutomaticKeepAliveClientMixin {
  FocusNode focusNode = new FocusNode();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: Padding(
        padding: EdgeInsets.only(
          top: 2,
          bottom: 2,
          left: 8,
          right: 8,
        ),
        child: Container(
          child: TextField(
            controller: widget.textController,
            onTap: () {
              widget.onTap();
            },
            onChanged: (text) {
              widget.onChange(text);
            },
            style: new TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Write a story...',
              hintStyle: new TextStyle(
                color: Colors.grey[400],
              ),
              fillColor: Colors.white70,
            ),
            maxLines: null,
            onSubmitted: (text) {},
            keyboardType: TextInputType.multiline,
            autofocus: true,
            focusNode: widget.storyInputNode,
          ),
        ),
      ),
    );
  }
}
