import 'package:auto_route/auto_route.dart';
import '../data/models/movie.dart';
import '../screens/detail_page.dart';
import '../screens/home_page.dart';

import 'package:flutter/material.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: DetailPage),
  ],
)
class AppRouter extends _$AppRouter {}
