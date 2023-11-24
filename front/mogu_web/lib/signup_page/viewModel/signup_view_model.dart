import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repository/signup_repository.dart';

final signupViewModelProvider = StateNotifierProvider<SignupViewModel, SignupState>((ref) {
  final signupRepository = ref.watch(signupRepositoryProvider);
  return SignupViewModel(signupRepository);
});

class SignupViewModel extends StateNotifier<SignupState> {
  final SignupRepository signupRepository;

  SignupViewModel(this.signupRepository) : super(SignupState.initial());

  Future<void> signup({required String name, required String username, required String password,required String email}) async {
    try {
      state = SignupState.loading();
      await signupRepository.signup(name, username, password, email);
      state = SignupState.success();
    } catch (e) {
      state = SignupState.error(e.toString());
    }
  }
}
enum SignupStatus { initial, loading, success, error }

class SignupState {
  final SignupStatus status;
  final String? error;

  SignupState._({this.status = SignupStatus.initial, this.error});

  factory SignupState.initial() => SignupState._();
  factory SignupState.loading() => SignupState._(status: SignupStatus.loading);
  factory SignupState.success() => SignupState._(status: SignupStatus.success);
  factory SignupState.error(String error) => SignupState._(status: SignupStatus.error, error: error);
}
