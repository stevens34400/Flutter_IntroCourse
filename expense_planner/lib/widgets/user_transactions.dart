import 'package:flutter/material.dart';

import './new_transaction.dart';
import './transactions_list.dart';
import '../models/transactions.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't0',
      amount: 50.20,
      date: DateTime.now(),
      title: 'Food',
    ),
    Transaction(
      id: 't1',
      amount: 20.20,
      date: DateTime.now(),
      title: 'Rent',
    ),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final Transaction newTransaction = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      NewTransaction(_addNewTransaction),
      TransactionList(_userTransactions),
    ]);
  }
}
