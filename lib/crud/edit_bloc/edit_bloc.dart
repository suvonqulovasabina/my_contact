import 'package:bloc/bloc.dart' show Bloc;
import 'package:my_contact/ContactData/contact_data.dart';
import 'package:my_contact/domin/repository.dart';
import 'package:my_contact/domin/repository_2.dart';
import 'package:my_contact/my_contact.dart';

part 'edit_event.dart';

part 'edit_state.dart';

class EditBloc extends Bloc<EditEvent, EditState> {
  Repository n = Repository();
  Repository2 rb2 = Repository2();

  EditBloc() : super(EditState(edit: false)) {
    on<EditEvent>((event, emit) {
      rb2.updateElement(event.index,event.data);

      emit(EditState(edit: true));
    });
  }
}
