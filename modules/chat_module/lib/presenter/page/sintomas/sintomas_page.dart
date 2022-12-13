import 'package:chat_module/domain/entities/sintoma_entity.dart';
import 'package:flutter/material.dart';

class SintomasPage extends StatefulWidget {

  final List<SintomaEntity> sintomas;

  const SintomasPage({Key? key, required this.sintomas}) : super(key: key);

  @override
  State<SintomasPage> createState() => _SintomasPageState();
}

class _SintomasPageState extends State<SintomasPage> {

  ValueNotifier<bool> searchVisibility = ValueNotifier(false);
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text(
          "Lista de sintomas",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              searchVisibility.value = !searchVisibility.value;
            },
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ValueListenableBuilder(
              valueListenable: searchVisibility,
              builder:(context, value, child) => Visibility(
                visible: searchVisibility.value,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),

                    //TODO: tentar colocar isso na appbar
                    child: TextFormField(
                      controller:
                      textEditingController,
                      obscureText: false,
                      textInputAction:
                      TextInputAction.done,
                      style: const TextStyle(
                          color: Colors.black),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                        const EdgeInsets.only(
                            left: 12),
                        hintText: "Procure por um sintoma",
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 15, 86, 179)
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color.fromARGB(255, 9, 87, 222),width: 2),
                            borderRadius:
                            BorderRadius.circular(
                                15)),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color.fromARGB(255, 9, 87, 222),),
                            borderRadius:
                            BorderRadius.circular(
                                15)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 8),
              itemCount: widget.sintomas.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                var item = widget.sintomas[index];
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8, bottom: 4, top: 4),
                  child: Card(
                    elevation: 4,
                    child: ListTile(
                      leading: Checkbox(
                        value: item.selected,
                        onChanged: (value) {
                          setState(() {
                            item.selected = !item.selected;
                          });
                        },
                      ),
                      title: Text(
                        item.name,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
