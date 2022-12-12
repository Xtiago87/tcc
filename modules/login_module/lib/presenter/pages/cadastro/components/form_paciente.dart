import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:login_module/domain/entities/paciente_cadastro_form_entity.dart';
import 'package:login_module/presenter/bloc/cadastro_paciente/cadastro_paciente_bloc.dart';
import 'package:login_module/presenter/bloc/cadastro_paciente/cadastro_paciente_event.dart';
import 'package:intl/intl.dart';

class FormPaciente extends StatefulWidget {
  FormPaciente({Key? key, required this.cadastroPacienteBloc})
      : super(key: key);
  final CadastroPacienteBloc cadastroPacienteBloc;

  @override
  State<FormPaciente> createState() => _FormPacienteState();
}

class _FormPacienteState extends State<FormPaciente> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController textEditingControllerNome =
      TextEditingController();

  final TextEditingController textEditingControllerCPF =
      TextEditingController();

  final TextEditingController textEditingControllerEmail =
      TextEditingController();

  final TextEditingController textEditingControllerSenha =
      TextEditingController();

  final TextEditingController textEditingControllerConfirmarSenha =
      TextEditingController();

  final TextEditingController textEditingControllerDataNasc =
      TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16,
              top: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Nome completo",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: textEditingControllerNome,
                  obscureText: false,
                  style: const TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Campo não pode estar vazio";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.only(left: 12),
                    hintText: "Digite seu nome completo",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16,
              top: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "CPF",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: textEditingControllerCPF,
                  obscureText: false,
                  style: const TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Campo não pode estar vazio";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.only(left: 12),
                    hintText: "Digite seu CPF",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16,
              top: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "E-mail",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: textEditingControllerEmail,
                  obscureText: false,
                  style: const TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Campo não pode estar vazio";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.only(left: 12),
                    hintText: "Digite seu e-mail",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16,
              top: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Senha",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: textEditingControllerSenha,
                  obscureText: true,
                  style: const TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Campo não pode estar vazio";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.only(left: 12),
                    hintText: "Digite sua senha",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16,
              top: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Confirmar senha",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: textEditingControllerConfirmarSenha,
                  obscureText: true,
                  style: const TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Campo não pode estar vazio";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.only(left: 12),
                    hintText: "Confirme sua senha",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16,
              top: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Data de nascimento",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: textEditingControllerDataNasc,
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context, initialDate: DateTime.now(),
                        firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101)
                    );
                    if(pickedDate != null ){
                      print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(formattedDate); //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                        textEditingControllerDataNasc.text = formattedDate; //set output date to TextField value.
                      });
                    }
                  },
                  obscureText: false,
                  style: const TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Campo não pode estar vazio";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.only(left: 12),
                    hintText: "Digite sua data de nascimento",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              value: true,
              onChanged: (value) {},
              title: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "Acesse ou crie sua conta para ter ",
                      style: TextStyle(
                        color: Color.fromARGB(255, 160, 160, 160),
                      ),
                    ),
                    TextSpan(
                      text: "o melhor controle das suas consultas",
                      style: TextStyle(
                        color: Color.fromARGB(255, 46, 134, 218),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: kToolbarHeight / 2,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  widget.cadastroPacienteBloc.add(
                    CadastroPacienteValidationEvent(
                      pacienteCadastroFormEntity: PacienteCadastroFormEntity(
                        dataBirth: textEditingControllerDataNasc.text,
                        email: textEditingControllerEmail.text,
                        fullName: textEditingControllerNome.text,
                        password: textEditingControllerSenha.text,
                        photo: "",
                      ),
                    ),
                  );
                }
              },
              child: const Text("Cadastrar"),
            ),
          ),
          const SizedBox(
            height: kToolbarHeight / 2,
          )
        ],
      ),
    );
  }
}
