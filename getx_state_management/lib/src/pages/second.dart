import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:getx_state_management/src/freezed/model/person.dart';
import 'package:getx_state_management/src/freezed/model/person2.dart';

class SecondScreen extends StatelessWidget {
  SecondScreen({Key? key}) : super(key: key);

  Person person = Person(id: 1, name: '123', age: 34);
  Person2 person2 = Person2(id: 1, name: '12', age: 1);

  test() {
   
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
