// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:todo_list/data/models/project_model.dart' as _i6;
import 'package:todo_list/presentation/pages/edit_project_screen.dart' as _i1;
import 'package:todo_list/presentation/pages/main_screen.dart' as _i2;
import 'package:todo_list/presentation/pages/project_screen.dart' as _i3;

/// generated route for
/// [_i1.EditProjectScreen]
class EditProjectRoute extends _i4.PageRouteInfo<EditProjectRouteArgs> {
  EditProjectRoute({
    _i5.Key? key,
    required _i6.Project project,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          EditProjectRoute.name,
          args: EditProjectRouteArgs(
            key: key,
            project: project,
          ),
          initialChildren: children,
        );

  static const String name = 'EditProjectRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EditProjectRouteArgs>();
      return _i1.EditProjectScreen(
        key: args.key,
        project: args.project,
      );
    },
  );
}

class EditProjectRouteArgs {
  const EditProjectRouteArgs({
    this.key,
    required this.project,
  });

  final _i5.Key? key;

  final _i6.Project project;

  @override
  String toString() {
    return 'EditProjectRouteArgs{key: $key, project: $project}';
  }
}

/// generated route for
/// [_i2.MainScreen]
class MainRoute extends _i4.PageRouteInfo<void> {
  const MainRoute({List<_i4.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return _i2.MainScreen();
    },
  );
}

/// generated route for
/// [_i3.ProjectScreen]
class ProjectRoute extends _i4.PageRouteInfo<void> {
  const ProjectRoute({List<_i4.PageRouteInfo>? children})
      : super(
          ProjectRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProjectRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return _i3.ProjectScreen();
    },
  );
}
