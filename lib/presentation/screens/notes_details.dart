import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes/core/utils.dart/extensions.dart';
import 'package:notes/logic/notes_details/notes_details_bloc.dart';
import 'package:notes/logic/notes_list/notes_list_bloc.dart';
import 'package:notes/presentation/widgets/appbar.dart';
import 'package:notes/presentation/widgets/notes_details_card.dart';
import 'package:notes/routes/app_routes_barrel.gr.dart';

@RoutePage()
class NotesDetailsScreen extends StatefulWidget {
  NotesDetailsScreen({super.key,required this.title,required this.id});

  String? title;
  String? id;

  @override
  State<NotesDetailsScreen> createState() => _NotesDetailsScreenState();
}

class _NotesDetailsScreenState extends State<NotesDetailsScreen> {

  @override
  void initState() { 
    context.read<NotesDetailsBloc>().add(GetNoteDetailsEvent(id: widget.id!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Note Details',
        showBackButton: true,
      ),
      body: BlocBuilder<NotesDetailsBloc,NotesDetailsBlocState>(
        builder: (context,state){
          if(state is NotesDetailsErrorState){
            return Center(child: Text('Details not available'));
          }else if(state is NotesDetailsSuccessState){
            return Column(
              children: [
                Expanded(
                  child: NoteDetailsCard(
                    title: state.note!.title,
                    createdDate: state.note!.createdAt.toDdMmYyyy(),
                    content: state.note!.content,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Edit Button
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown.shade200,
                          padding: EdgeInsets.symmetric(horizontal: 70.w, vertical: 10.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        onPressed: () {
                          context.router.push(NotesFormRoute(isFromEdit: true,note: state.note!));
                        },
                        child: const Text(
                          "EDIT",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                              
                      // Delete Button
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown.shade600,
                          padding: EdgeInsets.symmetric(horizontal: 60.w, vertical: 10.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        onPressed: () {
                          context.read<NotesListBloc>().add(DeleteNoteEvent(id: state.note!.id));
                        },
                        child: const Text(
                          "DELETE",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }else{
            return CircularProgressIndicator(
              color: Colors.brown,
            );
          }
        }
      ),
    );
  }
}