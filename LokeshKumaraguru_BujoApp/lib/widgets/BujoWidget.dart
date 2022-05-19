import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:bujo_app/model/bujo.dart';
import 'package:bujo_app/provider/bujos.dart';
import 'package:bujo_app/utils.dart';
import 'package:bujo_app/pages/editBujoPage.dart';

class BujoWidget extends StatelessWidget {
  final Bujo bujo;

  const BujoWidget({
    required this.bujo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Slidable(
        startActionPane: ActionPane(
          motion: DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                editBujo(context, bujo);
              },
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              icon: Icons.create,
              label: 'Edit',
            ),
            SlidableAction(
              onPressed: (context) {
                deleteBujo(context, bujo);
              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: buildBujo(context),
      );

  Widget buildBujo(BuildContext context) =>
      GestureDetector(
        // onTap: () => editTodo(context, bujo),

        child: Container(
          color: Colors.teal,
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Checkbox(
                activeColor: Theme
                    .of(context)
                    .primaryColor,
                checkColor: Colors.white,
                value: bujo.isDone,
                onChanged: (_) {
                  final provider = Provider.of<BujosProvider>(context, listen: false);
                  final isDone = provider.toggleBujoStatus(bujo);

                  Utils.showStatus(
                    context,
                    isDone ? 'We can come back to this one later. :)' : 'Are we ready to tackle this one now? :D',
                  );
                },
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bujo.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    if (bujo.description.isNotEmpty)
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text(
                          bujo.description,
                          style: TextStyle(fontSize: 20, height: 1.5),
                        ),
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  void deleteBujo(BuildContext context, Bujo bujo) {
    final provider = Provider.of<BujosProvider>(context, listen: false);
    provider.removeBujo(bujo);

    Utils.showStatus(context, 'Feeling Less Cluttered Already! :D');
  }

  void editBujo(BuildContext context, Bujo bujo) => Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => EditBujoPage(bujo: bujo),
    )
  );
}






/*
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:bujo_app/model/bujo.dart';

class BujoWidget extends StatelessWidget {
  final Bujo bujo;

  const BujoWidget({
    required this.bujo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Slidable(
    startActionPane: ActionPane(
      motion: DrawerMotion(),
      children: [
        SlidableAction(
          onPressed: null,
          backgroundColor: Color(0xFF7BC043),
          foregroundColor: Colors.white,
          icon: Icons.create,
          label: 'Edit',
        ),
        SlidableAction(
          onPressed: null,
          backgroundColor: Color(0xFF0392CF),
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: 'Delete',
        ),
      ],
      // child: buildBujo(context),
    ),
    key: Key(bujo.id),
    child: buildBujo(context),
  );

  Widget buildBujo(BuildContext context) => Container(
    color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Checkbox(
            activeColor: Theme.of(context).primaryColor,
            checkColor: Colors.white,
            value: bujo.isDone,
            onChanged: (_) {},
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bujo.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                    fontSize: 25,
                  ),
                ),
                if (bujo.description.isNotEmpty)
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Text(
                        bujo.description,
                        style: TextStyle(fontSize: 20, height: 1.5)
                    ),
                  )
              ],
            ),
          ),
          /*
      Checkbox(

      ),
      */
        ],
      ),
  );
}
*/