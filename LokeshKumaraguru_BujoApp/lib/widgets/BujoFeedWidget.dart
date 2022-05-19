import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bujo_app/provider/bujos.dart';
import 'package:bujo_app/widgets/BujoWidget.dart';

class BujoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BujosProvider>(context);
    final bujos = provider.bujos;

    return bujos.isEmpty ? Center(
      child: Text(
        'Nothing to do! : )',
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


/*
class BujoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BujoProvider>(context);
    final bujos = provider.bujos;

    return ListView.separated (
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

 */