import 'package:flutter/material.dart';
import 'transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> transactions;
  TransactionList({this.transactions});
  ListView _buildListView() {
    return ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            color: (index-1) % 2 == 0 ? Colors.green : Colors.teal,
            elevation: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(padding: EdgeInsets.all(10)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Text(
                        '${transactions[index].content}',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                        )
                    ),
                    Text(
                        '${DateFormat.yMd().format(transactions[index].createdDate)}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16
                        )
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 10)),
                  ],
                ),
                Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          child: Text('${transactions[index].amount}', style: TextStyle(fontSize: 18, color: Colors.white)),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          padding: const EdgeInsets.all(5.0),
                        ),
                        Padding(padding: EdgeInsets.only(right: 10))
                      ],
                    )
                )
              ],
            )
            /*ListTile(
                leading: const Icon(Icons.access_alarm),
                title: Text(
                    '${transactions[index].content}',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    )
                ),
                subtitle: Text(
                  '${transactions[index].amount}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16
                  ),
                ),
              )*/,
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 500,
      child: _buildListView(),
    );
  }
}