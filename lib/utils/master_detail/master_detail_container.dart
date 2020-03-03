import 'package:flutter/material.dart';

import 'master_detail_utils.dart';

class MasterDetailContainer extends StatelessWidget {
  final Widget child;

  MasterDetailContainer({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).canvasColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
                width: isTablet(context)
                    ? kTabletMasterContainerWidth
                    : MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: child),
          ],
        ));
  }
}
