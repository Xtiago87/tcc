import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';

class EditarFormMedico extends StatefulWidget {
  const EditarFormMedico({Key? key}) : super(key: key);

  @override
  _EditarFormMedicoState createState() => _EditarFormMedicoState();
}

class _EditarFormMedicoState extends State<EditarFormMedico> {

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
  final TextEditingController textEditingControllerCrm =
  TextEditingController();
  final TextEditingController textEditingControllerEspecialidade =
  TextEditingController();

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
                  style:
                  const TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Campo n??o pode estar vazio";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                    const EdgeInsets.only(left: 12),
                    hintText: "Digite seu nome completo",
                    border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(15)),
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
                  style:
                  const TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Campo n??o pode estar vazio";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                    const EdgeInsets.only(left: 12),
                    hintText: "Digite seu CPF",
                    border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(15)),
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
                  style:
                  const TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Campo n??o pode estar vazio";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                    const EdgeInsets.only(left: 12),
                    hintText: "Digite seu e-mail",
                    border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(15)),
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
                  style:
                  const TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Campo n??o pode estar vazio";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                    const EdgeInsets.only(left: 12),
                    hintText: "Digite sua senha",
                    border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(15)),
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
                  controller:
                  textEditingControllerConfirmarSenha,
                  obscureText: true,
                  style:
                  const TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Campo n??o pode estar vazio";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                    const EdgeInsets.only(left: 12),
                    hintText: "Confirme sua senha",
                    border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(15)),
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
                  obscureText: false,
                  style:
                  const TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Campo n??o pode estar vazio";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                    const EdgeInsets.only(left: 12),
                    hintText:
                    "Digite sua data de nascimento",
                    border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(15)),
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
                  "CRM",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: textEditingControllerCrm,
                  obscureText: false,
                  style:
                  const TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Campo n??o pode estar vazio";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                    const EdgeInsets.only(left: 12),
                    hintText: "Digite sua CRM",
                    border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(15)),
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
                  "Especialidade",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller:
                  textEditingControllerEspecialidade,
                  obscureText: false,
                  style:
                  const TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Campo n??o pode estar vazio";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                    const EdgeInsets.only(left: 12),
                    hintText: "Digite sua especialidade",
                    border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(15)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: kToolbarHeight / 2,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            height: 50,
            child: ElevatedButton(
              onPressed: () {

              },
              child: const Text("Salvar mudan??as"),
            ),
          ),
          const SizedBox(
            height: kToolbarHeight / 2,
          )
        ],
      ),
    );;
  }
}
