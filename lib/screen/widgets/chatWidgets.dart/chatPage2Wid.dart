import 'package:flutter/material.dart';

Widget chatPage2Widget(
  String? s,
  Icon? icon,
  String text,
  BuildContext context,
  Function()? dialog,
) {
  return InkWell(
    onTap: () {
      dialog!();
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 25,
          child: Center(
              child: icon ??
                  Text(
                    s!,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
        ),
        const SizedBox(
          width: 15,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    ),
  );
}
