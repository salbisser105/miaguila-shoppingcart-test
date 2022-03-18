import 'package:test_app_miaguila/src/entities/entity_bloc.dart';
import 'package:test_app_miaguila/src/models/item_model.dart';
import 'package:test_app_miaguila/src/models/order_model.dart';


//TODO The idea of this class was to handle the state of the whole cart. Due to time it was not done. 
class BlocOrder extends Bloc<OrderModel> {
  final String _key = "order";
  late OrderModel _order;
  BlocOrder() {
    setValue(
        _key,
        OrderModel(
            1,
            ItemModel(
                'Shirt Hugo Boss',
                50.0,
                'Shirt size M, hugo Boss. New collection.',
                'https://fututiendas.com/images/com_sellacious/products/primary_image/3250/2050_5ed03f975b988-cta_hugo.jpg'),
            5.0));
  }

  OrderModel get currentOrder =>
      getValue(_key) ??
      OrderModel(1, ItemModel('test', 20.0, 'this is a test', ''), 20.0);

  Stream<OrderModel> get currentOrderStream =>
      getStream(_key) as Stream<OrderModel>;

      set currentOrder(OrderModel order){
        setValue(_key, order);
      }
      addOrder() async {

      }
}
