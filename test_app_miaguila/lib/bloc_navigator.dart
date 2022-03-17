import 'package:flutter/material.dart';
import 'package:test_app_miaguila/src/ui/pages/home_page.dart';

import 'src/entities/entity_bloc.dart';

class _BlocNavigator extends Bloc<int> {
  final String _key = "widgets";
  final String _defaultNamePage = "homePage";
  final Widget _defaultPage = const HomePage();
  final Map<String, Widget> _navigatorMap = {};
  List<String> _history = [];

  _BlocNavigator() {
    setValue(_key, 0);
    routeTo(namePage: _defaultNamePage, page: _defaultPage);
  }

  /// [goToPreloader] goes to the preloader of the application.
  goToPreloader() {}

  /// [streamPage] Gets the current page as stream.
  Stream<int> get streamPage => getStream(_key) as Stream<int>;

  /// [sizeOfHistory] Gets the size represented as an integer.
  int get sizeOfHistory => getValue(_key) ?? 0;

  /// [currentPage] gets the current page.
  Widget get currentPage => _getCurrentPage();

  /// [_getCurrentPage] Checks the map, with the current page so it gets added.
  Widget _getCurrentPage() {
    return _navigatorMap[_history.last] ?? _defaultPage;
  }

  /// [routeTo] working with routing
  routeTo(
      {required String namePage,
      required Widget page,
      bool pop = false,
      bool isWithBackground = true}) {
    if (pop) {
      removeFromHistory(_history.last);
    }
    _navigatorMap[namePage] = page;
    addToHistory(namePage);
  }

  /// [addToHistory] Adds the key into the history, and then updates the navigator Stream.
  addToHistory(String key) {
    List<String> listaTmp = [];
    if (_history.isNotEmpty) {
      for (var pagina in _history) {
        if (pagina != key) {
          listaTmp.add(pagina);
        }
      }
    }
    listaTmp.add(key);
    _history = listaTmp;
    updateNavigatorStream();
  }

  /// [removeFromHistory] Removes the key from the history. After doing this, updates the navigator Stream.
  removeFromHistory(String key) {
    _navigatorMap.remove(key);
    _history.remove(key);
    updateNavigatorStream();
  }

  /// [updateNavigatorStream] Updates the navigator stream.
  updateNavigatorStream() {
    setValue(_key, _history.length);
  }
}

final blocNavigator = _BlocNavigator();
