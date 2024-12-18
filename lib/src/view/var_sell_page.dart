import 'package:flutter/material.dart';

class VarSell extends StatefulWidget {
  final String nomeProduto;
  final String data;
  final int quantidade;
  final int id;
  final List<dynamic> variacoes;
  final String totliq;
  final String totdes;
  final String totbru;

  const VarSell(
      {Key? key,
      required this.nomeProduto,
      required this.variacoes,
      required this.data,
      required this.quantidade,
      required this.id,
      required this.totliq,
      required this.totdes,
      required this.totbru})
      : super(key: key);

  @override
  State<VarSell> createState() => _VarSellPageState();
}

class _VarSellPageState extends State<VarSell> {
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    '${widget.id}',
                    style: TextStyle(
                      color: Colors.grey[800],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: widget.nomeProduto,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      const TextSpan(text: '\n'),
                      TextSpan(
                        text: widget.data,
                        style: const TextStyle(
                            color: Colors.white54, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
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
                          subtitle: Text(
                            variacao['variacao'].toString(),
                            style: const TextStyle(color: Colors.black45),
                          ),
                          trailing: Text(
                            '${variacao['quantidade'].toString()} un.',
                            style: const TextStyle(color: Colors.black45),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const Text(
                    'Resumo do Pedido ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          textAlign: TextAlign.start,
                          text: const TextSpan(
                            children: [
                              TextSpan(text: '\n'),
                              TextSpan(
                                text: 'Itens do Pedido: ',
                                style: TextStyle(
                                    color: Colors.white54, fontSize: 14),
                              ),
                              TextSpan(text: '\n'),
                              TextSpan(text: '\n'),
                              TextSpan(
                                text: 'Total Líquido: ',
                                style: TextStyle(
                                    color: Colors.white54, fontSize: 14),
                              ),
                              TextSpan(text: '\n'),
                              TextSpan(text: '\n'),
                              TextSpan(
                                text: 'Descontos: ',
                                style: TextStyle(
                                    color: Colors.white54, fontSize: 14),
                              ),
                              TextSpan(text: '\n'),
                              TextSpan(text: '\n'),
                              TextSpan(
                                text: 'Total Bruto: ',
                                style: TextStyle(
                                    color: Colors.white54, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            children: [
                              const TextSpan(text: '\n'),
                              TextSpan(
                                text: '${widget.quantidade} un',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              const TextSpan(text: '\n'),
                              const TextSpan(text: '\n'),
                              TextSpan(
                                text: 'R\$ ${widget.totliq}',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              const TextSpan(text: '\n'),
                              const TextSpan(text: '\n'),
                              TextSpan(
                                text: 'R\$ ${widget.totdes}',
                                style: const TextStyle(
                                    color: Color.fromARGB(248, 255, 90, 90) , fontSize: 14),
                              ),
                              const TextSpan(text: '\n'),
                              const TextSpan(text: '\n'),
                              TextSpan(
                                text: 'R\$ ${widget.totbru}',
                                style: const TextStyle(
                                    color: Color.fromARGB(248, 10, 175, 10), fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
