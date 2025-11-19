import 'package:dia_app/core/utils/result.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dia_app/features/login/presentation/vm/auth_vm.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/mocks/mocks_generator.mocks.dart';

void main() {
  late MockAuthRepoInterface mockAuthRepo;
  late AuthVM sut;

  setUpAll(() {
    // Provide dummy values for Result type
    provideDummy<Result<User?>>(Result.ok(null));
  });

  setUp(() {
    mockAuthRepo = MockAuthRepoInterface();
    // authStateChanges() emits the current user state immediately on subscription
    when(mockAuthRepo.authStateChanges()).thenAnswer((_) => Stream.value(null));
    sut = AuthVM(mockAuthRepo);
  });

  group('AuthVM', () {
    test(
      'WHEN loginCommand is called THEN should call auth repository login method',
      () async {
        // Arrange

        when(
          mockAuthRepo.loginWithEmailAndPassword(any, any),
        ).thenAnswer((_) async => Result.ok(null));

        // Act
        await sut.loginCommand.execute(('email', 'password'));

        // Assert
        verify(mockAuthRepo.loginWithEmailAndPassword(any, any));
      },
    );

    test(
      'WHEN logout is called THEN should call auth repository logout method',
      () async {
        // Arrange
        when(mockAuthRepo.logout()).thenAnswer((_) async {});

        // Act
        await sut.logout();

        // Assert
        verify(mockAuthRepo.logout());
      },
    );
  });
}
