import 'package:mind_buzz_refactor/features/login/domain/entities/student_assignment_model.dart';

class Singleton{
  
  static final Singleton _singleton = Singleton._internal();
  Singleton._privateConstructor();
  static final Singleton _instance = Singleton._privateConstructor();
  static Singleton get instance => _instance;
    factory Singleton() {
    return _singleton;
  }
  
  List <StudentAssignmentModel>? studentAssignments;
  String msgFromSingleton='hello';

  Singleton._internal();
}