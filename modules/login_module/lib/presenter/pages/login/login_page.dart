// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_module/domain/entities/login_form_entity.dart';
import 'package:login_module/domain/services/check_doencas_alergias_service.dart';

import '../../bloc/login/login_bloc.dart';
import '../../bloc/login/login_event.dart';
import '../../bloc/login/login_state.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> isScrollable = ValueNotifier(false);
  final LoginBloc loginBloc = Modular.get<LoginBloc>();
  final TextEditingController textEditingControllerEmail =
      TextEditingController();
  final TextEditingController textEditingControllerSenha =
      TextEditingController();

  final ValueNotifier<bool> senhaVisibility = ValueNotifier(true);

  @override
  void dispose() {
    Modular.dispose<LoginBloc>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider<LoginBloc>(
        create: (context) => loginBloc,
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) async {
            if (state is LoginLoadingState) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return Dialog(
                      child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: const [
                        CircularProgressIndicator(),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(left: 32.0),
                            child: Text(
                              "Entrando no aplicativo...",
                              overflow: TextOverflow.ellipsis,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ));
                },
              );
            }

            if (state is LoginSuccessState) {
              textEditingControllerSenha.clear();
              textEditingControllerEmail.clear();
              if (state.r.fullName != "Joao Carlos" && await CheckDoencasAlergiasService.checkDoencasEAlergias(state.r.id)) {
                Modular.to.pop();
                Modular.to.pushNamed("/chat", arguments: {
                  "id": state.r.id,
                  "ft": true,
                });
              } else {
                Modular.to.pop();
                Modular.to.navigate("/dashboard");
              }
            }

            if (state is LoginFailureState) {
              Modular.to.pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) => ValueListenableBuilder(
            valueListenable: isScrollable,
            builder: (context, value, child) => SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: SafeArea(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Container(
                            height: (MediaQuery.of(context).size.height -
                                    MediaQuery.of(context).padding.top) /
                                2,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 24,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 16.0, left: 16),
                                  child: Row(
                                    children: [
                                      Image.asset("assets/images/logo.png"),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Text(
                                        "Consult",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 32,
                                            color: Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16.0, right: 16),
                                  child: RichText(
                                    text: TextSpan(
                                      children: const [
                                        TextSpan(
                                          text:
                                              "Acesse ou crie sua conta para ter ",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 160, 160, 160),
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              "o melhor controle das suas consultas",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 46, 134, 218),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Image.asset("assets/images/medico_login.png"),
                              ],
                            )),
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 227, 242, 253),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                          ),
                          child: Form(
                            key: _formKey,
                            child: SingleChildScrollView(
                              child: SizedBox(
                                height: (MediaQuery.of(context).size.height -
                                        MediaQuery.of(context).padding.top) /
                                    2,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 16.0,
                                        right: 16,
                                        top: 24,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "E-mail",
                                            style: const TextStyle(
                                                color: Colors.blue,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          TextFormField(
                                            controller:
                                                textEditingControllerEmail,
                                            obscureText: false,
                                            textInputAction:
                                                TextInputAction.next,
                                            style: const TextStyle(
                                                color: Colors.black),
                                            validator: (value) {
                                              if (value != null &&
                                                  value.isEmpty) {
                                                return "Campo não pode estar vazio";
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                      left: 12),
                                              hintText: "Digite seu e-mail",
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 16.0,
                                        right: 16,
                                        top: 16,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Senha",
                                            style: const TextStyle(
                                                color: Colors.blue,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          ValueListenableBuilder(
                                            valueListenable: senhaVisibility,
                                            builder: (context, value, child) =>
                                                TextFormField(
                                              controller:
                                                  textEditingControllerSenha,
                                              obscureText:
                                                  senhaVisibility.value,
                                              style: const TextStyle(
                                                  color: Colors.black),
                                              validator: (value) {
                                                if (value != null &&
                                                    value.isEmpty) {
                                                  return "Campo não pode estar vazio";
                                                }
                                                return null;
                                              },
                                              decoration: InputDecoration(
                                                suffixIcon: IconButton(
                                                    onPressed: () {
                                                      senhaVisibility.value =
                                                          !senhaVisibility
                                                              .value;
                                                    },
                                                    icon: Icon(
                                                      senhaVisibility.value
                                                          ? Icons.visibility_off
                                                          : Icons.visibility,
                                                    )),
                                                filled: true,
                                                fillColor: Colors.white,
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        left: 12),
                                                hintText: "Digite sua senha",
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 16.0),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: TextButton(
                                          onPressed: () {
                                            Modular.to
                                                .pushNamed("/recuperar_senha");
                                          },
                                          child: Text("Recupere sua senha",
                                              style: TextStyle(
                                                  decoration: TextDecoration
                                                      .underline)),
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          1.75,
                                      height: 50,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            loginBloc.add(
                                              LoginValidationEvent(
                                                loginFormEntity:
                                                    LoginFormEntity(
                                                  email:
                                                      textEditingControllerEmail
                                                          .text,
                                                  senha:
                                                      textEditingControllerSenha
                                                          .text,
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                        child: Text("Acessar"),
                                      ),
                                    ),
                                    Spacer(),
                                    TextButton(
                                      onPressed: () {
                                        Modular.to.pushNamed("/cadastro");
                                      },
                                      child: Text(
                                        "Cadastre sua conta",
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
