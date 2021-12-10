import 'package:conditional_builder/conditional_builder.dart';
import 'package:firstapp/modules/archived_tasks/cubit/cubit.dart';
import 'package:firstapp/modules/archived_tasks/cubit/states.dart';
import 'package:firstapp/shared/component/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).science;
        return articleBuilder(list, context);
      },
    );
  }
}
