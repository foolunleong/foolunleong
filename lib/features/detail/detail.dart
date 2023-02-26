import 'package:etiqa/models/data_model.dart';
import 'package:etiqa/providers/user_provider.dart';
import 'package:etiqa/widgets/fields/calendar_picker.dart';
import 'package:etiqa/widgets/fields/field_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCardScreen extends StatefulWidget {
  static const routeName = 'add_card';
  final int id;
  const AddCardScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AddCardScreenState();
}

class AddCardScreenState extends State<AddCardScreen> {
  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  TodoModel detail = TodoModel(id: 0);

  @override
  void initState() {
    detail = Provider.of<UserProvider>(context, listen: false).dataDetail;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (detail.id != 0) {
      controllers[0].text = detail.title!;
      controllers[1].text = formatDate(detail.startDate!);
      controllers[2].text = formatDate(detail.endDate!);
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 14,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Add new To-Do List',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
        ),
        backgroundColor: Colors.amber,
      ),
      body: SafeArea(
          child: Column(
        children: [
          etiqaReactiveTextField(context,
              labelText: 'To-Do Title',
              hintText: 'Please key in your To-Do title here',
              controller: controllers[0],
              styleHintText: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[400],
                  fontWeight: FontWeight.bold),
              maxLine: 5),
          etiqaTextDateFloat(
            context,
            controller: controllers[1],
            labelText: 'Start Date',
            styleHintText: TextStyle(
                fontSize: 14,
                color: Colors.grey[400],
                fontWeight: FontWeight.bold),
          ),
          etiqaTextDateFloat(
            context,
            controller: controllers[2],
            labelText: 'Estimate End Date',
            styleHintText: TextStyle(
                fontSize: 14,
                color: Colors.grey[400],
                fontWeight: FontWeight.bold),
          )
        ],
      )),
      bottomNavigationBar: InkWell(
        onTap: () => Provider.of<UserProvider>(context, listen: false)
            .addCard(context, controllers, detail.id!),
        child: Container(
          color: Colors.black,
          height: 50,
          child: Center(
            child: Text(
              detail.id != 0 ? 'Update' : 'Create Now',
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
