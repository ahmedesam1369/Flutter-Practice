import 'package:firstapp/modules/archived_tasks/cubit/cubit.dart';
import 'package:firstapp/modules/archived_tasks/cubit/states.dart';
import 'package:firstapp/shared/component/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Api of Search
// https://newsapi.org/v2/everything?q=Apple&apiKey=b03f5e83bdb64d0887bc4ff64489b0a4
class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                  onChanged: (value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                  showMessage: 'Search must not be empty',
                  controller: searchController,
                  type: TextInputType.text,
                  labelText: 'Search',
                  prefix: Icons.search,
                ),
              ),
              Expanded(
                child: articleBuilder(
                  list,
                  context,
                  isSearch: true,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
