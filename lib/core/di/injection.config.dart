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
import '../../data/repositories/otp_repository.dart' as _i640;
import '../../data/repositories/posts_repository.dart' as _i1054;
import '../../data/services/fcm_service.dart' as _i1036;
import '../../features/authenticated/posts/domain/usecases/add_like_usecase.dart'
    as _i274;
import '../../features/authenticated/posts/domain/usecases/donation_usecase.dart'
    as _i258;
import '../../features/authenticated/posts/domain/usecases/fetch_post_usecase.dart'
    as _i1037;
import '../../features/authenticated/posts/presentation/cubit/fetch_posts_cubit.dart'
    as _i131;
import '../../features/authenticated/profile/domain/usecases/check_transaction_deposit_usecase.dart'
    as _i733;
import '../../features/authenticated/profile/domain/usecases/create_project_usecase.dart'
    as _i855;
import '../../features/authenticated/profile/domain/usecases/deposit_wallet_usecase.dart'
    as _i655;
import '../../features/authenticated/profile/domain/usecases/fetch_cities_usecase.dart'
    as _i875;
import '../../features/authenticated/profile/presentation/cubit/fetch_profile_projects_cubit.dart'
    as _i915;
import '../../features/authenticated/profilePosts/domain/usecases/create_post_usecase.dart'
    as _i452;
import '../../features/authenticated/profilePosts/domain/usecases/fetch_areas_usecase.dart'
    as _i567;
import '../../features/authenticated/profilePosts/presentation/cubit/fetch_profile_posts_cubit.dart'
    as _i485;
import '../../features/authenticated/projects/domain/usecases/fetch_impacts_usecase.dart'
    as _i491;
import '../../features/authenticated/projects/domain/usecases/fetch_projects_usecase.dart'
    as _i585;
import '../../features/authenticated/projects/presentation/cubit/fetch_projects_cubit.dart'
    as _i854;
import '../../features/authentication/auth/data/datasources/auth_data_source.dart'
    as _i187;
import '../../features/authentication/auth/data/datasources/user_info_data_source.dart'
    as _i529;
import '../../features/authentication/auth/data/repositories/auth_repository_impl.dart'
    as _i985;
import '../../features/authentication/auth/data/repositories/notification_repository_impl.dart'
    as _i371;
import '../../features/authentication/auth/data/repositories/user_info_repository_impl.dart'
    as _i342;
import '../../features/authentication/auth/domain/repositories/auth_repository.dart'
    as _i784;
import '../../features/authentication/auth/domain/repositories/notification_repository.dart'
    as _i532;
import '../../features/authentication/auth/domain/repositories/user_info_repository.dart'
    as _i514;
import '../../features/authentication/auth/domain/usecases/auth_usecase.dart'
    as _i298;
import '../../features/authentication/auth/domain/usecases/get_wallet_balance_usecase.dart'
    as _i984;
import '../../features/authentication/auth/domain/usecases/notification_issubscribed_usecase.dart'
    as _i642;
import '../../features/authentication/auth/domain/usecases/notification_subscripe_usecase.dart'
    as _i594;
import '../../features/authentication/auth/domain/usecases/notification_unsubscripe_usecase.dart'
    as _i1023;
import '../../features/authentication/auth/domain/usecases/set_up_remote_notification.dart'
    as _i688;
import '../../features/authentication/auth/domain/usecases/user_info_usecase.dart'
    as _i241;
import '../../features/authentication/auth/presentation/cubit/auth_cubit.dart'
    as _i609;
import '../../features/authentication/forgetPassword/domain/usecases/forget_password_usecase.dart'
    as _i918;
import '../../features/authentication/forgetPassword/presentation/cubit/forget_password_cubit.dart'
    as _i232;
import '../../features/authentication/register/domain/usecases/signup_usecase.dart'
    as _i354;
import '../../features/authentication/register/presentation/cubit/registration_cubit.dart'
    as _i69;
import '../../features/authentication/verifyPhoneNumber/domain/usecases/otp_verification_usecase.dart'
    as _i867;
import '../../features/authentication/verifyPhoneNumber/domain/usecases/send_otp_usecase.dart'
    as _i629;
import '../../features/authentication/verifyPhoneNumber/presentation/cubit/otp_verification_cubit.dart'
    as _i255;
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
    gh.singleton<_i532.NotificationRepository>(() =>
        _i371.NotificationRepositoryImpl(
            localStorage: gh<_i198.LocalStorage>()));
    gh.lazySingleton<_i298.AuthUsecase>(() => _i298.AuthUsecase(
          authRepository: gh<_i481.AuthRepository>(),
          networkInfo: gh<_i932.NetworkInfo>(),
        ));
    gh.lazySingleton<_i984.GetWalletBalanceUsecase>(
        () => _i984.GetWalletBalanceUsecase(
              authRepository: gh<_i481.AuthRepository>(),
              networkInfo: gh<_i932.NetworkInfo>(),
            ));
    gh.lazySingleton<_i918.ForgetPasswordUsecase>(
        () => _i918.ForgetPasswordUsecase(
              authRepository: gh<_i481.AuthRepository>(),
              networkInfo: gh<_i932.NetworkInfo>(),
            ));
    gh.lazySingleton<_i354.SignupUsecase>(() => _i354.SignupUsecase(
          authRepository: gh<_i481.AuthRepository>(),
          networkInfo: gh<_i932.NetworkInfo>(),
        ));
    gh.factory<_i69.RegistrationCubit>(
        () => _i69.RegistrationCubit(gh<_i354.SignupUsecase>()));
    gh.lazySingleton<_i642.IsSubscribedToTopicUsecase>(
        () => _i642.IsSubscribedToTopicUsecase(
              notificationRepository: gh<_i532.NotificationRepository>(),
              networkInfo: gh<_i480.NetworkInfo>(),
            ));
    gh.lazySingleton<_i1023.UnSubscribeToTopicUsecase>(
        () => _i1023.UnSubscribeToTopicUsecase(
              notificationRepository: gh<_i532.NotificationRepository>(),
              networkInfo: gh<_i480.NetworkInfo>(),
            ));
    gh.lazySingleton<_i594.SubscribeToTopicUsecase>(
        () => _i594.SubscribeToTopicUsecase(
              notificationRepository: gh<_i532.NotificationRepository>(),
              networkInfo: gh<_i480.NetworkInfo>(),
            ));
    gh.lazySingleton<_i688.SetUpRemoteNotificationUsecase>(
        () => _i688.SetUpRemoteNotificationUsecase(
              notificationRepository: gh<_i532.NotificationRepository>(),
              networkInfo: gh<_i480.NetworkInfo>(),
            ));
    gh.factory<_i232.ForgetPasswordCubit>(
        () => _i232.ForgetPasswordCubit(gh<_i918.ForgetPasswordUsecase>()));
    gh.lazySingleton<_i609.AuthCubit>(() => _i609.AuthCubit(
          gh<_i298.AuthUsecase>(),
          gh<_i984.GetWalletBalanceUsecase>(),
          gh<_i198.LocalStorage>(),
        ));
    gh.singleton<_i187.AuthDataSource>(() => _i187.AuthDataSourceImpl(
          apiConsumer: gh<_i207.ApiConsumer>(),
          localStorage: gh<_i198.LocalStorage>(),
        ));
    gh.singleton<_i529.UserInfoDataSource>(() => _i529.UserInfoDataSourceImpl(
          apiConsumer: gh<_i207.ApiConsumer>(),
          localStorage: gh<_i198.LocalStorage>(),
        ));
    gh.singleton<_i865.LangRepository>(() => _i705.LangRepositoryImpl(
        langLocalDataSource: gh<_i600.LangLocalDataSource>()));
    gh.singleton<_i1054.PostsRepository>(() => _i1054.PostsRepositoryImpl(
          localStorage: gh<_i198.LocalStorage>(),
          apiConsumer: gh<_i207.ApiConsumer>(),
          networkInfo: gh<_i932.NetworkInfo>(),
        ));
    gh.singleton<_i640.OtpRepository>(() => _i640.OtpRepositoryImpl(
          localStorage: gh<_i198.LocalStorage>(),
          apiConsumer: gh<_i207.ApiConsumer>(),
          networkInfo: gh<_i932.NetworkInfo>(),
        ));
    gh.singleton<_i514.UserInfoRepository>(() => _i342.UserInfoRepositoryImpl(
          networkInfo: gh<_i480.NetworkInfo>(),
          userInfoDataSource: gh<_i529.UserInfoDataSource>(),
        ));
    gh.lazySingleton<_i629.SendOtpUsecase>(() => _i629.SendOtpUsecase(
          otpRepository: gh<_i640.OtpRepository>(),
          networkInfo: gh<_i932.NetworkInfo>(),
        ));
    gh.lazySingleton<_i867.OtpVerificationUsecase>(
        () => _i867.OtpVerificationUsecase(
              otpRepository: gh<_i640.OtpRepository>(),
              networkInfo: gh<_i932.NetworkInfo>(),
            ));
    gh.lazySingleton<_i586.GetSavedLangUseCase>(() => _i586.GetSavedLangUseCase(
          langRepository: gh<_i865.LangRepository>(),
          networkInfo: gh<_i932.NetworkInfo>(),
        ));
    gh.lazySingleton<_i92.ChangeLangUseCase>(() => _i92.ChangeLangUseCase(
          langRepository: gh<_i865.LangRepository>(),
          networkInfo: gh<_i932.NetworkInfo>(),
        ));
    gh.singleton<_i784.AuthRepository>(() => _i985.AuthRepositoryImpl(
          networkInfo: gh<_i480.NetworkInfo>(),
          authDataSource: gh<_i187.AuthDataSource>(),
        ));
    gh.lazySingleton<_i274.AddLikeUsecase>(() => _i274.AddLikeUsecase(
          postsRepository: gh<_i1054.PostsRepository>(),
          networkInfo: gh<_i932.NetworkInfo>(),
        ));
    gh.lazySingleton<_i1037.FetchPostsUsecase>(() => _i1037.FetchPostsUsecase(
          postsRepository: gh<_i1054.PostsRepository>(),
          networkInfo: gh<_i932.NetworkInfo>(),
        ));
    gh.lazySingleton<_i258.DonationUsecase>(() => _i258.DonationUsecase(
          postsRepository: gh<_i1054.PostsRepository>(),
          networkInfo: gh<_i932.NetworkInfo>(),
        ));
    gh.lazySingleton<_i452.CreatePostsUsecase>(() => _i452.CreatePostsUsecase(
          postsRepository: gh<_i1054.PostsRepository>(),
          networkInfo: gh<_i932.NetworkInfo>(),
        ));
    gh.lazySingleton<_i567.FetchAreasUsecase>(() => _i567.FetchAreasUsecase(
          postsRepository: gh<_i1054.PostsRepository>(),
          networkInfo: gh<_i932.NetworkInfo>(),
        ));
    gh.lazySingleton<_i585.FetchProjectsUsecase>(
        () => _i585.FetchProjectsUsecase(
              postsRepository: gh<_i1054.PostsRepository>(),
              networkInfo: gh<_i932.NetworkInfo>(),
            ));
    gh.lazySingleton<_i491.FetchImpactsUsecase>(() => _i491.FetchImpactsUsecase(
          postsRepository: gh<_i1054.PostsRepository>(),
          networkInfo: gh<_i932.NetworkInfo>(),
        ));
    gh.lazySingleton<_i655.DepositWalletUsecase>(
        () => _i655.DepositWalletUsecase(
              postsRepository: gh<_i1054.PostsRepository>(),
              networkInfo: gh<_i932.NetworkInfo>(),
            ));
    gh.lazySingleton<_i855.CreateProjectUsecase>(
        () => _i855.CreateProjectUsecase(
              postsRepository: gh<_i1054.PostsRepository>(),
              networkInfo: gh<_i932.NetworkInfo>(),
            ));
    gh.lazySingleton<_i733.CheckTransactionDepositUsecase>(
        () => _i733.CheckTransactionDepositUsecase(
              postsRepository: gh<_i1054.PostsRepository>(),
              networkInfo: gh<_i932.NetworkInfo>(),
            ));
    gh.lazySingleton<_i875.FetchCitiesUsecase>(() => _i875.FetchCitiesUsecase(
          postsRepository: gh<_i1054.PostsRepository>(),
          networkInfo: gh<_i932.NetworkInfo>(),
        ));
    gh.factoryParam<_i485.FetchProfilePostsCubit, String, int>((
      projectId,
      projectCityId,
    ) =>
        _i485.FetchProfilePostsCubit(
          projectId,
          projectCityId,
          gh<_i452.CreatePostsUsecase>(),
          gh<_i1037.FetchPostsUsecase>(),
          gh<_i274.AddLikeUsecase>(),
          gh<_i258.DonationUsecase>(),
          gh<_i567.FetchAreasUsecase>(),
        ));
    gh.lazySingleton<_i241.UserInfoUsecase>(() => _i241.UserInfoUsecase(
          userInfoRepository: gh<_i514.UserInfoRepository>(),
          networkInfo: gh<_i480.NetworkInfo>(),
        ));
    gh.factory<_i915.FetchProfileProjectsCubit>(
        () => _i915.FetchProfileProjectsCubit(
              gh<_i585.FetchProjectsUsecase>(),
              gh<_i855.CreateProjectUsecase>(),
              gh<_i875.FetchCitiesUsecase>(),
              gh<_i655.DepositWalletUsecase>(),
              gh<_i733.CheckTransactionDepositUsecase>(),
            ));
    gh.factory<_i131.FetchPostsCubit>(() => _i131.FetchPostsCubit(
          gh<_i1037.FetchPostsUsecase>(),
          gh<_i258.DonationUsecase>(),
          gh<_i274.AddLikeUsecase>(),
        ));
    gh.factory<_i854.FetchProjectsCubit>(() => _i854.FetchProjectsCubit(
          gh<_i585.FetchProjectsUsecase>(),
          gh<_i491.FetchImpactsUsecase>(),
        ));
    gh.factory<_i258.LocaleCubit>(() => _i258.LocaleCubit(
          getSavedLangUseCase: gh<_i586.GetSavedLangUseCase>(),
          changeLangUseCase: gh<_i92.ChangeLangUseCase>(),
        ));
    gh.factoryParam<_i255.OtpVerificationCubit, String, dynamic>((
      phoneNumber,
      _,
    ) =>
        _i255.OtpVerificationCubit(
          phoneNumber,
          sendOtpUsecase: gh<_i629.SendOtpUsecase>(),
          otpVerificationUsecase: gh<_i867.OtpVerificationUsecase>(),
        ));
    return this;
  }
}

class _$FirebaseModule extends _i464.FirebaseModule {}
