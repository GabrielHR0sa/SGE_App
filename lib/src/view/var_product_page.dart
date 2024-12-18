import 'package:flutter/material.dart';

class VarProduct extends StatefulWidget {
  final String nomeProduto;
  final List<dynamic> variacoes;

  const VarProduct(
      {Key? key, required this.nomeProduto, required this.variacoes})
      : super(key: key);

  @override
  State<VarProduct> createState() => _VarProductState();
}

class _VarProductState extends State<VarProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
        ),
        title: Center(
          child: Text(
            widget.nomeProduto,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18
            ),
          ),
        ),
        actions: [
          Container(
            width: 50,
            height: 50,
          ),
        ],
      ),
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
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.variacoes.length,
              itemBuilder: (context, index) {
                var variacao = widget.variacoes[index];
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
                              variacao['id'].toString(),
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          title: Text(
                            variacao['nome'],
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
                                  text: variacao['quantidade'].toString(),
                                  style: TextStyle(
                                    color: Colors.grey[800],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
