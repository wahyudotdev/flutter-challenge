// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:event_bus/event_bus.dart' as _i4;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/data/datasource/api/airports_api.dart' as _i10;
import '../core/data/datasource/api/user_api.dart' as _i9;
import '../core/data/repository/airport_repository.dart' as _i11;
import '../core/data/repository/airport_repository_impl.dart' as _i12;
import '../core/utils/media_service.dart' as _i6;
import '../core/utils/permission_service.dart' as _i7;
import '../core/utils/refresh_token_interceptor.dart' as _i8;
import '../ui/home/bloc/home_bloc.dart' as _i13;
import 'app_modules.dart' as _i15;
import 'network_modules.dart' as _i14;

const String _dev = 'dev';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final networkModule = _$NetworkModule();
  final appModule = _$AppModule();
  gh.factory<_i3.Dio>(
    () => networkModule.client,
    registerFor: {_dev},
  );
  gh.singleton<_i4.EventBus>(appModule.eventBus);
  gh.singleton<_i5.FlutterSecureStorage>(appModule.storage);
  gh.factory<_i6.MediaService>(() => _i6.MediaServiceImpl());
  gh.factory<_i7.PermissionService>(() => _i7.PermissionServiceHandler());
  gh.factory<_i8.RefreshTokenInterceptor>(
      () => _i8.RefreshTokenInterceptor(get<_i5.FlutterSecureStorage>()));
  gh.factory<_i9.UserApi>(() => _i9.UserApi(get<_i3.Dio>()));
  gh.lazySingleton<_i10.AirportsApi>(() => _i10.AirportsApi(get<_i3.Dio>()));
  gh.lazySingleton<_i11.AirportRepository>(
      () => _i12.AirportRepositoryImpl(get<_i10.AirportsApi>()));
  gh.factory<_i13.HomeBloc>(() => _i13.HomeBloc(get<_i11.AirportRepository>()));
  return get;
}

class _$NetworkModule extends _i14.NetworkModule {}

class _$AppModule extends _i15.AppModule {}
