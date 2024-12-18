// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class VarProduction extends StatefulWidget {
  final String nomeProduto;
  final String data;
  final int quantidade;
  final int id;
  final String status;
  final List<dynamic> variacoes;
  final Color color;

  const VarProduction(
      {Key? key,
      required this.nomeProduto,
      required this.variacoes,
      required this.data,
      required this.quantidade,
      required this.id,
      required this.status,
      required this.color})
      : super(key: key);

  @override
  State<VarProduction> createState() => _VarProductionState();
}

class _VarProductionState extends State<VarProduction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
        ),
        title: Center(
          child: Text(
            widget.nomeProduto,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          const SizedBox(
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Text(
                        'Nº ${widget.id}',
                        style: TextStyle(
                          color: Colors.grey[800],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    child: RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Data de inicio do lote: ${widget.data}   - ',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize : 13
                            ),
                          ),
                          const TextSpan(text: '   '),
                          TextSpan(
                            text: widget.status,
                            style: TextStyle(
                              color: widget.color,
                              fontSize: 13,
                            ),
                          ),
                          const TextSpan(text: '\n'),
                          const TextSpan(
                            text: 'Quantidade em Produção: ',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize : 13
                            ),
                          ),
                          TextSpan(
                            text: widget.quantidade.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
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
                          title: Text(variacao['nome'],
                                  style: TextStyle(
                                    color: Colors.grey[800],),),
                          subtitle: Text(variacao['variacao'].toString(),
                                  style: const TextStyle(color: Colors.black45),),
                          trailing: Text('${variacao['quantidade'].toString()} un.',
                                  style: const TextStyle(color: Colors.black45),),
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
