import 'dart:ui';
import 'package:firstapp/shared/component/components.dart';
import 'package:firstapp/shared/component/constants.dart';
import 'package:firstapp/shared/cubit/cubit.dart';
import 'package:firstapp/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, State) {},
        builder: (context, State) {
          var tasks = AppCubit.get(context).tasks;
          return ListView.separated(
            itemBuilder: (context, index) {
              return buildTaskItem(
                tasks[index],
                context,
              );
            },
            separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 20.0,
              ),
              child: Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[300],
              ),
            ),
            itemCount: tasks.length,
            
          );
        });
  }
}


