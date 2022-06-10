import 'package:flutter/cupertino.dart';
import 'package:flutter_application_task/model/user.dart';

class UserController extends ChangeNotifier {
  final users = [
    User('assets/images/user1.png', 'Jhon Makelha', 'its john'),
    User('assets/images/user2.jpg', 'mozart hazart', 'its mozart'),
    User('assets/images/user3.jpg', 'eneshatin mk', 'its mk'),
    User('assets/images/user4.jpg', 'ben zema', 'its ben'),
    User('assets/images/user5.jpg', 'lionel jr', 'its lionel'),
  ];
  updateSingleUser(User user, int index) {
    users.insert(index, user);
    notifyListeners();
  }
}
