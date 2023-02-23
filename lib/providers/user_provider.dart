import 'package:etiqa/features/add_card/add_cart.dart';
import 'package:etiqa/features/home/home.dart';
import 'package:etiqa/models/data_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserProvider extends ChangeNotifier {
  late TodoModel _dataDetail;
  TodoModel get dataDetail => _dataDetail;
  set dataDetail(TodoModel val) {
    _dataDetail = val;
    notifyListeners();
  }

  List<TodoModel> _datas = dataTodo;
  List<TodoModel> get datas => _datas;
  set datas(List<TodoModel> val) {
    datas = val;
    notifyListeners();
  }

  void completedCheck(bool? val, int id) {
    datas.firstWhere((e) => e.id == id).completed = val;
  }

  Future<void> addCard(BuildContext context,
      List<TextEditingController> controllers, int id) async {
    if (id == 0) {
      dataTodo.add(TodoModel(
          id: (1 + dataTodo.length),
          title: controllers[0].text,
          status: 0,
          completed: false,
          startDate: DateTime.parse(controllers[1].text),
          endDate: DateTime.parse(controllers[2].text),
          timeLeft: 0));
    } else {
      dataDetail = dataTodo.firstWhere((e) => e.id == id);
      dataDetail.title = controllers[0].text;
      dataDetail.startDate = DateTime.parse(controllers[1].text);
      dataDetail.endDate = DateTime.parse(controllers[2].text);
    }

    Navigator.of(context).pushNamedAndRemoveUntil(
        LandingScreen.routeName, (Route<dynamic> route) => false);
  }

  Future<void> createCard(BuildContext context) async {
    _dataDetail = TodoModel(id: 0);
    dataDetail = _dataDetail;
    Navigator.of(context).pushNamed(AddCardScreen.routeName);
  }

  Future<void> openDetail(BuildContext context, int id) async {
    _dataDetail = datas.firstWhere((e) => e.id == id);
    dataDetail = _dataDetail;
    Navigator.of(context).pushNamed(AddCardScreen.routeName);
  }

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
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      controller!.text = formattedDate;
    }
  }
}
