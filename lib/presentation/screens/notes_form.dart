import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:notes/core/constants/app_colors.dart';
import 'package:notes/data/pojo/note_model.dart';
import 'package:notes/logic/notes_form/notes_form_bloc.dart';
import 'package:notes/logic/notes_list/notes_list_bloc.dart';
import 'package:notes/presentation/widgets/appbar.dart';

@RoutePage()
class NotesFormScreen extends StatefulWidget {
  NotesFormScreen({super.key,required this.isFromEdit,this.note});

  bool isFromEdit;
  NoteModel? note;

  @override
  State<NotesFormScreen> createState() => _NotesFormScreenState();
}

class _NotesFormScreenState extends State<NotesFormScreen> {

  TextEditingController titleTEC = TextEditingController();
  TextEditingController contentTEC = TextEditingController();

  @override
  void initState() {
    editNote();
    super.initState();
  }

  void editNote(){
    debugPrint('edit note ${widget.isFromEdit.toString()}');
    if(widget.isFromEdit == true){
      titleTEC.text = widget.note!.title;
        contentTEC.text = widget.note!.content;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar(
        title: 'Add Note',
        showBackButton: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 14.w,vertical: 10.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
              child: BlocListener<NotesFormBloc,NotesFormBlocState>(
                listener: (context,state) async {
                   if(state is AddNoteErrorState)  {
                    await Fluttertoast.showToast(msg: 'Something went wrong');
                   }else if(state is AddNoteSuccessState){
                    context.read<NotesListBloc>().add(FetchNotesEvent());
                    context.router.pop();
                   }
                },
                child: Column(
                spacing: 10.h,
                children: [
                  TextField(
                    controller: titleTEC,
                    style: TextStyle(
                        fontSize: 22.h,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                    ),
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                      hintText: 'Add title',
                      hintStyle: TextStyle(
                        fontSize: 22.h,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                    onChanged: (value) {
                      setState(() {
                        titleTEC.text = value;
                      });
                    },
                  ),
                  TextField(
                    controller: contentTEC,
                    maxLines: null, // Allows unlimited lines
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: 'Write your note here...',
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    ),
                    onChanged: (value) {
                      setState(() {
                        contentTEC.text = value;
                      });
                    },
                  )
                ],
                                  ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal : 16.w,vertical: 20.h),
            child: GestureDetector(
              onTap: () async{
                if(titleTEC.text != null || contentTEC.text != null){
                  if(widget.isFromEdit == false){
                    context.read<NotesFormBloc>().add(AddNoteEvent(title: titleTEC.text!, content: contentTEC.text!));
                  }else{
                    final updatedNote = widget.note!.copyWith(
                      title: titleTEC.text.trim(),
                      content: contentTEC.text.trim(),
                    );
                    context.read<NotesFormBloc>().add(EditNoteEvent(note: updatedNote));
                  }
                }else{
                  await Fluttertoast.showToast(msg: 'Note is blank');
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                        decoration: BoxDecoration(
              color: Colors.brown.shade200,
              borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Center(
              child : Text(
                'Save',
                 style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                 ),
              ),
                        ),
                      ),
            ),
          )
        ],
      ),
    );
  }
}