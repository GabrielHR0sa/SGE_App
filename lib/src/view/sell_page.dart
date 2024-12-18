import 'package:flutter/material.dart';
import 'package:sge_app/src/models/sells.dart';
import 'package:sge_app/src/view/var_sell_page.dart';

class SellsPage extends StatefulWidget {
  const SellsPage({super.key});

  @override
  State<SellsPage> createState() => _SellsPageState();
}

class _SellsPageState extends State<SellsPage> {
  List originalSells = [];

  @override
  void initState() {
    super.initState();
    originalSells = List.from(sellsL['sell']);
  }

  void _searchProduct(String name) {
    setState(() {
      if (name.isEmpty) {
        sellsL['sell'] = List.from(originalSells);
      } else {
        sellsL['sell'] = originalSells
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
              margin: const EdgeInsets.only(
                top: 20,
              ),
              child: ListView.builder(
                itemCount: sellsL['sell'].length,
                itemBuilder: (context, index) {
                  // Acessa os dados do produto
                  var sell = sellsL['sell'][index];
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
                                sell['id'].toString(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                            title: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: sell['nome'],
                                    style: TextStyle(
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    children: [
                                      const TextSpan(text: '\n'),
                                      TextSpan(
                                        text: 'Total Líquido',
                                        style: TextStyle(
                                          color: Colors.grey[800],
                                        ),
                                      ),
                                      const TextSpan(text: '\n'),
                                      TextSpan(
                                        text: ' R\$ ${sell['totliq'].toString()}',
                                        style: const TextStyle(
                                          color: Colors.black45,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    children: [
                                      const TextSpan(text: '\n'),
                                      TextSpan(
                                        text: 'Desconto',
                                        style: TextStyle(
                                          color: Colors.grey[800],
                                        ),
                                      ),
                                      const TextSpan(text: '\n'),
                                      TextSpan(
                                        text: ' R\$ ${sell['totdes'].toString()}',
                                        style: const TextStyle(
                                          color: Color.fromARGB(248, 175, 10, 10) ,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    children: [
                                      const TextSpan(text: '\n'),
                                      TextSpan(
                                        text: 'Total Bruto',
                                        style: TextStyle(
                                          color: Colors.grey[800],
                                        ),
                                      ),
                                      const TextSpan(text: '\n'),
                                      TextSpan(
                                        text: ' R\$ ${sell['totbru'].toString()}',
                                        style: const TextStyle(
                                          color:
                                              Color.fromARGB(248, 10, 175, 10),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => VarSell(
                                      nomeProduto: sell['nome'],
                                      variacoes: sell['itens'],
                                      data: sell['data'],
                                      quantidade: sell['quantidade'],
                                      id: sell['id'],
                                      totliq: sell['totliq'],
                                      totdes: sell['totdes'],
                                      totbru: sell['totbru'],
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
