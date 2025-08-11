import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes/core/constants/app_colors.dart';
import 'package:notes/core/utils.dart/extensions.dart';
import 'package:notes/logic/notes_details/notes_details_bloc.dart';
import 'package:notes/presentation/widgets/appbar.dart';

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
        title: widget.title!,
        showBackButton: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 14.w,vertical: 10.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: BlocBuilder<NotesDetailsBloc,NotesDetailsBlocState>(
          builder: (context,state){
            if(state is NotesDetailsErrorState){
              return Center(child: Text('Details not available'));
            }else if(state is NotesDetailsSuccessState){
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 15.h,
                children: [
                  Text(
                    'Created on : ${state.note!.createdAt.toDdMmYyyy()}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black.withAlpha(80),
                    ),
                  ),
                  Text(
                    state.note!.content,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.textPrimary,
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
        )
      ),
    );
  }
}