import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sge_app/src/models/production.dart';
import 'package:sge_app/src/view/var_production_page.dart';
class ProductionPage extends StatefulWidget {
  const ProductionPage({super.key});

  @override
  State<ProductionPage> createState() => _ProductionPageState();
}

class _ProductionPageState extends State<ProductionPage> {
  List originalProducts = [];

  @override
  void initState() {
    super.initState();
    originalProducts = List.from(productionL['production']);
  }

  void _searchProduct(String name) {
    setState(() {
      if (name.isEmpty) {
        productionL['production'] = List.from(originalProducts);
      } else {
        productionL['production'] = originalProducts
            .where((element) => element['nome']
                .toString()
                .toLowerCase()
                .contains(name.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .7,
                  height: MediaQuery.of(context).size.height * .05,
                  child: TextFormField(
                    onChanged: (value) {
                      _searchProduct(value);
                    },
                    //focusNode: myFocusNode,
                    //autofocus: true,
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),

                    //controller: _CampoPes,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                top: 20,
              ),
              child: ListView.builder(
                itemCount: productionL['production'].length,
                itemBuilder: (context, index) {
                  // Acessa os dados do produto
                  var produto = productionL['production'][index];
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.all(8),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.grey[800],
                              child: Text(
                                'Nº ${produto['id'].toString()}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15
                                ),
                                
                              ),
                            ),
                            title: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: produto['nome'],
                                    style: TextStyle(
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            subtitle: RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'Estoque: ',
                                    style: TextStyle(color: Colors.black45),
                                  ),
                                  TextSpan(
                                    text: produto['quantidade'].toString(),
                                    style: TextStyle(
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                  TextSpan(text: '\n'),
                                  TextSpan(text: produto['status'], style: TextStyle(color: produto['color'])),
                                ],
                              ),
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => VarProduction(
                                      nomeProduto: produto['nome'],
                                      variacoes: produto['itens'],
                                      data: produto['data'],
                                      quantidade: produto['quantidade'],
                                      id: produto['id'],
                                      status: produto['status'],
                                      color: produto['color'],
                                    ),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.chevron_right_rounded),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
