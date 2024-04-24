class ChapterModel {
  final int? id;
  final bool? isOpen;
  final bool? isLesson;
  final bool? isCheckPoint;
  final bool? isAssessment;
  final bool? isChapter;
  final String? levelImg;


  ChapterModel(
      {this.id,
      this.isOpen,
      this.isAssessment,
      this.isCheckPoint,
      this.isLesson,
      this.isChapter,
      this.levelImg});
}
