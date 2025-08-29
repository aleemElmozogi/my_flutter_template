// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_messaging/firebase_messaging.dart' as _i892;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../config/routes/app_router.dart' as _i20;
import '../../data/repositories/auth_repository.dart' as _i481;
import '../../data/repositories/notifications_repository.dart' as _i1061;
import '../../data/services/fcm_service.dart' as _i1036;
import '../../features/authentication/auth/domain/usecases/auth_usecase.dart'
    as _i298;
import '../../features/authentication/auth/presentation/cubit/auth_cubit.dart'
    as _i609;
import '../../features/startUp/splash/data/datasources/lang_local_data_source.dart'
    as _i600;
import '../../features/startUp/splash/data/repositories/lang_repository_impl.dart'
    as _i705;
import '../../features/startUp/splash/domain/repositories/lang_repository.dart'
    as _i865;
import '../../features/startUp/splash/domain/usecases/change_lang.dart' as _i92;
import '../../features/startUp/splash/domain/usecases/get_saved_lang.dart'
    as _i586;
import '../../features/startUp/splash/presentation/cubit/locale_cubit.dart'
    as _i258;
import '../api/api_consumer.dart' as _i207;
import '../api/api_consumer_mock_impl.dart' as _i776;
import '../api/api_consumer_prod_impl.dart' as _i1030;
import '../api/api_helper.dart' as _i242;
import '../localStorage/loacal_storage.dart' as _i198;
import '../network/netwok_info.dart' as _i480;
import '../network/network_info.dart' as _i932;
import 'injection.dart' as _i464;

const String _prod = 'prod';
const String _mock = 'mock';

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final firebaseModule = _$FirebaseModule();
    gh.lazySingleton<_i932.NetworkInfo>(() => _i932.NetworkInfoImpl());
    gh.singleton<_i207.ApiConsumer>(
      () => _i1030.DioConsumerProdImpl(gh<_i932.NetworkInfo>()),
      registerFor: {_prod},
    );
    gh.singleton<_i207.ApiConsumer>(
      () => _i776.DioConsumerMockImpl(gh<_i932.NetworkInfo>()),
      registerFor: {_mock},
    );
    gh.singleton<_i20.AppRouter>(() => _i20.AppRouter());
    gh.lazySingleton<_i892.FirebaseMessaging>(
        () => firebaseModule.firebaseMessaging);
    gh.singleton<_i198.LocalStorage>(() => _i198.LocalStorageImpl());
    gh.lazySingleton<_i242.ApiHelper>(() => _i242.ApiHelperImpl());
    gh.lazySingleton<_i480.NetworkInfo>(() => _i480.NetworkInfoImpl());
    gh.lazySingleton<_i1036.FcmService>(
        () => _i1036.FcmService(gh<_i892.FirebaseMessaging>()));
    gh.singleton<_i481.AuthRepository>(() => _i481.AuthRepositoryImpl(
          localStorage: gh<_i198.LocalStorage>(),
          apiConsumer: gh<_i207.ApiConsumer>(),
          networkInfo: gh<_i932.NetworkInfo>(),
        ));
    gh.lazySingleton<_i1061.NotificationsRepository>(
        () => _i1061.NotificationsRepository(
              gh<_i1036.FcmService>(),
              gh<_i932.NetworkInfo>(),
            ));
    gh.singleton<_i600.LangLocalDataSource>(() =>
        _i600.LangLocalDataSourceImpl(localStorage: gh<_i198.LocalStorage>()));
    gh.lazySingleton<_i298.AuthUsecase>(() => _i298.AuthUsecase(
          authRepository: gh<_i481.AuthRepository>(),
          networkInfo: gh<_i932.NetworkInfo>(),
        ));
    gh.lazySingleton<_i609.AuthCubit>(() => _i609.AuthCubit(
          gh<_i298.AuthUsecase>(),
          gh<_i198.LocalStorage>(),
        ));
    gh.singleton<_i865.LangRepository>(() => _i705.LangRepositoryImpl(
        langLocalDataSource: gh<_i600.LangLocalDataSource>()));
    gh.lazySingleton<_i586.GetSavedLangUseCase>(() => _i586.GetSavedLangUseCase(
          langRepository: gh<_i865.LangRepository>(),
          networkInfo: gh<_i932.NetworkInfo>(),
        ));
    gh.lazySingleton<_i92.ChangeLangUseCase>(() => _i92.ChangeLangUseCase(
          langRepository: gh<_i865.LangRepository>(),
          networkInfo: gh<_i932.NetworkInfo>(),
        ));
    gh.factory<_i258.LocaleCubit>(() => _i258.LocaleCubit(
          getSavedLangUseCase: gh<_i586.GetSavedLangUseCase>(),
          changeLangUseCase: gh<_i92.ChangeLangUseCase>(),
        ));
    return this;
  }
}

class _$FirebaseModule extends _i464.FirebaseModule {}
