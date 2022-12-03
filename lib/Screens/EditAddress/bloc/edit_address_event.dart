part of 'edit_address_bloc.dart';

abstract class EditAddressEvent extends Equatable {
  const EditAddressEvent();

  @override
  List<Object> get props => [];
}
class LoadEditAddressEvent extends EditAddressEvent {
  //passing the parameters to add address
  final String label, line1, line2, city, State, mobile, Status, pincode,addid;
  LoadEditAddressEvent(this.mobile, this.label, this.line1, this.line2,
      this.city, this.State, this.Status, this.pincode,this.addid);

  @override
  List<Object> get props => [];
}

class ErrorEditAddressEvent extends EditAddressEvent {
  @override
  List<Object> get props => [];
}