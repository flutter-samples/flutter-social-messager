import 'package:flutter/material.dart';

class TodoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: new Text("Todo"),
        centerTitle: true,
        elevation: 0.2,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Text(
          'Todo...',
        ),
      ),
    );
  }
}
