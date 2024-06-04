class ChapterModel {
  final int? id;
  final int? lessonId;
  final int? number;
  num? star;
  // final bool? isOpen;
  final bool? isLetter;
  final bool? isGame;
  bool isHidden = false;
  // final bool? isChapter;
  final String? levelImg;
  final String? name;

  ChapterModel(
      {this.id,
      this.lessonId,
      this.name,
      this.star,
      this.number,
      this.isHidden = false,
      this.isLetter,
      this.isGame,
      // this.isChapter,
      this.levelImg});
}
