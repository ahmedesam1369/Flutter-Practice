import 'package:conditional_builder/conditional_builder.dart';
import 'package:firstapp/modules/web_view/web_view_screen.dart';
import 'package:firstapp/shared/cubit/cubit.dart';
import 'package:flutter/material.dart';

Widget defaultButton({
  bool isUpperCse = true,
  double radius = 10.0,
  double width = double.infinity,
  Color background = Colors.blue,
  required VoidCallback function,
  required String text,
}) =>
    Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(
          radius,
        ),
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCse ? text.toUpperCase() : text,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function(String)? onSubmit,
  Function(String)? onChanged,
  VoidCallback? onTap,
  // required Function(String) validat,
  // *****************
  String? showMessage,
  // ******************
  required String labelText,
  required IconData prefix,
  IconData? suffix,
  bool ispassword = false,
  VoidCallback? onPressed,
}) =>
    TextFormField(
        controller: controller,
        keyboardType: type,
        obscureText: ispassword,
        onFieldSubmitted: onSubmit,
        onChanged: onChanged,
        onTap: onTap,
        // validator: validat,
        // **********************
        validator: (value) {
          if (value!.isEmpty) {
            return showMessage;
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(
            prefix,
          ),
          suffixIcon: suffix != null
              ? IconButton(
                  icon: Icon(suffix),
                  onPressed: onPressed,
                )
              : null,
          border: OutlineInputBorder(),
        ));

Widget buildTaskItem(
  Map model,
  context,
) =>
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40.0,
            child: Text(
              '${model['time']}',
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${model['title']}',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${model['date']}',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          IconButton(
            icon: Icon(
              Icons.check_box,
              color: Colors.green,
            ),
            onPressed: () {
              AppCubit.get(context).updateData(
                status: 'done',
                id: model['id'],
              );
            },
          ),
          IconButton(
              icon: Icon(
                Icons.archive,
                color: Colors.black45,
              ),
              onPressed: () {
                AppCubit.get(context).updateData(
                  status: 'archive',
                  id: model['id'],
                );
              }),
        ],
      ),
    );

Widget BuildArticleItem(article, context) => InkWell(
      onTap: () {
        navigateTo(context, WebViewScreen(article['url']));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120.0,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage('${article['urlToImage']}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Container(
                height: 120.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

Widget articleBuilder(list, context, {isSearch = false}) {
  return ConditionalBuilder(
    condition: list.length > 0,
    builder: (context) => ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => BuildArticleItem(list[index], context),
        separatorBuilder: (context, state) => myDivider(),
        itemCount: 15),
    fallback: (context) =>
        isSearch ? Container() : Center(child: CircularProgressIndicator()),
  );
}

void navigateTo(context, Widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Widget,
      ),
    );
