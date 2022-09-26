import 'package:flutter/material.dart';

import '../models/Transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  late final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(children: <Widget>[
              Text('No Transaction added yet!',
                  style: Theme.of(context).textTheme.titleMedium),
              SizedBox(
                height: 25,
              ),
              Container(
                height: constraints.maxHeight * 0.6,
                child:
                    Image.asset('assets/images/waiting.png', fit: BoxFit.cover),
              ),
            ]);
          })
        : ListView(
            children: transactions
                .map((tx) => TransactionItem(
                      key: ValueKey(tx.id),
                      transaction: tx,
                      deleteTx: deleteTx,
                    ))
                .toList(),
          );
    // : ListView.builder(
    //     itemBuilder: (BuildContext context, int index) {
    //       return TransactionItem(
    //         transaction: transactions[index],
    //         deleteTx: deleteTx,
    //       );
    //     },
    //     itemCount: transactions.length,
    //   );
  }
}
