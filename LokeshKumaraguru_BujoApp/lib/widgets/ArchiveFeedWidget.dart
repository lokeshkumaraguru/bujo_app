import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bujo_app/provider/bujos.dart';
import 'package:bujo_app/widgets/BujoWidget.dart';

class ArchiveListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BujosProvider>(context);
    final bujos = provider.bujosArchived;

    return bujos.isEmpty ? Center(
      child: Text(
        'Looks like we are on top of things! :D',
        style: TextStyle(fontSize: 20),
      ),
    ) : ListView.separated(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(15),
      separatorBuilder: (context, index) => Container(height: 10),
      itemCount: bujos.length,
      itemBuilder: (context, index) {
        final bujo = bujos[index];

        return BujoWidget(bujo: bujo);
      },
    );
  }
}