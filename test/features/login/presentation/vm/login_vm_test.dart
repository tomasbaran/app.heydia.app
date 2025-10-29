import 'package:flutter_test/flutter_test.dart';
import 'package:dia_app/features/login/presentation/vm/login_vm.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/mocks/mocks_generator.mocks.dart';

void main() {
  late MockAuthRepoInterface mockAuthRepo;
  late LoginVM sut;

  setUp(() {
    mockAuthRepo = MockAuthRepoInterface();
    sut = LoginVM(mockAuthRepo);
  });

  group('LoginVM', () {
    test(
      'WHEN login is called THEN should call auth repository login method',
      () async {
        // Arrange
        when(mockAuthRepo.login(any, any)).thenAnswer((_) async => true);

        // Act
        await sut.login('email', 'password');

        // Assert
        verify(mockAuthRepo.login(any, any));
      },
    );

    test(
      'WHEN logout is called THEN should call auth repository logout method',
      () async {
        // Arrange
        when(mockAuthRepo.logout()).thenAnswer((_) async => true);

        // Act
        await sut.logout();

        // Assert
        verify(mockAuthRepo.logout());
      },
    );
  });
}
