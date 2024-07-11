import 'package:bloc/bloc.dart';
import 'package:my_contact/domin/repository_2.dart';
import 'package:my_contact/my_contact.dart';

import '../../domin/repository.dart';

part 'add_event.dart';

part 'add_state.dart';

class AddBloc extends Bloc<AddEvent, AddState> {
  final Repository db = Repository();
  final Repository2 db2 = Repository2();

  AddBloc() : super(AddState(openHome: false)) {

    on<AddEvent>((event, emit) {

      Repository2.addElement(event.data, event.index);
      print("edd brigandage" + event.data.phone);
      emit(AddState(
        openHome: true,
      ));
    });
  }
}
