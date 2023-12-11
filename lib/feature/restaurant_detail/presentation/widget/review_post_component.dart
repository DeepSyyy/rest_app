import 'package:flutter/material.dart';

class PostreviewComponent extends StatelessWidget {
  const PostreviewComponent(
      {super.key, required this.controller, required this.handler});

  final TextEditingController controller;
  final Function handler;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: const DecorationImage(
                image: AssetImage("assets/images/person.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black26,
                ),
              ),
              width: MediaQuery.of(context).size.width * 0.6,
              padding: const EdgeInsets.all(8),
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  hintText: "Tambahkan Review",
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                handler(controller.text);
              },
              icon: Icon(Icons.send)),
        ],
      ),
    );
  }
}
