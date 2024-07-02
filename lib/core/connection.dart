import 'assets_sound.dart';

abstract class Connection {
  Connection._();

  static const base = 'hqsync.duckdns.org/Fillament/public';
  static const baseURL = 'https://$base/api/';
}

abstract class QuestionType {
  static const howManyMore = 'How Many more?';
  static const count = 'Count';
  static const sum = 'Sum';
}

abstract class Type {
  static const dragDrop = 'Drag & Drop';
  static const color = 'Color';
  static const mCQ = 'MCQ';
  static const matching = 'Matching';
}

abstract class SecType {
  static const rods = 'Rods';
  static const beads = 'Beads';
  static const stripBoard = 'Strip Board';
  static const chart = 'Chart';
}
