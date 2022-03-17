import 'package:flutter/material.dart';
import 'package:test_app_miaguila/src/ui/pages/home_page.dart';
import 'package:test_app_miaguila/src/ui/pages/item_list_page.dart';
import 'package:test_app_miaguila/src/ui/pages/shopping_cart_page.dart';

import 'src/entities/entity_bloc.dart';
import 'src/models/ModelBarItem.dart';
import 'src/ui/widgets/bottom_navigation_bar_widget.dart';

class _BlocNavigator extends Bloc<int> {
  final String _key = "widgets";
  final String _defaultNamePage = "routerWidget";
  final Widget _defaultPage = const ItemListPage();
  final Map<String, Widget> _navigatorMap = {};
  List<String> _history = [];
  final Map<String, ModelBarItem> _mapModelBarItem = {};
  bool showNavigationBar = true;
  String _currentBottomItemsIndexLabel = '';

  _BlocNavigator() {
    setValue(_key, 0);
    routeTo(namePage: _defaultNamePage, page: _defaultPage);
  }

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
  routeTo({
    required String namePage,
    required Widget page,
    bool pop = false,
  }) {
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

  ///[currentBottomItemsIndex] The method that allows us to switch the index of the
  ///bottom navigation bar.
  int currentBottomItemsIndex() {
    int tmp = 0;
    int _tmp = 0;
    _mapModelBarItem.forEach((key, value) {
      if (_currentBottomItemsIndexLabel == key) {
        tmp = _tmp;
      }
      _tmp++;
    });
    return tmp;
  }

  /// [updateNavigatorStream] Updates the navigator stream.
  updateNavigatorStream() {
    setValue(_key, _history.length);
  }

  ///[addBottomBarItem] Adds a item to our Bottom Navigation Bar.
  addBottomBarItem(ModelBarItem modelBarItem) {
    _mapModelBarItem[modelBarItem.label.toLowerCase()] = modelBarItem;
  }

  ///[removeBottomBarItem] Removes an item from our bottom navigation bar.
  removeBottomBarItem(String label) {
    _mapModelBarItem.remove(label.toLowerCase());
  }

  ///[bottomNavigationBar] The widget that we will use for having our BottomNavigation
  Widget? bottomNavigationBar() {
    if (_mapModelBarItem.length < 2 || showNavigationBar == false) {
      return null;
    }
    return const BottomNavigationBarWidget();
  }

  ///[listBottomNavigationBarItems] Is the list of the Items that has been added to
  ///our bottom Navigation Bar.
  List<BottomNavigationBarItem> listBottomNavigationBarItems() {
    final List<BottomNavigationBarItem> listItems = [];
    _mapModelBarItem.forEach((key, value) {
      listItems.add(BottomNavigationBarItem(
          icon: Icon(value.icon), label: value.label.toUpperCase()));
    });
    return listItems;
  }

  ///[bottomItemNavigationAction] Is the way to the different items of the bottom
  ///navigation bar and display the information inside those pages.
  bottomItemNavigationAction(int index) {
    int _tmp = 0;
    _mapModelBarItem.forEach((key, value) {
      if (_tmp == index) {
        _currentBottomItemsIndexLabel = key;
        if (value.function != null) {
          value.function!();
        }
        routeTo(namePage: value.namePage, page: value.page);
      }
      _tmp++;
    });
  }

  setDefaultBottomsNavigationBar() {
    addBottomBarItem(
      ModelBarItem(
          namePage: 'homePage',
          label: 'Home',
          page: const ItemListPage(),
          icon: Icons.list),
    );
    addBottomBarItem(ModelBarItem(
        namePage: 'WalletTransactionHistoryPage',
        label: 'Cart',
        page: const ShoppingCartPage(),
        icon: Icons.shopping_cart));
  }
}

final blocNavigator = _BlocNavigator();
