import 'package:collaboration/Screens/pages/card.dart';
import 'package:collaboration/widgets/app_bar.dart';
import 'package:collaboration/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:collaboration/model/the_task.dart';
import 'package:collaboration/state/notifier.dart';
import 'package:flutter/rendering.dart';

import 'package:provider/provider.dart';

class CardDetails extends StatefulWidget {
  const CardDetails({super.key});

  @override
  State<CardDetails> createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  int currentIndex = 0;
  final List<String> name = ['Todo', 'Inprogres', 'Review', 'Completed'];
  @override
  Widget build(BuildContext context) {
    final card = Provider.of<CardModel>(context).card;

    return Scaffold(
      appBar: AppBar(title: AppBarText(text: 'Task Board')),
      body: Container(
        height: 250,

        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context, index) {
            final cardItem = card[0];
            final newName = name[index];
            if (index == currentIndex) {
              return LongPressDraggable<Task>(
                childWhenDragging: Container(
                  padding: EdgeInsets.only(left: 30, right: 20, top: 20),
                  margin: EdgeInsets.only(left: 20, top: 20, right: 20),

                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  height: 200,
                  width: 350,
                ),
                data: cardItem,
                dragAnchorStrategy: pointerDragAnchorStrategy,
                feedback: Container(
                  padding: EdgeInsets.only(left: 30, right: 20, top: 20),
                  margin: EdgeInsets.only(left: 20, top: 20, right: 20),

                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  height: 200,
                  width: 350,
                ),
                child: Container(
                  padding: EdgeInsets.only(left: 30, right: 20, top: 20),
                  margin: EdgeInsets.only(left: 20, top: 20, right: 20),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  height: 200,
                  width: 350,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.pink,
                        width: double.infinity,
                        child: Text(newName, textAlign: TextAlign.center),
                      ),
                      SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Title:${cardItem.title}'),
                          SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text('Do yo want to delete?'),

                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Provider.of<CardModel>(
                                            context,
                                            listen: false,
                                          ).removeTask(cardItem);
                                          Navigator.of(context).pop(
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return CardPage();
                                              },
                                            ),
                                          );
                                        },
                                        child: Text('yes'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('no'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Icon(Icons.delete),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text('Description:${cardItem.description}'),
                      SizedBox(height: 10),
                      Text('Title:${cardItem.tag}'),
                      SizedBox(height: 10),
                      Text('Title:${cardItem.dueDate}'),
                    ],
                  ),
                ),
              );
            } else {
              return DragTarget<Task>(
                onWillAccept: (task) => true,
                builder: (context, candidateData, rejectedData) {
                  return Container(
                    padding: EdgeInsets.only(left: 30, right: 20, top: 20),
                    margin: EdgeInsets.only(left: 20, top: 20, right: 20),

                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    height: 200,
                    width: 350,
                  );
                },

                onAcceptWithDetails: (details) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              );
            }
          },
        ),
      ),
    );
  }
}
