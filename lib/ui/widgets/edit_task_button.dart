import 'package:flutter/material.dart';

class EditTaskButton extends StatelessWidget {
  final String text;

  const EditTaskButton(
      {Key? key, this.text = 'TASK: Write an Article'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.edit),
      label: Text(text),
      clipBehavior: Clip.antiAlias,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(192, 44),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        elevation: 0,
        primary: Colors.white,
        onPrimary: Theme.of(context).primaryColor,
        side: BorderSide(width: 2, color: Theme.of(context).primaryColor),
        textStyle: Theme.of(context)
            .textTheme
            .button!
            .copyWith(color: Theme.of(context).primaryColor),
      ),
    );
  }
}
