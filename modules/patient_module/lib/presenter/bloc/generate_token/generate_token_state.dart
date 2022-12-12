abstract class GenerateTokenState{}

class GenerateTokenInitialState extends GenerateTokenState{}

class GenerateTokenSuccessState extends GenerateTokenState{
  final String token;

  GenerateTokenSuccessState(this.token);
}

class GenerateTokenLoadingState extends GenerateTokenState{}

class GenerateTokenFailureState extends GenerateTokenState{
  final String errorMessage;

  GenerateTokenFailureState(this.errorMessage);
}