// Strings can be concatenated using the $ identifier(use {} for more than one concat...)
// TextEditingController helps to store the user input in the amountInput and amountInput properties
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'models/transactions.dart';
import 'package:intl/intl.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Expenses(),
    );
  }
}

class Expenses extends StatelessWidget {
  final List<Transactions> expenditure = [
    Transactions(
        id: 'a1', title: '32 GB RAM', amount: 199.99, date: DateTime.now()),
    Transactions(
        id: 'a2', title: '8 GB RTX 3080', amount: 699.99, date: DateTime.now())
  ];
  final titleInput = TextEditingController();
  final amountInput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Expenses'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: const Card(
              elevation: 5,
              child: Text('Hey there'),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  decoration: const InputDecoration(labelText: 'Title'),
                  controller: titleInput,
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Amount'),
                  controller: amountInput,
                ),
                FlatButton(
                    onPressed: () {
                      print(titleInput.text);
                    },
                    child: Text('Submit'))
              ],
            ),
          ),
          Column(
            children: expenditure
                .map((e) => Card(
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(15),
                            child: Text(
                              '\$${e.amount}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 2)),
                            padding: const EdgeInsets.all(15),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                DateFormat.yMMMd().format(e.date),
                                style: const TextStyle(color: Colors.grey),
                              )
                            ],
                          )
                        ],
                      ),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
