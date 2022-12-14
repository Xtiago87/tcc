import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:login_module/domain/entities/medico_cadastro_form_entity.dart';
import 'package:login_module/presenter/bloc/cadastro_medico/cadastro_medico_bloc.dart';
import 'package:login_module/presenter/bloc/cadastro_medico/cadastro_medico_event.dart';

class FormProfissionalDaSaude extends StatefulWidget {
  final CadastroMedicoBloc cadastroMedicoBloc;


  FormProfissionalDaSaude({Key? key, required this.cadastroMedicoBloc})
      : super(key: key);

  @override
  State<FormProfissionalDaSaude> createState() => _FormProfissionalDaSaudeState();
}

class _FormProfissionalDaSaudeState extends State<FormProfissionalDaSaude> {
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

  final ValueNotifier<bool> check = ValueNotifier(false);
  final ValueNotifier<bool> senhaVisibility = ValueNotifier(true);

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
                      return "Campo n??o pode estar vazio";
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
                      return "Campo n??o pode estar vazio";
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
                      return "Campo n??o pode estar vazio";
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
                ValueListenableBuilder(
                  valueListenable: senhaVisibility,
                  builder:(context, value, child) => TextFormField(
                    controller: textEditingControllerSenha,
                    obscureText: senhaVisibility.value,
                    style: const TextStyle(color: Colors.black),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return "Campo n??o pode estar vazio";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      suffixIcon: IconButton(onPressed: () {
                        senhaVisibility.value = !senhaVisibility.value;

                      }, icon: Icon(
                        senhaVisibility.value
                      ? Icons.visibility_off
                      : Icons.visibility,)),
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.only(left: 12),
                      hintText: "Digite sua senha",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
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
                      return "Campo n??o pode estar vazio";
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
                      return "Campo n??o pode estar vazio";
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
                  style: const TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Campo n??o pode estar vazio";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.only(left: 12),
                    hintText: "Digite sua CRM",
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
                  controller: textEditingControllerEspecialidade,
                  obscureText: false,
                  style: const TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Campo n??o pode estar vazio";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.only(left: 12),
                    hintText: "Digite sua especialidade",
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
            child: ValueListenableBuilder(
              valueListenable: check,
              builder:(context, value, child) => CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                value: check.value,
                onChanged: (value) {
                  check.value = !check.value;
                },
                title: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Para concluir seu cadasto basta ",
                        style: TextStyle(
                          color: Color.fromARGB(255, 160, 160, 160),
                        ),
                      ),
                      TextSpan(
                        text: "aceitar os termos",
                        style: TextStyle(
                          color: Color.fromARGB(255, 46, 134, 218),
                        ),
                      )
                    ],
                  ),
                ),
              ),
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
                if(check.value & _formKey.currentState!.validate()){
                  widget.cadastroMedicoBloc.add(CadastroMedicoValidationEvent(
                      medicoCadastroFormEntity: MedicoCadastroFormEntity(
                        crm: textEditingControllerCrm.text,
                        email: textEditingControllerEmail.text,
                        fullName: textEditingControllerNome.text,
                        password: textEditingControllerSenha.text,
                        photo: "",
                        speciality: textEditingControllerEspecialidade.text,
                      )));
                }
              },
              child: const Text("Solicitar cadastro"),
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
