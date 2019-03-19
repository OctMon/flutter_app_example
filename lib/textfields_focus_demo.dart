import 'package:flutter/material.dart';

class TextFieldFocusDemo extends StatefulWidget {
  @override
  _TextFieldFocusDemoState createState() => _TextFieldFocusDemoState();
}

class _TextFieldFocusDemoState extends State<TextFieldFocusDemo> {
  FocusNode _nameFocusNode, _pwdFocusNode;
  TextEditingController _nameController, _pwdController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameFocusNode = FocusNode();
    _nameController = TextEditingController();
    _pwdFocusNode = FocusNode();
    _pwdController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(brightness: Brightness.light),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          brightness: Brightness.light,
          leading: IconButton(
              icon: CloseButton(),
              color: Colors.black,
              tooltip: MaterialLocalizations.of(context).backButtonTooltip,
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              }),
        ),
        body: SafeArea(
            child: ListView(
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Center(
              child: Text(
                'Login',
                style: TextStyle(fontSize: 35.0),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            _loginPadding(),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Material(
                borderRadius: BorderRadius.circular(10.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'password',
                  ),
                  focusNode: _pwdFocusNode,
                  controller: _pwdController,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (value) {
                    _pwdFocusNode.unfocus();
                  },
                ),
              ),
            ),
            ButtonBar(
              children: <Widget>[
                RaisedButton(
                  onPressed: () {},
                  child: Text('Login'),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text('Register'),
                )
              ],
            )
          ],
        )),
      ),
    );
  }

  Widget _loginPadding() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        child: TextField(
          decoration: InputDecoration(
            labelText: 'name',
          ),
          focusNode: _nameFocusNode,
          controller: _nameController,
          textInputAction: TextInputAction.next,
          onSubmitted: (value) {
            _nameFocusNode.unfocus();
            FocusScope.of(context).requestFocus(_pwdFocusNode);
          },
        ),
      ),
    );
  }
}
