import 'package:flutter/material.dart';
import 'package:numerical_methods/utils/master_detail/detail_route.dart';
import 'package:numerical_methods/utils/master_detail/master_detail_container.dart';
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

  Method _methodSelected;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _onClickMethod(_subject.methods[0], pop: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MasterDetailContainer(
      child: Scaffold(
        appBar: AppBar(title: Text(_subject.name)),
        body: _buildBody(),
      ),
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
          child: Container(
            color: method == _methodSelected
                ? Theme.of(context).highlightColor
                : Colors.transparent,
            child: ListTile(
              title: Text(method.name),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
          ),
        );
      },
    );
  }

  _onClickMethod(Method method, {bool pop = true}) {
    print("teste"); // To remove the previously selected detail page
    // while (Navigator.of(context).canPop()) {
    //   Navigator.of(context).pop();
    // }

    if (!pop) {
      // Navigator.of(context).pop();

      Navigator.of(context).push(DetailRoute(builder: (context) {
        return MethodPage(method);
      }));
    } else {
      Navigator.of(context).pushReplacement(DetailRoute(builder: (context) {
        return MethodPage(method);
      }));
    }

    setState(() {
      this._methodSelected = method;
    });

    // if (_isTablet) {
    // } else {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => MethodPage(method)),
    //   );
    // }
  }
}
