import 'package:flutter/material.dart';

Map<String, dynamic> productionL = {
  'production': [
    {
      'id': 1,
      'nome': 'Lote entrada de produtos',
      'data': '23/10/2024',
      'quantidade': 10,
      'status' : 'Em Produção',
      'color' : const Color.fromARGB(255, 136, 157, 248),
      'itens': [
        {'id': 1, 'nome': 'Macarrão', 'variacao': 'Espagetti',  'quantidade': 5},
        {'id': 2, 'nome': 'Macarrão', 'variacao': 'Penne',  'quantidade': 5},
      ]
    },
    {
      'id': 2,
      'nome': 'Reajuste do estoque',
      'data': '23/10/2024',
      'quantidade': 15,
      'status' : 'Cancelado',
      'color' : Colors.red,
      'itens': [
        {'id': 1, 'nome': 'Balde de Azeitona', 'variacao': 'Verde',  'quantidade': 5},
        {'id': 2, 'nome': 'Chocolate', 'variacao': 'Cacau 70%',  'quantidade': 5},
        {'id': 3, 'nome': 'Gelatina', 'variacao': 'Uva',  'quantidade': 5},
      ]
    },
    {
      'id': 3,
      'nome': 'Reposição de produtos',
      'data': '23/10/2024',
      'quantidade': 20,
      'status' : 'Aguardando inicio',
      'color' : const Color.fromARGB(255, 241, 230, 67),
      'itens': [
        {'id': 1, 'nome': 'Balde de Azeitona', 'variacao': 'Preta',  'quantidade': 15},
        {'id': 2, 'nome': 'Chocolate', 'variacao': 'Amargo',  'quantidade': 5},
      ]
    },
    {
      'id': 4,
      'nome': 'Reajuste produtos com baixo estoque',
      'data': '23/10/2024',
      'quantidade': 12,
      'status' : 'A revisar',
      'color' : const Color.fromARGB(255, 161, 113, 238),
      'itens': [
        {'id': 1, 'nome': 'Macarrão', 'variacao': 'Penne',  'quantidade': 2},
        {'id': 2, 'nome': 'Chocolate', 'variacao': 'Cacau 70%',  'quantidade': 5},
        {'id': 3, 'nome': 'Ketchup', 'variacao': 'Tradicional',  'quantidade': 2},
        {'id': 4, 'nome': 'Mostarda', 'variacao': 'Temperada',  'quantidade': 1},
        {'id': 5, 'nome': 'Balde de Azeitona', 'variacao': 'Preta',  'quantidade': 1},
        {'id': 6, 'nome': 'Gelatina', 'variacao': 'Morango',  'quantidade': 1},
      ]
    },
    {
      'id': 5,
      'nome': 'Entrada Estoque',
      'data': '23/10/2024',
      'quantidade': 18,
      'status' : 'Finalizado',
      'color' : const Color.fromARGB(255, 168, 224, 146),
      'itens': [
        {'id': 1, 'nome': 'Mostarda', 'variacao': 'Temperada',  'quantidade': 8},
        {'id': 2, 'nome': 'Balde de Azeitona', 'variacao': 'Preta',  'quantidade': 5},
        {'id': 3, 'nome': 'Gelatina', 'variacao': 'Morango',  'quantidade': 5},
      ]
    },
    {
      'id': 6,
      'nome': 'Etoque - Reajuste',
      'data': '23/10/2024',
      'quantidade': 8,
      'status' : 'Aguardando inicio',
      'color' : const Color.fromARGB(255, 241, 230, 67),
      'itens': [
        {'id': 1, 'nome': 'Chocolate', 'variacao': 'Cacau 70%',  'quantidade': 2},
        {'id': 2, 'nome': 'Ketchup', 'variacao': 'Tradicional',  'quantidade': 3},
        {'id': 3, 'nome': 'Mostarda', 'variacao': 'Temperada',  'quantidade': 3},
      ]
    },
    {
      'id': 7,
      'nome': 'Reposição produtos',
      'data': '23/10/2024',
      'quantidade': 14,
      'status' : 'Finalizado',
      'color' : const Color.fromARGB(255, 168, 224, 146),
      'itens': [
        {'id': 1, 'nome': 'Chocolate', 'variacao': 'Cacau 70%',  'quantidade': 4},
        {'id': 2, 'nome': 'Ketchup', 'variacao': 'Tradicional',  'quantidade': 6},
        {'id': 3, 'nome': 'Mostarda', 'variacao': 'Temperada',  'quantidade': 4},
      ]
    },
  ]
};
