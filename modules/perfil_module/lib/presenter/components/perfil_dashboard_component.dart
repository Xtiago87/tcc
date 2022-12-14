import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:core_module/domain/entities/perfil_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';

import '../bloc/perfil/perfil_bloc.dart';

class PerfilDashboardComponent extends StatefulWidget {
  final PerfilEntity perfilEntity;

  const PerfilDashboardComponent({super.key, required this.perfilEntity});

  @override
  State<PerfilDashboardComponent> createState() => _PerfilDashboardComponentState();
}

class _PerfilDashboardComponentState extends State<PerfilDashboardComponent> {
  final PerfilBloc perfilBloc = Modular.get<PerfilBloc>();

  final ImagePicker _picker = ImagePicker();

  Uint8List? photo;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      //future: AuthServiceImpl().readUserType(),
      future: Future.delayed(Duration(milliseconds: 150), () => "0"),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              SizedBox(
                height: kToolbarHeight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          Modular.to.navigate("./");
                        },
                        icon: const Icon(Icons.logout),
                      ),
                    ],
                  ),
                ),
              ),
              Builder(builder: (context) {
                //TODO
                if (widget.perfilEntity.photo.isEmpty && photo != null) {
                  return GestureDetector(
                    onTap: () async {
                      try {
                        await _picker
                            .pickImage(
                          source: ImageSource.gallery,
                          maxWidth: MediaQuery.of(context).size.width,
                          maxHeight: MediaQuery.of(context).size.height,
                          imageQuality: null,
                          preferredCameraDevice: CameraDevice.front,
                        ).then((value) async {
                          if(await File(value!.path).exists()){
                            setState(() async {
                              photo = await value.readAsBytes();
                            });
                            Navigator.pop(context);
                          }
                        });
                      } catch (e) {
                        ScaffoldMessenger.of(context)
                          ..clearSnackBars()
                          ..showSnackBar(
                              const SnackBar(content: Text("Algo deu errado durante a foto"),
                                backgroundColor: Colors.red,
                              )
                          );
                        rethrow;
                      }
                    },
                    child: const CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.grey,
                      child: Center(
                        child: Text("Clique aqui para adicionar uma foto"),
                      ),
                    ),
                  );
                } else {
                  return CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.blue,
                    backgroundImage: MemoryImage(photo == null ? base64Decode(widget.perfilEntity.photo) : photo!),
                  );
                }
              }),
              const SizedBox(
                height: 8,
              ),
              Text(
                widget.perfilEntity.fullName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  children: [
                    const Icon(Icons.alternate_email_outlined),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      widget.perfilEntity.email,
                      style: const TextStyle(
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
        return const SizedBox.shrink();
      },
    );
  }
}
