part of 'choose_avatar_cubit.dart';

class ChooseAvatarInitial extends Equatable {
  String? selectedAvatar;
  final Artboard? riveArtboardAvatar;

  ChooseAvatarInitial({this.selectedAvatar, this.riveArtboardAvatar});
  ChooseAvatarInitial copyWith({
    String? selectedAvatar,
    Artboard? riveArtboardAvatar
  }) {
    return ChooseAvatarInitial(
        selectedAvatar: selectedAvatar ?? this.selectedAvatar,
        riveArtboardAvatar: riveArtboardAvatar ?? this.riveArtboardAvatar);
  }
  ChooseAvatarInitial clearSelectedAvatar(){
    return ChooseAvatarInitial(
        selectedAvatar: null,
        riveArtboardAvatar: riveArtboardAvatar);
  }

  @override
  List<Object?> get props => [selectedAvatar, riveArtboardAvatar];
}
