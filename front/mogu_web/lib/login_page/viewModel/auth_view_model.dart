import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../common/model/token_response.dart';
import '../../common/secure_storage/secure_storage.dart';
import '../model/login_response_model.dart';
import '../model/user_model.dart';
import '../repository/auth_repository.dart';

final authViewModelProvider = StateNotifierProvider<AuthViewModel, AuthState>(
  (ref) {
    final authRepository = ref.watch(authRepositoryProvider);
    final storage = ref.watch(secureStorageProvider);

    return AuthViewModel(
      authRepository: authRepository,
      storage: storage,
    );
  },
);

class AuthViewModel extends StateNotifier<AuthState> {
  final AuthRepository authRepository;
  final FlutterSecureStorage storage;

  AuthViewModel({
    required this.authRepository,
    required this.storage,
  }) : super(AuthState.initial());

  Future<void> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await authRepository.login(username, password);
      await storage.write(key: 'refreshToken', value: response.refreshToken);
      await storage.write(key: 'accessToken', value: response.accessToken);

      final user = User(
        id: response.id,
        name: response.name,
        username: response.username,
        email: response.email,
        roles: response.roles,
      );

      state = AuthState.success(response, user: user);
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  Future<void> refreshToken(String token) async {
    try {
      final response = await authRepository.token(token);
      state = AuthState.success(response);
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  Future<void> logout(int userId) async {
    try {
      await authRepository.logout(userId);
      await storage.delete(key: 'refreshToken');
      await storage.delete(key: 'accessToken');
      state = AuthState.loggedOut();
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }
}

class AuthState {
  final LoginResponse? loginResponse;
  final TokenResponse? tokenResponse;
  final User? user;
  final String? error;
  final bool isLoggedIn;

  AuthState._({this.loginResponse, this.tokenResponse, this.user, this.error, this.isLoggedIn = false});

  factory AuthState.initial() => AuthState._();

  factory AuthState.success(dynamic response, {User? user}) {
    if (response is LoginResponse) {
      return AuthState._(loginResponse: response, user: user, isLoggedIn: true); // 로그인 성공
    } else if (response is TokenResponse) {
      return AuthState._(tokenResponse: response); // 토큰 응답 처리
    } else {
      return AuthState.initial();
    }
  }

  factory AuthState.error(String error) => AuthState._(error: error, isLoggedIn: false);
  factory AuthState.loggedOut() => AuthState._(isLoggedIn: false);
}
