import 'package:flutter/material.dart';
import 'package:medicos_module/domain/entities/medic_entity.dart';

class MedicoCard extends StatelessWidget {
  MedicoCard({super.key, required this.medicEntity});

  final MedicEntity medicEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
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
          child: Column(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      medicEntity.name,
                      style:const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                    ),
                    Text(
                      medicEntity.speciality,
                      style:const TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                )
              ]),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const Icon(Icons.alternate_email_outlined),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    medicEntity.email,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
