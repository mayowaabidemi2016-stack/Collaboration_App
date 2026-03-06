import 'package:collaboration/Screens/pages/card_details.dart';
import 'package:collaboration/Utils/app_color.dart';
import 'package:collaboration/model/the_task.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:collaboration/state/notifier.dart';
import 'package:collaboration/widgets/big_text.dart';
import 'package:collaboration/widgets/app_bar.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  final _cardFormKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController desController = TextEditingController();
  final TextEditingController tagController = TextEditingController();
  final TextEditingController dueDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: AppBarText(text: 'Create Task')),
      body: Form(
        key: _cardFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BigText(text: 'Title', backGround: AppColor.taskColor),
            TextFormField(
              controller: titleController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please enter correct title';
                } else {
                  return null;
                }
              },
            ),
            SizedBox(height: height / 21),
            BigText(text: 'Description'),
            TextFormField(
              controller: desController,
              validator: (value) {
                if (value == null || value.isEmpty || value.length > 50) {
                  return 'too long';
                } else {
                  return null;
                }
              },
            ),
            SizedBox(height: height / 21),
            BigText(text: 'Tag'),
            TextFormField(
              controller: tagController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please enter correct tag';
                } else {
                  return null;
                }
              },
            ),
            SizedBox(height: height / 21),
            BigText(text: 'Due Date'),
            TextFormField(
              controller: dueDateController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please enter correct due date';
                } else {
                  return null;
                }
              },
            ),
            SizedBox(height: height / 21),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_cardFormKey.currentState!.validate()) {
                    Task task = Task(
                      title: titleController.text,
                      description: desController.text,
                      tag: tagController.text,
                      dueDate: dueDateController.text,
                    );

                    Provider.of<CardModel>(
                      context,
                      listen: false,
                    ).addTask(task);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return CardDetails();
                        },
                      ),
                    );
                  }
                },
                child: Text('Create'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
