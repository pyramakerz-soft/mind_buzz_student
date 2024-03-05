part of 'choose_avatar_cubit.dart';

class ChooseAvatarInitial extends Equatable {
  final String? selectedAvatar;
  final Artboard? riveArtboardAvatar;

  const ChooseAvatarInitial({this.selectedAvatar, this.riveArtboardAvatar});
  ChooseAvatarInitial copyWith({
    String? selectedAvatar,
    Artboard? riveArtboardAvatar,
    Animation<double>? animation,
    bool? showTheButton,
    AnimationController? controller,
  }) {
    return ChooseAvatarInitial(
        selectedAvatar: selectedAvatar ?? this.selectedAvatar,
        riveArtboardAvatar: riveArtboardAvatar ?? this.riveArtboardAvatar);
  }

  @override
  List<Object?> get props => [selectedAvatar, riveArtboardAvatar];
}
