// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/auth/data/datasources/auth_data_source.dart' as _i21;
import '../../features/auth/data/datasources/user_info_data_source.dart'
    as _i20;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i24;
import '../../features/auth/data/repositories/notification_repository_impl.dart'
    as _i5;
import '../../features/auth/data/repositories/user_info_repository_impl.dart'
    as _i26;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i23;
import '../../features/auth/domain/repositories/notification_repository.dart'
    as _i4;
import '../../features/auth/domain/repositories/user_info_repository.dart'
    as _i25;
import '../../features/auth/domain/usecases/auth_usecase.dart' as _i27;
import '../../features/auth/domain/usecases/notification_issubscribed_usecase.dart'
    as _i11;
import '../../features/auth/domain/usecases/notification_subscripe_usecase.dart'
    as _i13;
import '../../features/auth/domain/usecases/notification_unsubscripe_usecase.dart'
    as _i12;
import '../../features/auth/domain/usecases/set_up_remote_notification.dart'
    as _i14;
import '../../features/auth/domain/usecases/user_info_usecase.dart' as _i28;
import '../../features/auth/presentation/cubit/auth_cubit.dart' as _i29;
import '../../features/splash/data/datasources/lang_local_data_source.dart'
    as _i8;
import '../../features/splash/data/repositories/lang_repository_impl.dart'
    as _i10;
import '../../features/splash/domain/repositories/lang_repository.dart' as _i9;
import '../../features/splash/domain/usecases/change_lang.dart' as _i19;
import '../../features/splash/domain/usecases/get_saved_lang.dart' as _i18;
import '../../features/splash/presentation/cubit/locale_cubit.dart' as _i22;
import '../api/api_consumer.dart' as _i15;
import '../api/api_consumer_mock_impl.dart' as _i16;
import '../api/api_consumer_prod_impl.dart' as _i17;
import '../api/api_helper.dart' as _i6;
import '../localStorage/loacal_storage.dart' as _i3;
import '../network/netwok_info.dart' as _i7;

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
    gh.singleton<_i3.LocalStorage>(() => _i3.LocalStorageImpl());
    gh.singleton<_i4.NotificationRepository>(() =>
        _i5.NotificationRepositoryImpl(localStorage: gh<_i3.LocalStorage>()));
    gh.lazySingleton<_i6.ApiHelper>(() => _i6.ApiHelperImpl());
    gh.singleton<_i7.NetworkInfo>(() => _i7.NetworkInfoImpl());
    gh.singleton<_i8.LangLocalDataSource>(() =>
        _i8.LangLocalDataSourceImpl(localStorage: gh<_i3.LocalStorage>()));
    gh.singleton<_i9.LangRepository>(() => _i10.LangRepositoryImpl(
        langLocalDataSource: gh<_i8.LangLocalDataSource>()));
    gh.lazySingleton<_i11.IsSubscribedToTopicUsecase>(() =>
        _i11.IsSubscribedToTopicUsecase(
            notificationRepository: gh<_i4.NotificationRepository>()));
    gh.lazySingleton<_i12.UnSubscribeToTopicUsecase>(() =>
        _i12.UnSubscribeToTopicUsecase(
            notificationRepository: gh<_i4.NotificationRepository>()));
    gh.lazySingleton<_i13.SubscribeToTopicUsecase>(() =>
        _i13.SubscribeToTopicUsecase(
            notificationRepository: gh<_i4.NotificationRepository>()));
    gh.lazySingleton<_i14.SetUpRemoteNotificationUsecase>(() =>
        _i14.SetUpRemoteNotificationUsecase(
            notificationRepository: gh<_i4.NotificationRepository>()));
    gh.factory<_i15.ApiConsumer>(
      () => _i16.DioConsumerMockImpl(gh<_i7.NetworkInfo>()),
      registerFor: {_mock},
    );
    gh.factory<_i15.ApiConsumer>(
      () => _i17.DioConsumerProdImpl(gh<_i7.NetworkInfo>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i18.GetSavedLangUseCase>(() =>
        _i18.GetSavedLangUseCase(langRepository: gh<_i9.LangRepository>()));
    gh.lazySingleton<_i19.ChangeLangUseCase>(
        () => _i19.ChangeLangUseCase(langRepository: gh<_i9.LangRepository>()));
    gh.singleton<_i20.UserInfoDataSource>(() => _i20.UserInfoDataSourceImpl(
          apiConsumer: gh<_i15.ApiConsumer>(),
          localStorage: gh<_i3.LocalStorage>(),
        ));
    gh.singleton<_i21.AuthDataSource>(() => _i21.AuthDataSourceImpl(
          apiConsumer: gh<_i15.ApiConsumer>(),
          localStorage: gh<_i3.LocalStorage>(),
        ));
    gh.factory<_i22.LocaleCubit>(() => _i22.LocaleCubit(
          getSavedLangUseCase: gh<_i18.GetSavedLangUseCase>(),
          changeLangUseCase: gh<_i19.ChangeLangUseCase>(),
        ));
    gh.singleton<_i23.AuthRepository>(() => _i24.AuthRepositoryImpl(
          networkInfo: gh<_i7.NetworkInfo>(),
          authDataSource: gh<_i21.AuthDataSource>(),
        ));
    gh.singleton<_i25.UserInfoRepository>(() => _i26.UserInfoRepositoryImpl(
          networkInfo: gh<_i7.NetworkInfo>(),
          userInfoDataSource: gh<_i20.UserInfoDataSource>(),
        ));
    gh.lazySingleton<_i27.AuthUsecase>(
        () => _i27.AuthUsecase(authRepository: gh<_i23.AuthRepository>()));
    gh.lazySingleton<_i28.UserInfoUsecase>(() => _i28.UserInfoUsecase(
        userInfoRepository: gh<_i25.UserInfoRepository>()));
    gh.lazySingleton<_i29.AuthCubit>(() => _i29.AuthCubit(
          authUsecase: gh<_i27.AuthUsecase>(),
          userInfoUsecase: gh<_i28.UserInfoUsecase>(),
          setUpRemoteNotificationUsecase:
              gh<_i14.SetUpRemoteNotificationUsecase>(),
          isSubscribedToTopicUsecase: gh<_i11.IsSubscribedToTopicUsecase>(),
          unSubscribeToTopicUsecase: gh<_i12.UnSubscribeToTopicUsecase>(),
          localStorage: gh<_i3.LocalStorage>(),
          subscribeToTopicUsecase: gh<_i13.SubscribeToTopicUsecase>(),
        ));
    return this;
  }
}
