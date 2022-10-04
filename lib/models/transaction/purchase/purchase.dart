import 'package:equatable/equatable.dart';

class Purchase extends Equatable {
  /// Id of an Purchase.
  final int purchaseId;

  /// Name of an Purchase.
  final String purchaseName;

  /// Designation of an Purchase.
  final String purchaseCost;

  /// Salary of an Purchase.
  final DateTime purchaseDate;

  const Purchase(
      this.purchaseId, this.purchaseName, this.purchaseCost, this.purchaseDate);

  @override
  List<Object?> get props => [purchaseId];
}
