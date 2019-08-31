import 'package:flutter/material.dart';
import 'package:rubber/rubber.dart';
import 'package:messager/board.dart';
import 'package:messager/wrapper.dart';
import 'package:messager/toolbar.dart';
import 'package:messager/todo.dart';
import 'package:messager/route.dart';

class MessagePage extends StatefulWidget {
  MessagePage({Key key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage>
    with TickerProviderStateMixin {
  RubberAnimationController _controller;
  FocusNode storyInputNode;
  TextEditingController textController;
  TextSelection textSelection;

  ScrollController _scrollController = ScrollController();
  int _showToolContent = 0;
  String label = "";
  IconButton leadingButton;

  int cursorStartPos = 0;
  int cursorEndPos = 0;
  @override
  void initState() {
    super.initState();
    label = "Add a story";
    leadingButton = IconButton(
      icon: Icon(
        Icons.close,
        color: Colors.black,
      ),
      onPressed: () => Navigator.of(context).pop(),
    );
    storyInputNode = FocusNode();
    textController = new TextEditingController();
    _controller = RubberAnimationController(
      vsync: this,
      halfBoundValue: AnimationControllerValue(percentage: 0.7),
      lowerBoundValue: AnimationControllerValue(pixel: 49.2),
      upperBoundValue: AnimationControllerValue(percentage: 1.0),
      duration: Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    storyInputNode.dispose();
    textController.dispose();
    super.dispose();
  }

  setCursor() {
    FocusScope.of(context).requestFocus(storyInputNode);
    textController.selection = TextSelection.collapsed(offset: cursorStartPos);
  }

  onInsert(length) {
    setState(() {
      cursorStartPos = cursorStartPos + length;
      cursorEndPos = cursorEndPos + length;
    });
  }

  onTextChange(text) {
    setState(() {
      cursorStartPos = textController.selection.start;
      cursorEndPos = textController.selection.end;
    });
  }

  onTextTap() {
    setState(() {
      cursorStartPos = textController.selection.start;
      cursorEndPos = textController.selection.end;
    });
  }

  void _showContentLayer(index) {
    switch (index) {
      case 0:
        setCursor();
        setState(() {
          label = "Add a story";
          leadingButton = IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop(),
          );
        });
        break;
      case 1:
        _controller.launchTo(
          _showToolContent != index ? 0 : _controller.value,
          (_controller.value * 10).round() ==
                      (_controller.upperBound * 10).round() ||
                  _showToolContent != index
              ? _controller.halfBound
              : _controller.upperBound,
          velocity: 2,
        );
        storyInputNode.unfocus();
        setState(() {
          label = "Choose photos";
          leadingButton = IconButton(
            icon: Icon(
              Icons.arrow_downward,
              color: Colors.black,
            ),
            onPressed: () => _showContentLayer(0),
          );
        });
        break;
      case 2:
        _controller.launchTo(
          _showToolContent != index ? 0 : _controller.value,
          (_controller.value * 10).round() ==
                      (_controller.upperBound * 10).round() ||
                  _showToolContent != index
              ? _controller.halfBound
              : _controller.upperBound,
          velocity: 2,
        );
        storyInputNode.unfocus();
        setState(() {
          label = "Insert a emoji";
          leadingButton = IconButton(
            icon: Icon(
              Icons.arrow_downward,
              color: Colors.black,
            ),
            onPressed: () => _showContentLayer(0),
          );
        });
        break;
      case 3:
        Navigator.push(
          context,
          Router(
            TodoWidget(),
          ),
        );
        storyInputNode.unfocus();
        break;
    }
    setState(() {
      _showToolContent = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: leadingButton,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              label,
              style: TextStyle(color: Colors.black, fontSize: 16.0),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.2,
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: new EdgeInsets.fromLTRB(10.0, 11.0, 10.0, 11.0),
            child: SizedBox(
              width: 65.0,
              child: FlatButton(
                onPressed: () {},
                child: Text("Send"),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: RubberBottomSheet(
          lowerLayer: InputStoryWidget(
            storyInputNode: storyInputNode,
            textController: textController,
            onChange: onTextChange,
            onTap: onTextTap,
          ),
          menuLayer: ToolBarWidget(
            onPressed: _showContentLayer,
          ),
          upperLayer: WrapperWidget(
            scrollController: _scrollController,
            textController: textController,
            index: _showToolContent,
            start: cursorStartPos,
            end: cursorEndPos,
            onInsert: onInsert,
          ),
          animationController: _controller,
        ),
      ),
    );
  }
}
