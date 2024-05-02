import 'package:get_it/get_it.dart';
import 'package:jint/jint/data/data_source/account_rgistration_data_source/account_rgistration_data_source.dart';
import 'package:jint/jint/data/data_source/client_date_data_source/client_date_data_source.dart';
import 'package:jint/jint/data/data_source/date_data_source/date_data_source.dart';
import 'package:jint/jint/data/data_source/date_details_data_source/date_details_data_source.dart';
import 'package:jint/jint/data/data_source/login_data_source/login_data_source.dart';
import 'package:jint/jint/data/data_source/search_data_source/search_data_source.dart';
import 'package:jint/jint/data/data_source/specialty_data_source/specialty_data_source.dart';
import 'package:jint/jint/data/data_source/user_data_source/user_data_source.dart';
import 'package:jint/jint/data/repository/account_rgistration_repository.dart';
import 'package:jint/jint/data/repository/client_date_repository.dart';
import 'package:jint/jint/data/repository/date_data_repository.dart';
import 'package:jint/jint/data/repository/date_details_repository.dart';
import 'package:jint/jint/data/repository/login_repository.dart';
import 'package:jint/jint/data/repository/search_repository.dart';
import 'package:jint/jint/data/repository/specialty_data_repository.dart';
import 'package:jint/jint/data/repository/user_data_repository.dart';
import 'package:jint/jint/domain/repositort/base_account_rgistration_repository.dart';
import 'package:jint/jint/domain/repositort/base_client_date_repository.dart';
import 'package:jint/jint/domain/repositort/base_date_details_repositort.dart';
import 'package:jint/jint/domain/repositort/base_date_repository.dart';
import 'package:jint/jint/domain/repositort/base_login_repositort.dart';
import 'package:jint/jint/domain/repositort/base_search_repository.dart';
import 'package:jint/jint/domain/repositort/base_specialty_repository.dart';
import 'package:jint/jint/domain/repositort/base_user_data_repositort.dart.dart';
import 'package:jint/jint/domain/usecase/account_rgistration_use_case/account_rgistration_usecase.dart';
import 'package:jint/jint/domain/usecase/login_user_usecase/login_user_usecase.dart';
import 'package:jint/jint/presentation/contriller/account_rgistration_bloc/account_rgistration_bloc.dart';
import 'package:jint/jint/presentation/contriller/client_date_bloc/client_date_bloc.dart';
import 'package:jint/jint/presentation/contriller/date_bloc/date_bloc.dart';
import 'package:jint/jint/presentation/contriller/date_details_bloc/date_details_bloc.dart';
import 'package:jint/jint/presentation/contriller/login_bloc/login_bloc.dart';
import 'package:jint/jint/presentation/contriller/search_bloc/search_bloc.dart';
import 'package:jint/jint/presentation/contriller/specialty_bloc/specialty_bloc.dart';
import 'package:jint/jint/presentation/contriller/user_bloc/user_bloc.dart';

final sl = GetIt.instance;
class ServicesLocator{
  void init(){
    /// Bloc
    sl.registerFactory(() =>AccountRgistrationBloc(sl()));
    sl.registerFactory(() =>LoginBloc(sl()));
    sl.registerFactory(() =>UserBloc(sl(),sl(),sl(),sl(),sl(),sl(),));
    sl.registerFactory(() =>SpecialtyBloc(sl(),sl(),sl(),sl(),));
    sl.registerFactory(() =>DateBloc(sl(),sl(),sl(),sl(),));
    sl.registerFactory(() =>DateDetailsBloc(sl(),sl(),sl(),sl(),));
    sl.registerFactory(() =>ClientDateBloc(sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl(),));
    sl.registerFactory(() =>SearchBloc(sl(),));

    /// Use Cases
    sl.registerLazySingleton(() =>AccountRgistrationUseCase(accountRgistrationRepository: sl()));
    sl.registerLazySingleton(() =>LoginUseCase(baseLoginRepository: sl()));


    ///Repository
    sl.registerLazySingleton<BaseAccountRgistrationRepository>(() => AccountRgistrationRepository(baseAccountRgistrationDataSource: sl(),));
    sl.registerLazySingleton<BaseLoginRepository>(() => LoginRepository(baseLoginDataSource: sl(),));
    sl.registerLazySingleton<BaseUserDataRepository>(() => UserDataRepository(baseUserDataSource: sl(),));
    sl.registerLazySingleton<BaseSpecialtyRepository>(() => SpecialtyRepository(baseSpecialtyDataSource: sl(),));
    sl.registerLazySingleton<BaseDateRepository>(() => DateDataRepository(baseDateRemoteDataSource: sl(),));
    sl.registerLazySingleton<BaseDateDetailsRepository>(() => DateDetailsRepository(baseDateDetailsDataSource: sl(),));
    sl.registerLazySingleton<BaseClientDateRepository>(() => ClientDateRepository(baseClientDateDataSource: sl(),));
    sl.registerLazySingleton<BaseSearchRepository>(() => SearchRepository(baseSearchDataSource: sl(),));


    ///   Data Source
    sl.registerLazySingleton<BaseAccountRgistrationDataSource>(()=>AccountRgistrationRemoteDataSource());
    sl.registerLazySingleton<BaseLoginDataSource>(()=>LoginRemoteDataSource());
    sl.registerLazySingleton<BaseUserDataSource>(()=>UserRemoteDataSource());
    sl.registerLazySingleton<BaseSpecialtyDataSource>(()=>SpecialtyRemoteDataSource());
    sl.registerLazySingleton<BaseDateDataSource>(()=>DateRemoteDataSource());
    sl.registerLazySingleton<BaseDateDetailsDataSource>(()=>DateDetailsRemoteDataSource());
    sl.registerLazySingleton<BaseClientDateDataSource>(()=>ClientDateRemoteDataSource());
    sl.registerLazySingleton<BaseSearchDataSource>(()=>SearchRemoteDataSource());


  }
}