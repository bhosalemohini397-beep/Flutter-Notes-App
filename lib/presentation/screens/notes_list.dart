import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes/core/constants/app_colors.dart';
import 'package:notes/core/utils.dart/extensions.dart';
import 'package:notes/logic/notes_list/notes_list_bloc.dart';
import 'package:notes/presentation/widgets/appbar.dart';
import 'package:notes/routes/app_routes_barrel.gr.dart';

@RoutePage()
class NotesListScreen extends StatefulWidget {
  const NotesListScreen({super.key});

  @override
  State<NotesListScreen> createState() => _NotesListScreenState();
}

class _NotesListScreenState extends State<NotesListScreen> {

@override
  void initState() {
    context.read<NotesListBloc>().add(FetchNotesEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Notes',
        ),
        body: BlocBuilder<NotesListBloc,NotesListBlocState>(
          builder: (context,state){
            if(state is NotesSuccess){
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 14.w,vertical: 10.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                // height: 500.h,
                child: ListView.separated(
                  itemCount: state.notes!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        context.router.push(NotesDetailsRoute(title: state.notes![index].title,id: state.notes![index].id));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left : 16.w,top : 5.h,bottom: 5.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.notes![index].title,
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  state.notes![index].content.toShortSentence(),
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textPrimary,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.only(right : 16.w),
                            child: Row(
                              spacing: 20,
                              children: [
                                InkWell(
                                  onTap: (){
                                    debugPrint("Note : ${state.notes![index].content}");
                                    context.router.push(NotesFormRoute(isFromEdit: true,note: state.notes![index]));
                                  },
                                  child: Icon(Icons.edit),
                                ),

                                InkWell(
                                  onTap: (){
                                    context.read<NotesListBloc>().add(DeleteNoteEvent(id: state.notes![index].id));
                                  },
                                  child: Icon(Icons.delete),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 2.h,
                      color: Colors.grey.withAlpha(40),
                    );
                  },
                ),
              );
            }else if(state is NotesError){
              return Center(child: Text('No Notes to show'));
            }else{
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.textPrimary,
                ),
              );
            }
          }
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            context.router.push(NotesFormRoute(isFromEdit: false));
          },
          backgroundColor: AppColors.border,
          shape: CircleBorder(),
          child: Icon(
            Icons.add,color: AppColors.textPrimary,
            size: 40.h,
          ),
        ),
      ),
    );
  }
}