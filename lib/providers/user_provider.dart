import 'package:etiqa/features/detail/detail.dart';
import 'package:etiqa/features/home/home.dart';
import 'package:etiqa/models/data_model.dart';
import 'package:etiqa/widgets/fields/calendar_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserProvider extends ChangeNotifier {
  TodoModel _dataDetail = TodoModel(id: 0);
  TodoModel get dataDetail => _dataDetail;
  set dataDetail(TodoModel val) {
    _dataDetail = val;
    notifyListeners();
  }

  List<TodoModel> _datas = [];
  List<TodoModel> get datas => _datas;
  set datas(List<TodoModel> val) {
    datas = val;
    notifyListeners();
  }

  // this function is tick the check of cemplete whether true and false
  void completedCheck(bool? val, int id) {
    datas.firstWhere((e) => e.id == id).completed = val;
  }

  //this function is handling the creation and update the existed data.
  Future<void> addCard(BuildContext context,
      List<TextEditingController> controllers, int id) async {
    if (id == 0) {
      dataTodo.add(TodoModel(
          id: (1 + dataTodo.length),
          title: controllers[0].text,
          status: 0,
          completed: false,
          startDate: DateFormat('dd MMM yyyy').parse(controllers[1].text),
          endDate: DateFormat('dd MMM yyyy').parse(controllers[2].text),
          timeLeft: 0));
    } else {
      dataDetail = dataTodo.firstWhere((e) => e.id == id);
      dataDetail.title = controllers[0].text;
      dataDetail.startDate =
          DateFormat('dd MMM yyyy').parse(controllers[1].text);
      dataDetail.endDate = DateFormat('dd MMM yyyy').parse(controllers[2].text);
    }

    //If successfully, then navigate back to the main screen.
    Navigator.of(context).pushNamedAndRemoveUntil(
        HomeScreen.routeName, (Route<dynamic> route) => false);
  }

  // This function is that the user is allowed to create the new card
  Future<void> createCard(BuildContext context) async {
    _dataDetail = TodoModel(id: 0);
    dataDetail = _dataDetail;
    Navigator.of(context).pushNamed(AddCardScreen.routeName);
  }

//Select the card to display the detail from the list
  Future<void> openDetail(BuildContext context, int id) async {
    if (id > 0) {
      _dataDetail = datas.firstWhere((e) => e.id == id);
    } else {
      _dataDetail = TodoModel(id: 0);
    }
    dataDetail = _dataDetail;

    Navigator.of(context).pushNamed(AddCardScreen.routeName);
  }

//Select the card to display the detail from the list
  TodoModel getDetail(int? id) {
    if (id != null) {
      _dataDetail = datas.firstWhere((e) => e.id == id);
      dataDetail = _dataDetail;
    }
    return dataDetail;
  }

//This function is that open the calendar from the icon calendar field
  setDatePicker(BuildContext context, TextEditingController? controller,
      Function(String)? onChange) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
            data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                    primary: Colors.orange,
                    onPrimary: Colors.black,
                    surface: Colors.yellow,
                    onSurface: Colors.red)),
            child: child!);
      },
    );

    if (pickedDate != null) {
      controller!.text = formatDate(pickedDate);
    }
  }
}
