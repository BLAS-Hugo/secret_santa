
import 'package:flutter/cupertino.dart';
import 'package:party_app/view/home/home.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {

  /// Builds [Home] if the [User] in logged in, [Auth] instead
  @override
  Widget build(BuildContext context) {


    return Home(title: "Home");
  }
}
