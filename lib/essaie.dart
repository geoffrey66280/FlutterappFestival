import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class WillPopScopePage extends StatefulWidget {
  @override
  _WillPopScopePageState createState() => _WillPopScopePageState();
}

class _WillPopScopePageState extends State<WillPopScopePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isAllowingPop = false;

  @override
  Widget build(BuildContext context) => WillPopScope(
    onWillPop: () async {
      if (!isAllowingPop) {
        scaffoldKey.currentState!
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(content: Text('Not allowed to pop page!')),
          );
      }

      return Future.value(isAllowingPop);
    },
    child: Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("oui"),
        centerTitle: true,
        leading: isAllowingPop ? BackButton() : Container(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 24),
            Text(
              'Is Allowed To Pop Page?',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 12),
            buildToggle(),
          ],
        ),
      ),
    ),
  );

  Widget buildToggle() => CupertinoSwitch(
    value: isAllowingPop,
    onChanged: (value) => setState(() => isAllowingPop = value),
  );
}