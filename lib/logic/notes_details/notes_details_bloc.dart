import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/data/pojo/note_model.dart';
import 'package:notes/data/services/network_api_service.dart';

part 'notes_details_event.dart';
part 'notes_details_state.dart';

class NotesDetailsBloc extends Bloc<NotesDetailsEvent,NotesDetailsBlocState>{
  NotesDetailsBloc({
    required NetworkApiService networkApiServices,
    required this.router,
  }) : networkApiService = networkApiServices,
  super(NotesDetailsInitial()){
    on<GetNoteDetailsEvent>(_getDetails);
  }

  final NetworkApiService networkApiService;
  final StackRouter router;

  Future<void> _getDetails(
    GetNoteDetailsEvent event,
    Emitter<NotesDetailsBlocState> emit,
  ) async {
    try{
      final result = await networkApiService.getNoteById(
        id: event.id,
      );

      if(result != null){
        emit((NotesDetailsSuccessState(note: result)));
      }else{
        emit(NotesDetailsErrorState());
      }
    }catch(e){
      rethrow;
    }
  }
}