import 'package:flutter/material.dart';
import 'package:messager/common.dart';

class EmojiPanelWidget extends StatefulWidget {
  final TextEditingController textController;
  final int start;
  final int end;
  final Function onInsert;
  EmojiPanelWidget({
    this.textController,
    this.start,
    this.end,
    this.onInsert,
    Key key,
  }) : super(key: key);

  @override
  _EmojiPanelWidgetState createState() => _EmojiPanelWidgetState();
}

class _EmojiPanelWidgetState extends State<EmojiPanelWidget> {
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> emojiWidgets = [];
    emj.forEach((int rune) {
      var character = new String.fromCharCode(rune);
      emojiWidgets.add(_emojiWidget(character));
    });

    return Container(
      color: Color(0xFFF0F0F0),
      child: Column(
        children: <Widget>[
          Container(height: 1, color: Color(0xFFF5F5F5)),
          Expanded(
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                childAspectRatio: 1.0,
              ),
              children: emojiWidgets,
            ),
          ),
        ],
      ),
    );
  }

  String runeSubstring({String input, int start, int end}) {
    return String.fromCharCodes(input.runes.toList().sublist(start, end));
  }

  Widget _emojiWidget(text) {
    int textLength = text.length;
    return new Container(
      child: new Material(
        child: new InkWell(
          onTap: () {
            final addEmojiText = widget.textController.text.replaceRange(
              widget.start,
              widget.end,
              text,
            );
            widget.textController.text = addEmojiText;
            widget.textController.selection =
                TextSelection.collapsed(offset: widget.start + textLength);
            widget.onInsert(textLength);
          },
          child: new Container(
            alignment: Alignment.center,
            child: Text(
              text,
            ),
          ),
        ),
        color: Color(0xFFF0F0F0),
      ),
    );
  }
}
