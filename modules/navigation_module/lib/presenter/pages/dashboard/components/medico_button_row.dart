import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MedicoButtonRow extends StatefulWidget {
  const MedicoButtonRow({Key? key}) : super(key: key);

  @override
  _MedicoButtonRowState createState() => _MedicoButtonRowState();
}

class _MedicoButtonRowState extends State<MedicoButtonRow> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            width: 16,
          ),
          GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Center(child: Text("Compartilhe essa token com seu paciente para adiciona-lo", style: TextStyle(color: Colors.blue),)),
                      content: const Text("A1BfLj8tx9BTi6TNl3AzUp4Uj5ARIhDJOl1v4li6377c75cb2ffd"),
                      actionsAlignment: MainAxisAlignment.center,
                      actions: [
                        ElevatedButton(
                          onPressed: () {

                          },
                          child: const Text("Copiar"),
                        )
                      ],

                    );
                  },
                );
              },
              child: Image.asset("assets/images/add_patient_button.png")),
          const SizedBox(
            width: 24,
          ),
          GestureDetector(
              onTap: () {
                Modular.to.pushNamed("./meus_centros_medicos");
              },
              child: Image.asset("assets/images/medic_medical_center_button.png")),
          const SizedBox(
            width: 24,
          ),
          GestureDetector(
              onTap: () => Modular.to.pushNamed("./editar_perfil"),
              child: Image.asset("assets/images/editar_perfil_button.png")),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }
}
