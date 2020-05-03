import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numerical_methods/model/method.dart';
import 'package:numerical_methods/model/subject.dart';
import 'package:numerical_methods/page/method_page.dart';
import 'package:numerical_methods/tablet_detector.dart';
import 'package:numerical_methods/utils/master_detail/master_detail_utils.dart';
import 'package:numerical_methods/widget/platform/platform_app_bar.dart';
import 'package:numerical_methods/widget/platform/platform_list_tile.dart';
import 'package:numerical_methods/widget/platform/platform_scaffold.dart';

class SubjectPage extends StatefulWidget {
  final Subject subject;

  SubjectPage(this.subject);
  @override
  _SubjectPageState createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  Subject get _subject => widget.subject;

  Method _methodSelected;
  bool get isTablet => TabletDetector.isTablet(MediaQuery.of(context));

  @override
  Widget build(BuildContext context) {
    final page = PlatformScaffold(
      appBar: PlatformAppBar(title: Text(_subject.name)),
      body: SafeArea(
        bottom: false,
        child: _buildBody(),
      ),
    );

    if (!isTablet) {
      return page;
    }

    return Container(
      color: CupertinoTheme.of(context).scaffoldBackgroundColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            child: page,
            flex: 1,
          ),
          Container(
            // margin: EdgeInsets.symmetric(horizontal: 20),
            color: Theme.of(context).dividerColor,
            height: double.infinity,
            width: 2,
            // child: Divider(),
          ),
          Flexible(
            child: _buildMethodPage(),
            flex: 2,
          )
        ],
      ),
    );
  }

  _buildBody() {
    return ListView.separated(
      itemCount: _subject.methods.length,
      separatorBuilder: (_, __) => Divider(height: 0),
      itemBuilder: (_, index) {
        Method method = _subject.methods[index];
        return GestureDetector(
          onTap: () => _onClickMethod(method),
          child: Container(
            color: method == _methodSelected
                ? Theme.of(context).dividerColor
                : Colors.transparent,
            child: PlatformListTile(
              title: method.name,
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
          ),
        );
      },
    );
  }

  _buildMethodPage() {
    if (_methodSelected == null) {
      return PlatformScaffold(
          body: Center(
              child: Text("Selecione um método para efetuar o cálculo")));
    }
    return MethodPage(_methodSelected);
  }

  _onClickMethod(Method method, {bool pop = true}) {
    if (isTablet) {
      setState(() {
        this._methodSelected = method;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MethodPage(method)),
      );
    }
  }
}
