// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;

import '../../features/auth/data/repository/auth_repository_impl.dart' as _i409;
import '../../features/auth/data/source/auth_remote_source.dart' as _i315;
import '../../features/auth/domain/enitities/usecase/login_usecase.dart'
    as _i873;
import '../../features/auth/domain/enitities/usecase/login_with_google_usecase.dart'
    as _i60;
import '../../features/auth/domain/enitities/usecase/register_usecase.dart'
    as _i930;
import '../../features/auth/domain/repository/auth_repository.dart' as _i961;
import '../../features/auth/presentation/cubit/login/login_cubit.dart' as _i264;
import '../../features/auth/presentation/cubit/register/register_cubit.dart'
    as _i552;
import '../network/network_info.dart' as _i932;
import '../network/network_module.dart' as _i200;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i973.InternetConnectionChecker>(
      () => networkModule.connectionChecker,
    );
    gh.lazySingleton<_i315.AuthRemoteSource>(
      () => _i315.AuthRemoteSourceImpl(),
    );
    gh.lazySingleton<_i932.NetworkInfo>(
      () => _i932.NetworkInfoImpl(gh<_i973.InternetConnectionChecker>()),
    );
    gh.lazySingleton<_i961.AuthRepository>(
      () => _i409.AuthRepositoryImpl(
        gh<_i315.AuthRemoteSource>(),
        gh<_i932.NetworkInfo>(),
      ),
    );
    gh.lazySingleton<_i930.RegisterUsecase>(
      () => _i930.RegisterUsecase(gh<_i961.AuthRepository>()),
    );
    gh.lazySingleton<_i873.LoginUseCase>(
      () => _i873.LoginUseCase(gh<_i961.AuthRepository>()),
    );
    gh.lazySingleton<_i60.LoginWithGoogleUseCase>(
      () => _i60.LoginWithGoogleUseCase(gh<_i961.AuthRepository>()),
    );
    gh.factory<_i264.LoginCubit>(
      () => _i264.LoginCubit(
        gh<_i873.LoginUseCase>(),
        gh<_i60.LoginWithGoogleUseCase>(),
      ),
    );
    gh.factory<_i552.RegisterCubit>(
      () => _i552.RegisterCubit(gh<_i930.RegisterUsecase>()),
    );
    return this;
  }
}

class _$NetworkModule extends _i200.NetworkModule {}
