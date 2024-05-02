class ChapterModel {
  final int? id;
  final int? number;
  final int? star;
  final bool? isOpen;
  final bool? isLesson;
  final bool? isCheckPoint;
  final bool? isAssessment;
  final bool? isChapter;
  final String? levelImg;
  final String? name;


  ChapterModel(
      {this.id,
      this.isOpen,
        this.name,
        this.star,
        this.number,
        this.isAssessment,
      this.isCheckPoint,
      this.isLesson,
      this.isChapter,
      this.levelImg});
}
