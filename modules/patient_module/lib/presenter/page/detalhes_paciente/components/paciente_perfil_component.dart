import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PacientePerfilComponent extends StatefulWidget {
  const PacientePerfilComponent({Key? key}) : super(key: key);

  @override
  _PacientePerfilComponentState createState() =>
      _PacientePerfilComponentState();
}

class _PacientePerfilComponentState extends State<PacientePerfilComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundColor: Colors.blue,
          backgroundImage: NetworkImage(
              "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80"),
        ),
        const SizedBox(
          height: 8,
        ),
        const Text(
          "Daniel Saraiva",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Row(
            children: const [
              Icon(Icons.phone_outlined),
              SizedBox(
                width: 8,
              ),
              Text(
                "(85) 91824-8321",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Row(
            children: const [
              Icon(Icons.alternate_email_outlined),
              SizedBox(
                width: 8,
              ),
              Text(
                "daniel.saraiva@email.com",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        const Divider(
          indent: 16,
          endIndent: 16,
          thickness: 1,
        ),
      ],
    );
  }
}
