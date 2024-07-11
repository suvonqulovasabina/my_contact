import 'package:bloc/bloc.dart';
import "package:meta/meta.dart";
import 'package:my_contact/ContactData/contact_data.dart';
import 'package:my_contact/domin/repository.dart';
import 'package:my_contact/domin/repository_2.dart';
import 'package:my_contact/my_contact.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeStateScreen> {
  Repository rb = Repository();
  Repository2 rb2=Repository2();

  HomeBloc() : super(HomeStateScreen()) {
    on<Delete>((event, emit) async {
      rb2.delete(event.id);
      print(event.id.toString());
      // rb.delete(event.id);

      emit(state.copContact(delete: true));
    });

    on<Edit>((event, emit) async {
      emit(state.copContact(edit: true));
    });
    on<EventLoadGetAllContact>((event, emit) async {
      emit(state.copContact(data: rb2.getAllValues()));
    });

    on<AddContact>((event, emit)  {
      emit(state.copContact(add: true));
    });
  }
}
