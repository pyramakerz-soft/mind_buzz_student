class ChapterModel {
  final int? id;
  final int? lessonId;
  final int? number;
  final int? star;
  // final bool? isOpen;
  final bool? isLetter;
  final bool? isGame;
  final bool? isAssessment;
  // final bool? isChapter;
  final String? levelImg;
  final String? name;


  ChapterModel(
      {this.id,
      this.lessonId,
        this.name,
        this.star,
        this.number,
        this.isAssessment,
      this.isLetter,
      this.isGame,
      // this.isChapter,
      this.levelImg});
}
