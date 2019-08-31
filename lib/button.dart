import 'package:flutter/material.dart';

class RadioButton extends StatefulWidget {
  RadioButton({
    Key key,
    this.child,
    this.onTap,
    this.backgroud = Colors.black,
    this.text,
    this.circleColor = Colors.white,
    this.width,
    this.height,
  }) : super(key: key);
  final Widget child;
  final String text;
  final Function onTap;
  final Color backgroud;
  final double height;
  final double width;
  final Color circleColor;
  @override
  _RadioButtonState createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
        widget.onTap(isChecked);
      },
      child: Container(
        height: widget.height,
        width: widget.width,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            widget.child,
            Positioned(
              top: 10,
              right: 10,
              height: 25,
              width: 25,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.backgroud,
                  border: Border.all(
                    width: 2,
                    color: widget.circleColor,
                  ),
                ),
                child: isChecked
                    ? Center(
                        child: Text(
                          widget.text,
                          style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                            color: widget.circleColor,
                          ),
                        ),
                      )
                    : null,
              ),
            )
          ],
        ),
      ),
    );
  }
}
