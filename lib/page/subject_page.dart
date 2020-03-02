import 'package:flutter/material.dart';
import 'package:numerical_methods/model/method.dart';
import 'package:numerical_methods/model/subject.dart';
import 'package:numerical_methods/page/method_page.dart';

class SubjectPage extends StatefulWidget {
  final Subject subject;

  SubjectPage(this.subject);
  @override
  _SubjectPageState createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  Subject get _subject => widget.subject;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_subject.name)),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return ListView.separated(
      itemCount: _subject.methods.length,
      separatorBuilder: (_, __) => Divider(
        height: 0,
      ),
      itemBuilder: (_, index) {
        Method method = _subject.methods[index];
        return GestureDetector(
          onTap: () => _onClickMethod(method),
          child: ListTile(
            title: Text(method.name),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
        );
      },
    );
  }

  _onClickMethod(Method method) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MethodPage(method)),
    );
  }
}
