part of 'all_address_bloc.dart';




@immutable
abstract class AllAddressState extends Equatable {}


class AllAddressLoadingState extends AllAddressState{
  @override
  List<Object?> get props => [];
}
//data loaded state
class AllAddressLoadedState extends AllAddressState{
  AllAddressLoadedState(this.address);
  final List<alladdressmodel> address;
  @override
  List<Object?> get props => [address];
}


//data error loading state

class AllAddressErrorState extends AllAddressState{
  final String error;
  AllAddressErrorState(this.error);
 
  @override
  List<Object?> get props => [];
}