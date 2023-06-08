import 'package:depense_app/widget/listdeTransaction.dart';
import 'package:flutter/material.dart';

import '../model/transaction.dart';
import 'divers.dart';
import 'loisirs.dart';
import 'nvlTrans.dart';
import 'transport.dart';
import 'vivre.dart';



class MyHomePage extends StatefulWidget {
   MyHomePage();


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

    List<Transaction> mesTransactions = [
  ];

    List<Transaction> _utilTransaction = [
      Transaction(titre: 'hjd', montant: 12.8, date: DateTime.now(), categories: 'transport')

  ];


  void ajouterTransaction(String titre1, double montant1, String categories) {
    final addTrans = Transaction(
      titre : titre1 as String, 
      montant:montant1, 
      date: DateTime.now(), 
      categories: categories,
      );

      setState(() {
        _utilTransaction.add(addTrans);
      });
  }


 void _CliqTransaction(BuildContext ctt) {
    showModalBottomSheet(
      context: ctt, 
      builder: (_){
        return GestureDetector(
        onTap: (){},
        child: Container(
          height: 500,
          color: Colors.amberAccent,
          child: NvlTransaction(ajouterTransaction)
      ),
      );
      }
    );
   
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text(
          'Appli de dépenses',
        ),
        backgroundColor: Colors.black,
      ),

      endDrawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: Icon(Icons.person_3),
                ),
                title: Text('Mon profil', style: TextStyle(fontSize: 20),),
              ),
            ),
            Divider(),
              DrawerElement(text: 'Transport', size: 30, icon: Icon(Icons.drive_eta), page: TransportPage(),
               ),
               DrawerElement(text: 'Vivre', size: 30, icon: Icon(Icons.food_bank), page: VivrePage(),
               ),
               DrawerElement(text: 'Loisirs', size: 30, icon: Icon(Icons.play_arrow), page: LoisirsPage(),),
               DrawerElement(text: 'Divers', size: 30, icon: Icon(Icons.point_of_sale), page: DiversPage(),),
            
          ],
        )
        ),

      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 200,
            width: 500,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30), 
                bottomRight: Radius.circular(30)
                ),
              color: Colors.black,
      
            ),
            child: Center(
              child: Container(
                child: Text("Enregistrez vos dépenses en toute fluidité", 
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 20
                ),)),
            )
          ),
      
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Historique des transactions', style: TextStyle(
              fontSize: 20
            ),),
          ),
      
         ListOfTransaction(_utilTransaction)
         
        ],
      ),
       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
       floatingActionButton : FloatingActionButton(
            onPressed: () => _CliqTransaction(context),
            child: Icon(Icons.add,),
            backgroundColor: Colors.black,
      )
    );
  }
}

 class DrawerElement extends StatelessWidget {
  final String text;
  final double size;
  final Icon icon;

  final  Widget page;

  DrawerElement({
     required this.text, 
     required this.size, 
     required this.icon, 
     required this.page}
     );

  @override
  Widget build(BuildContext context) {
    return Container(
     width: 500,
     padding: EdgeInsets.all(12),
     margin: EdgeInsets.all(10),
     decoration: BoxDecoration(
      color: Colors.amber,
      borderRadius: BorderRadius.all(Radius.circular(10))
     ),
      child: ListTile(
        leading: IconButton(
          icon: icon,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> page));
          },
          ),
        title: Text(text),
        ),
    );
  }
}