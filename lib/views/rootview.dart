import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/yelp_detail_viewmodel.dart';
import 'yelp_detailview.dart';
import 'yelp_listview.dart';

class RootView extends StatelessWidget {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => YelpDetailViewModel(),
      child: Scaffold(
        appBar: AppBar(title: Text("Restaurant Tours")),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              return YelpListView();
            } else {
              return Row(
                children: [
                  Expanded(flex: 1, child: YelpListView()),
                  Expanded(flex: 2, child: YelpDetailView()),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
