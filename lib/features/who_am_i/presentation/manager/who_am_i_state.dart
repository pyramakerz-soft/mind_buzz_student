// ignore_for_file: public_member_api_docs, sort_constructors_first
class WhoAmIState {
  final int? index;
  final bool isFirst;
  WhoAmIState({
    this.index,
    this.isFirst = true,
  });

  @override
  bool operator ==(covariant WhoAmIState other) {
    if (identical(this, other)) return true;

    return other.index == index && other.isFirst == isFirst;
  }

  @override
  int get hashCode => index.hashCode ^ isFirst.hashCode;

  WhoAmIState copyWith({
    int? index,
    bool? isFirst,
  }) {
    return WhoAmIState(
      index: index ?? this.index,
      isFirst: isFirst ?? this.isFirst,
    );
  }
}
