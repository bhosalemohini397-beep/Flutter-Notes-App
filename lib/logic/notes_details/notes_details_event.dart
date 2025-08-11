part of 'notes_details_bloc.dart';

sealed class NotesDetailsEvent{}

class GetNoteDetailsEvent extends NotesDetailsEvent{
  GetNoteDetailsEvent({required this.id});
  String id;
}
