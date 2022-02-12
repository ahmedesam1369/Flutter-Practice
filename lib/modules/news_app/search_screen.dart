import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fristapp/layout/news_app/cubit/cubit.dart';
import 'package:fristapp/layout/news_app/cubit/states.dart';
import 'package:fristapp/shared/component/component.dart';
import 'package:fristapp/shared/styles/icon_broken.dart';

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
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(IconBroken.Arrow___Left_2),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defultFormField(
                  controller: searchController,
                  type: TextInputType.text,
                  lable: 'Search',
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Search must not be empty';
                    }
                    return null;
                  },
                  onChange: (value) {
                    NewsCubit.get(context).getSearch(value);
                  },
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
