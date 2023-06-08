import 'package:flutter/material.dart';

class NvlTransaction extends StatefulWidget {

   final Function addTrans;
   NvlTransaction(this.addTrans);

  @override
  State<NvlTransaction> createState() => _NvlTransactionState();
}

class _NvlTransactionState extends State<NvlTransaction> {


  final controllerTitre = TextEditingController();
  final controllerMontant = TextEditingController();
  final categoriesController = TextEditingController();

  int _values = 1;


  void _soumettre(){

    final onTitre = controllerTitre.text;
    final onMontant = double.parse(controllerMontant.text);

    if (onTitre.isEmpty || onMontant <= 0) {
        return ;
      }

      widget.addTrans(
        onTitre,
        onMontant,
        categoriesController.text,
        );

        Navigator.of(context).pop();

    }
  @override
  Widget build(BuildContext context) {
    return  Column(
            children: [
               TextField(
                decoration: InputDecoration(
                  labelText: 'titre',
                ),
                controller: controllerTitre,
                onSubmitted: (value) => _soumettre,
              ),
                TextField(
                decoration: InputDecoration(
                  labelText: 'Montant',
                ),
                keyboardType: TextInputType.number,
                controller: controllerMontant,
                onSubmitted: (value) => _soumettre ,
              ),
              DropdownButtonFormField(
                onSaved: (value) => _soumettre,
                value: _values,
                items: const [
                  DropdownMenuItem(
                       child: Text('Transport'),
                       value: 1,
                    ),
                      DropdownMenuItem(
                       child: Text('Vivre'),
                       value: 2,
                    ),
                     DropdownMenuItem(
                       child: Text('Loisirs'),
                       value: 3,
                    ),
                     DropdownMenuItem(
                       child: Text('Divers'),
                       value: 4,
                    ),
                ], 
                onChanged: (newValue){
                  setState(() {
                    _values = newValue as int;
                  });
                }
                ),
              // TextField(
              //   decoration: InputDecoration(
              //     labelText: 'Choisir la catégorie',
              //   ),
              //   controller: categoriesController,
              //   onSubmitted: (value) => soumettre ,
              // ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: _soumettre, 
                child: Text('Ajouter une transaction')
              )
            ],
          );
  }
}