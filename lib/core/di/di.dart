import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:todo_list/data/datasources/local_datasource_imp.dart';
import 'package:todo_list/data/repositories/project_repo_impl.dart';
import 'package:todo_list/data/repositories/weather_repo_impl.dart';
import 'package:todo_list/domain/api_client.dart';
import 'package:todo_list/domain/datasources/datasource.dart';
import 'package:todo_list/domain/datasources/local_datasource.dart';
import 'package:todo_list/domain/repositories/project_repository.dart';
import 'package:todo_list/domain/repositories/weather_repo.dart';
import 'package:todo_list/domain/usecases/getweather_usecase.dart';
import 'package:todo_list/data/datasources/remote_datasource_imp.dart';
import 'package:todo_list/core/api_clients/http_client.dart';
import 'package:todo_list/domain/usecases/project_opreation_usecase.dart';

final getIt = GetIt.instance;

void setup() {
  // Register the HTTP client implementation
  getIt.registerLazySingleton<http.Client>(() => http.Client());

  // Register the HttpNetworkClient
  getIt.registerLazySingleton<APIClient>(() => HttpNetworkClient(getIt<http.Client>()));

  // Register the RemoteDatasourceImp
  getIt.registerLazySingleton<Datasource>(
      () => RemoteDatasourceImp(getIt<APIClient>()));

  // Register the WeatherRepoImpl
  getIt.registerLazySingleton<WeatherRepository>(
      () => WeatherRepoImpl(getIt<Datasource>()));

  // Register the GetWeatherUseCase
  getIt.registerLazySingleton<GetWeatherUseCase>(
      () => GetWeatherUseCase(getIt<WeatherRepository>()));

  // Add this to your existing setup() function
  getIt.registerLazySingleton<LocalDataSource>(
    () => LocalDataSourceImpl(),
  );

  getIt.registerLazySingleton<ProjectRepository>(
    () => ProjectRepositoryImpl(getIt<LocalDataSource>()),
  );

  getIt.registerLazySingleton<ProjectOperationUseCase>(
    () => ProjectOperationUseCase(getIt<ProjectRepository>()));
  

}
