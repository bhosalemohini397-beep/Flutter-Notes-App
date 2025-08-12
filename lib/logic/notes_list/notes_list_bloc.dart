import 'package:auto_route/auto_route.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:notes/data/pojo/note_model.dart';
import 'package:notes/data/services/network_api_service.dart';
import 'package:notes/routes/app_routes_barrel.gr.dart';

part 'notes_list_event.dart';
part 'notes_list_state.dart';

class NotesListBloc extends Bloc<NotesListEvent,NotesListBlocState>{
  NotesListBloc({
    required NetworkApiService networkApiServices,
    required this.router,
  }) : networkApiService = networkApiServices,
  super(NotesInitial()){
    on<FetchNotesEvent>(_fetchAllNotes);
    on<DeleteNoteEvent>(_deleteNote);
  }

  final NetworkApiService networkApiService;
  final StackRouter router;

  Future<void> _fetchAllNotes(
    FetchNotesEvent event,
    Emitter<NotesListBlocState> emit,
  ) async {
    try{
      debugPrint('fetch list');
      final result = await networkApiService.fetchNotes();

      if(result.isNotEmpty){
        emit(NotesSuccess(notes: result));
      }else{
        emit(NotesError());
      }
    }catch(e){
      rethrow;
    }
  }

  Future<void> _deleteNote(
    DeleteNoteEvent event,
    Emitter<NotesListBlocState> emit,
  )async{
    try{
      final result = await networkApiService.deleteNote(id : event.id);
      await Fluttertoast.showToast(msg: 'Note deleted');
      router.push(NotesListRoute());
    }catch(e){
      rethrow;
    }
  }
}