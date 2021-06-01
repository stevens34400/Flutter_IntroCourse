import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transactions.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No Transactions added yet!',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 100,
                ),
                Container(
                  height: 300,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 20,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.green,
                            width: 2,
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '\$${transactions[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            transactions[index].title,
                            style: Theme.of(context).textTheme.title,
                          ),
                          Text(
                            DateFormat.yMMMMEEEEd()
                                .format(transactions[index].date),
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
