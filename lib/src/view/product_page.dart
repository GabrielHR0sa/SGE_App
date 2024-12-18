import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sge_app/src/models/products.dart';
import 'package:sge_app/src/view/var_product_page.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
List originalProducts = []; 

@override
void initState() {
  super.initState();
  originalProducts = List.from(productsL['products']); 
}

void _searchProduct(String name) {
  setState(() {
    if (name.isEmpty) {
      productsL['products'] = List.from(originalProducts);
    } else {
      productsL['products'] = originalProducts
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
              margin: EdgeInsets.only(top: 20,),
              child: ListView.builder(
                itemCount: productsL['products'].length,
                itemBuilder: (context, index) {
                  // Acessa os dados do produto
                  var produto = productsL['products'][index];
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
                                produto['id'].toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            title: Text(
                              produto['nome'],
                              style: TextStyle(
                                color: Colors.grey[800],
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
                                ],
                              ),
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => VarProduct(
                                      nomeProduto: produto['nome'],
                                      variacoes: produto['variacoes'],
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
