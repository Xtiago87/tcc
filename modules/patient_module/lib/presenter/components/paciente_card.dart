import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PatientCard extends StatelessWidget {
  const PatientCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Modular.to.pushNamed("./detalhes_paciente");
        },
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            "https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Daniel Saraiva",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      )
                    ]),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
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
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
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
                  ],
                ),
                const Icon(Icons.arrow_forward_ios_rounded, size: 48, color: Color.fromARGB(255, 160, 160, 160),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
