part of 'shops_cubit.dart';



abstract class ShopsState{}

class ShopsInitialState extends ShopsState{}

class GetProductsLoading extends ShopsState{}

class GetProductsLoaded extends ShopsState{
  final ProductsModel productsModel;
  GetProductsLoaded(this.productsModel);
}
class GetProductsError extends ShopsState{}


