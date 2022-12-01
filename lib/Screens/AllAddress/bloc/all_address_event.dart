part of 'all_address_bloc.dart';

@immutable
abstract class AllAddressEvent extends Equatable{
  const AllAddressEvent();
}
class LoadAllAddressEvent extends AllAddressEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

