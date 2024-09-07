import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/yelp_detail_viewmodel.dart';
import 'yelp_detailview.dart';

class SplitView extends StatelessWidget {
  final Widget listView;

  const SplitView({Key? key, required this.listView}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => YelpDetailViewModel(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return listView;
          } else {
            return Row(
              children: [
                Expanded(flex: 1, child: listView),
                Expanded(flex: 2, child: YelpDetailView()),
              ],
            );
          }
        },
      ),
    );
  }
}
