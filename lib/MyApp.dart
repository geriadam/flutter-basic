import 'package:flutter/material.dart';
import 'package:flutter_app/TransactionList.dart';
import 'transaction.dart';
class MyApp extends StatefulWidget {
  MyApp();
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _contentController = TextEditingController();
  final _amountController = TextEditingController();

  Transaction _transaction = Transaction(content: '', amount: 0);
  List<Transaction> _transactions = List<Transaction>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }
  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }
  void insertTransaction() {
    if (_transaction.content.isEmpty || _transaction.amount == 0 || _transaction.amount.isNaN) {
      return;
    }
    _transaction.createdDate = DateTime.now();
    _transactions.add(_transaction);
    _transaction = Transaction(content: '', amount: 0);
    _contentController.text = '';
    _amountController.text = '';
  }
  void _onButtonShowModalSheet() {
    showModalBottomSheet(
        context: this.context,
        builder: (context) {
          return Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: _contentController,
                  decoration: InputDecoration(labelText: "Content"),
                  onChanged: (text) {
                    setState(() {
                      _transaction.content = text;
                    });
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: _amountController,
                  decoration: InputDecoration(labelText: 'Amount(money'),
                  onChanged: (text) {
                    setState(() {
                      _transaction.amount = int.tryParse(text);
                    });
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        child: RaisedButton(
                          color: Colors.teal,
                          child: Text('Save', style: TextStyle(fontSize: 16, color: Colors.white)),
                          onPressed: () {
                            setState(() {
                              this.insertTransaction();
                            });
                            Navigator.of(context).pop();
                          }
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Expanded(
                        child: SizedBox(
                          child: RaisedButton(
                              color: Colors.pinkAccent,
                              child: Text("Cancel", style: TextStyle(fontSize: 16, color: Colors.white)),
                              onPressed: () {
                                setState(() {
                                  print("cancel");
                                });
                              }
                          ),
                        )
                    )
                  ],
                ),
              )
            ],
          );
        });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: (){
                this.setState(() {
                  this._onButtonShowModalSheet();
                });
              })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Transaction',
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          this.setState(() {
            this._onButtonShowModalSheet();
          });
        },
      ),
      key: _scaffoldKey,
      body: SafeArea(
          minimum: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10)
                ),
                ButtonTheme(
                    height: 60,
                    child: FlatButton(
                        onPressed: () {
                          this._onButtonShowModalSheet();
                        },
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        child: Text("Insert Transaction", style: TextStyle(fontSize: 18, fontFamily: 'Oswald'))
                    )
                ),
                TransactionList(transactions: _transactions)
              ],
            ),
          )
      ),
    );
  }
}