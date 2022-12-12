import 'dart:io';
import 'dart:ui';

import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RecuperarSenhaPage extends StatefulWidget {
  const RecuperarSenhaPage();

  @override
  State<RecuperarSenhaPage> createState() => _RecuperarSenhaPageState();
}

class _RecuperarSenhaPageState extends State<RecuperarSenhaPage> {
  final ScrollController scrollController = ScrollController();
  ValueNotifier<double> titlePaddingHorizontal = ValueNotifier(16);
  Tween<double> titlePaddingHorizontalTween = Tween(begin: 16, end: 54);
  final bool isIos = Platform.isIOS;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SliverScrollView(
        hasPaddingLeft: true,
        leading: IconButton(
          onPressed: () {
            Modular.to.pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Perdeu sua senha?",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
        ),
        scrollController: scrollController,
        body: SizedBox(
          height: MediaQuery.of(context).size.height -
              135 -
              MediaQuery.of(context).padding.top,
          child: Column(
            children: [
              //
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: "Não se preocupe, ",
                                style: TextStyle(color: Colors.blue[400])),
                            const TextSpan(
                              text:
                                  " nos informe o seu e-mail cadastrado e aguarde o nosso contato com os próximos passos.",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Image.asset("assets/images/medico_recuperar_senha.png")
                  ],
                ),
              ),

              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 227, 242, 253),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 16.0,
                              right: 16,
                              top: 24,
                            ),
                            child: ConsultTextFormField(
                              label: "E-mail",
                              hintText: "Digite seu e-mail",
                              validator: (value) {
                                if (value != null && value.isNotEmpty) {
                                  return "Teste de tamanho";
                                }
                                return "";
                              },
                            ),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.75,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text("Enviar e-mail"),
                            ),
                          ),
                          SizedBox(
                            height: 30,
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
    );
  }
}
