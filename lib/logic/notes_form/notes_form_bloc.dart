import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:notes/data/pojo/note_model.dart';
import 'package:notes/data/services/network_api_service.dart';

part 'notes_form_event.dart';
part 'notes_form_state.dart';

class NotesFormBloc extends Bloc<NotesFormEvent,NotesFormBlocState>{
  NotesFormBloc({
    required NetworkApiService networkApiServices,
    required this.router,
  }) : networkApiService = networkApiServices,
  super(NotesFormInitial()){
    on<AddNoteEvent>(_addNote);
    on<EditNoteEvent>(_editNote);
  }

  final NetworkApiService networkApiService;
  final StackRouter router;

  Future<void> _addNote(
    AddNoteEvent event,
    Emitter<NotesFormBlocState> emit,
  ) async {
    try{
      final result = await networkApiService.addNote(
        title: event.title,
        content: event.content,
      );

      if(result.id.isNotEmpty){
        emit(AddNoteSuccessState());
      }else{
        emit(AddNoteErrorState());
      }
    }catch(e){
      rethrow;
    }
  }

  Future<void> _editNote(
    EditNoteEvent event,
    Emitter<NotesFormBlocState> emit,
  )async{
    try{
      final result = await networkApiService.updateNote(updatedNote : event.note);
      await Fluttertoast.showToast(msg: 'Note updated');
      emit(AddNoteSuccessState());
    }catch(e){
      rethrow;
    }
  }

  
}