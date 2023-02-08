import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List transaction;
  final Function deleteTx;

  TransactionList(this.transaction, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: transaction.isEmpty
          ? Column(
              children: [
                Text(
                  'No transaction added yet!',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 300,
                  child: Image.asset(
                    'assets/images/img3.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                            child: Text('\$${transaction[index].amount}')),
                      ),
                    ),
                    title: Text(
                      transaction[index].title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transaction[index].date!),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Theme.of(context).errorColor,
                      ),
                      // color: Theme.of(context).errorColor,
                      onPressed: () => deleteTx(transaction[index].id),
                    ),
                  ),
                );
                // return Card(
                //   child: Row(
                //     children: [
                //       Container(
                //         margin: const EdgeInsets.symmetric(
                //             vertical: 10, horizontal: 15),
                //         decoration: BoxDecoration(
                //           border: Border.all(
                //             color: Theme.of(context).primaryColor,
                //             width: 2,
                //           ),
                //         ),
                //         padding: const EdgeInsets.all(10),
                //         child: Text(
                //           '\$${transaction[index].amount.toStringAsFixed(2)}',
                //           style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //             fontSize: 20,
                //             color: Theme.of(context).primaryColor,
                //           ),
                //         ),
                //       ),
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(transaction[index].title.toString(),
                //               // style: const TextStyle(
                //               //   fontSize: 16,
                //               //   fontWeight: FontWeight.bold,
                //               // ),
                //               style: Theme.of(context).textTheme.titleMedium),
                //           Text(
                //             // DateFormat('yyyy/MM/dd').format(transaction[index].date!),
                //             DateFormat.yMMMd().format(transaction[index].date!),
                //             style: const TextStyle(color: Colors.grey),
                //           ),
                //         ],
                //       )
                //     ],
                //   ),
                // );
              },
              itemCount: transaction.length,
            ),
    );
  }
}
