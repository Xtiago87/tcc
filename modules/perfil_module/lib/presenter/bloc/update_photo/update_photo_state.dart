abstract class UpdatePhotoState {}

class UpdatePhotoInitialState extends UpdatePhotoState{}

class UpdatePhotoFailureState extends UpdatePhotoState{
  final String errorMessage;

  UpdatePhotoFailureState(this.errorMessage);
}

class UpdatePhotoSuccessState extends UpdatePhotoState{}

class UpdatePhotoLoadingState extends UpdatePhotoState{}
