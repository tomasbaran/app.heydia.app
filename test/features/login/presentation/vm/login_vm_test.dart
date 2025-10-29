import 'package:flutter_test/flutter_test.dart';
import 'package:app_heydia_app/features/login/presentation/vm/login_vm.dart';
import 'package:mockito/mockito.dart';

void main() {
  late MockAuthRepo mockAuthRepo;
  late LoginVM sut;

  setUp(() {
    mockAuthRepo = MockAuthRepo();
    sut = LoginVM(mockAuthRepo);
  });

  group('LoginVM', () {
    test(
      'WHEN login is called THEN should call auth repository login method',
      () async {
        // Arrange
        when(mockAuthRepo.login(any)).thenAnswer((_) async => true);

        // Act
        await sut.login('email', 'password');

        // Assert
        verify(mockAuthRepo.login(any));
      },
    );

    test(
      'WHEN logout is called THEN should call auth repository logout method',
      () async {
        // Arrange
        when(mockAuthRepo.logout(any)).thenAnswer((_) async => true);

        // Act
        await sut.logout();

        // Assert
        verify(mockAuthRepo.logout(any));
      },
    );
  });
}
