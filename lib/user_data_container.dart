import 'package:flutter/material.dart';

class UserData {
  String uid;

  UserData(this.uid);
}

class StateContainer extends StatefulWidget {
  final Widget child;
  final UserData user;

  StateContainer({
    @required this.child,
    this.user,
  });

  static StateContainerState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_InheritedStateContainer)
    as _InheritedStateContainer)
        .data;
  }

  @override
  StateContainerState createState() => new StateContainerState();
}

class StateContainerState extends State<StateContainer> {
  UserData user;

  void updateUserInfo({uid}) {
    if (user == null) {
      user = new UserData(uid);
      setState(() {
        user = user;
      });
    } else {
      setState(() {
        user.uid = uid ?? user.uid;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return new _InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }
}

class _InheritedStateContainer extends InheritedWidget {
  final StateContainerState data;

  _InheritedStateContainer({
    Key key,
    @required this.data,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_InheritedStateContainer old) => true;
}