import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/core/di/di.dart';
import 'package:todo_list/core/router/app_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/core/theme/theme.dart';
import 'package:todo_list/domain/usecases/getweather_usecase.dart';
import 'package:todo_list/domain/usecases/project_opreation_usecase.dart';
import 'package:todo_list/presentation/bloc/cubits/project_cubit.dart';
import 'package:todo_list/presentation/bloc/cubits/weather_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized
  setup(); // Initialize the dependency injection
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WeatherCubit(getIt<GetWeatherUseCase>()),
        ),
        BlocProvider(
          create: (context) => ProjectCubit(getIt<ProjectOperationUseCase>()),
        ),
      ],
      child: MaterialApp.router(
        theme: MaterialTheme(ThemeData.light().textTheme).light(), // Provide a TextTheme
        darkTheme: MaterialTheme(ThemeData.dark().textTheme).dark(),
        routerDelegate: AutoRouterDelegate(_appRouter),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}

