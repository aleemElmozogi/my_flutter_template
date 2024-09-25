// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../config/routes/app_router.dart' as _i3;
import '../../features/authentication/auth/data/datasources/auth_data_source.dart'
    as _i17;
import '../../features/authentication/auth/data/datasources/user_info_data_source.dart'
    as _i18;
import '../../features/authentication/auth/data/repositories/auth_repository_impl.dart'
    as _i27;
import '../../features/authentication/auth/data/repositories/notification_repository_impl.dart'
    as _i11;
import '../../features/authentication/auth/data/repositories/user_info_repository_impl.dart'
    as _i22;
import '../../features/authentication/auth/domain/repositories/auth_repository.dart'
    as _i26;
import '../../features/authentication/auth/domain/repositories/notification_repository.dart'
    as _i10;
import '../../features/authentication/auth/domain/repositories/user_info_repository.dart'
    as _i21;
import '../../features/authentication/auth/domain/usecases/auth_usecase.dart'
    as _i29;
import '../../features/authentication/auth/domain/usecases/notification_issubscribed_usecase.dart'
    as _i13;
import '../../features/authentication/auth/domain/usecases/notification_subscripe_usecase.dart'
    as _i15;
import '../../features/authentication/auth/domain/usecases/notification_unsubscripe_usecase.dart'
    as _i14;
import '../../features/authentication/auth/domain/usecases/set_up_remote_notification.dart'
    as _i16;
import '../../features/authentication/auth/domain/usecases/user_info_usecase.dart'
    as _i28;
import '../../features/authentication/auth/presentation/cubit/auth_cubit.dart'
    as _i30;
import '../../features/startUp/splash/data/datasources/lang_local_data_source.dart'
    as _i9;
import '../../features/startUp/splash/data/repositories/lang_repository_impl.dart'
    as _i20;
import '../../features/startUp/splash/domain/repositories/lang_repository.dart'
    as _i19;
import '../../features/startUp/splash/domain/usecases/change_lang.dart' as _i24;
import '../../features/startUp/splash/domain/usecases/get_saved_lang.dart'
    as _i23;
import '../../features/startUp/splash/presentation/cubit/locale_cubit.dart'
    as _i25;
import '../api/api_consumer.dart' as _i7;
import '../api/api_consumer_mock_impl.dart' as _i8;
import '../api/api_consumer_prod_impl.dart' as _i12;
import '../api/api_helper.dart' as _i5;
import '../localStorage/loacal_storage.dart' as _i4;
import '../network/netwok_info.dart' as _i6;

const String _mock = 'mock';
const String _prod = 'prod';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.AppRouter>(() => _i3.AppRouter());
    gh.singleton<_i4.LocalStorage>(() => _i4.LocalStorageImpl());
    gh.lazySingleton<_i5.ApiHelper>(() => _i5.ApiHelperImpl());
    gh.lazySingleton<_i6.NetworkInfo>(() => _i6.NetworkInfoImpl());
    gh.factory<_i7.ApiConsumer>(
      () => _i8.DioConsumerMockImpl(gh<_i6.NetworkInfo>()),
      registerFor: {_mock},
    );
    gh.singleton<_i9.LangLocalDataSource>(() =>
        _i9.LangLocalDataSourceImpl(localStorage: gh<_i4.LocalStorage>()));
    gh.singleton<_i10.NotificationRepository>(() =>
        _i11.NotificationRepositoryImpl(localStorage: gh<_i4.LocalStorage>()));
    gh.factory<_i7.ApiConsumer>(
      () => _i12.DioConsumerProdImpl(gh<_i6.NetworkInfo>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i13.IsSubscribedToTopicUsecase>(
        () => _i13.IsSubscribedToTopicUsecase(
              notificationRepository: gh<_i10.NotificationRepository>(),
              networkInfo: gh<_i6.NetworkInfo>(),
            ));
    gh.lazySingleton<_i14.UnSubscribeToTopicUsecase>(
        () => _i14.UnSubscribeToTopicUsecase(
              notificationRepository: gh<_i10.NotificationRepository>(),
              networkInfo: gh<_i6.NetworkInfo>(),
            ));
    gh.lazySingleton<_i15.SubscribeToTopicUsecase>(
        () => _i15.SubscribeToTopicUsecase(
              notificationRepository: gh<_i10.NotificationRepository>(),
              networkInfo: gh<_i6.NetworkInfo>(),
            ));
    gh.lazySingleton<_i16.SetUpRemoteNotificationUsecase>(
        () => _i16.SetUpRemoteNotificationUsecase(
              notificationRepository: gh<_i10.NotificationRepository>(),
              networkInfo: gh<_i6.NetworkInfo>(),
            ));
    gh.singleton<_i17.AuthDataSource>(() => _i17.AuthDataSourceImpl(
          apiConsumer: gh<_i7.ApiConsumer>(),
          localStorage: gh<_i4.LocalStorage>(),
        ));
    gh.singleton<_i18.UserInfoDataSource>(() => _i18.UserInfoDataSourceImpl(
          apiConsumer: gh<_i7.ApiConsumer>(),
          localStorage: gh<_i4.LocalStorage>(),
        ));
    gh.singleton<_i19.LangRepository>(() => _i20.LangRepositoryImpl(
        langLocalDataSource: gh<_i9.LangLocalDataSource>()));
    gh.singleton<_i21.UserInfoRepository>(() => _i22.UserInfoRepositoryImpl(
          networkInfo: gh<_i6.NetworkInfo>(),
          userInfoDataSource: gh<_i18.UserInfoDataSource>(),
        ));
    gh.lazySingleton<_i23.GetSavedLangUseCase>(() => _i23.GetSavedLangUseCase(
          langRepository: gh<_i19.LangRepository>(),
          networkInfo: gh<_i6.NetworkInfo>(),
        ));
    gh.lazySingleton<_i24.ChangeLangUseCase>(() => _i24.ChangeLangUseCase(
          langRepository: gh<_i19.LangRepository>(),
          networkInfo: gh<_i6.NetworkInfo>(),
        ));
    gh.factory<_i25.LocaleCubit>(() => _i25.LocaleCubit(
          getSavedLangUseCase: gh<_i23.GetSavedLangUseCase>(),
          changeLangUseCase: gh<_i24.ChangeLangUseCase>(),
        ));
    gh.singleton<_i26.AuthRepository>(() => _i27.AuthRepositoryImpl(
          networkInfo: gh<_i6.NetworkInfo>(),
          authDataSource: gh<_i17.AuthDataSource>(),
        ));
    gh.lazySingleton<_i28.UserInfoUsecase>(() => _i28.UserInfoUsecase(
          userInfoRepository: gh<_i21.UserInfoRepository>(),
          networkInfo: gh<_i6.NetworkInfo>(),
        ));
    gh.lazySingleton<_i29.AuthUsecase>(() => _i29.AuthUsecase(
          authRepository: gh<_i26.AuthRepository>(),
          networkInfo: gh<_i6.NetworkInfo>(),
        ));
    gh.lazySingleton<_i30.AuthCubit>(() => _i30.AuthCubit(
          authUsecase: gh<_i29.AuthUsecase>(),
          userInfoUsecase: gh<_i28.UserInfoUsecase>(),
          setUpRemoteNotificationUsecase:
              gh<_i16.SetUpRemoteNotificationUsecase>(),
          isSubscribedToTopicUsecase: gh<_i13.IsSubscribedToTopicUsecase>(),
          unSubscribeToTopicUsecase: gh<_i14.UnSubscribeToTopicUsecase>(),
          localStorage: gh<_i4.LocalStorage>(),
          subscribeToTopicUsecase: gh<_i15.SubscribeToTopicUsecase>(),
        ));
    return this;
  }
}
