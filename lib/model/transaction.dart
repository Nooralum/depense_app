class Transaction {
  final String titre;
  final double montant;
  final DateTime date;
  final String categories;

  Transaction(
   {
    required this.titre, 
    required this.montant, 
    required this.date, 
    required this.categories,}
  );
}