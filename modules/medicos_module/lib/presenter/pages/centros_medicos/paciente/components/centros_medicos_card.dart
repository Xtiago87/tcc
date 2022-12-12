import 'package:flutter/material.dart';
import 'package:medicos_module/domain/entities/medical_center_entity.dart';

class CentrosMedicosCard extends StatelessWidget {
  final MedicalCenterEntity medicalCenterEntity;
  const CentrosMedicosCard({super.key, required this.medicalCenterEntity});

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
              Text(
                medicalCenterEntity.name,
                style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
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
                children: [
                  const Icon(Icons.pin_drop_outlined),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    medicalCenterEntity.adress,
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
