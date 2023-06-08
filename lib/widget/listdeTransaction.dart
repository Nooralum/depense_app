import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/transaction.dart';

class ListOfTransaction extends StatelessWidget {
  ListOfTransaction(this.mestransactions);

    final List<Transaction> mestransactions;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (context, index){
          return Card(
            elevation: 4,
            child: ListTile(
              leading:  Text('\$${mestransactions[index].montant}'),
              title: Text(mestransactions[index].titre),
              subtitle: Text(mestransactions[index].categories),
              trailing: Text(DateFormat.yMd().format(mestransactions[index].date)  ),
            ),
          );
          
        },
        itemCount: mestransactions.length,)
        );
    
  }
}