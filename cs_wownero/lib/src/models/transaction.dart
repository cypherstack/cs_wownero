import '../../cs_wownero.dart';

/// Represents a Monero (or Wownero) transaction for a given wallet.
class Transaction {
  Transaction({
    required this.displayLabel,
    required this.description,
    required this.fee,
    required this.confirmations,
    required this.blockHeight,
    required this.accountIndex,
    required this.addressIndexes,
    required this.paymentId,
    required this.amount,
    required this.isSpend,
    required this.hash,
    required this.key,
    required this.timeStamp,
    required this.minConfirms,
  }) {
    if (fee.isNegative) throw Exception("negative fee");
    if (confirmations.isNegative) throw Exception("negative confirmations");
    if (accountIndex.isNegative) throw Exception("negative accountIndex");
    if (amount.isNegative) throw Exception("negative amount");
  }

  /// A label to display for the transaction, providing a human-readable identifier.
  final String displayLabel;

  /// A description of the transaction, providing additional context or details.
  final String description;

  /// The transaction fee in atomic units.
  final BigInt fee;

  /// The number of confirmations this transaction has received.
  final int confirmations;

  /// The block height at which this transaction was included.
  final int blockHeight;

  /// A set of indexes corresponding to addresses associated with this transaction.
  final Set<int> addressIndexes;

  /// The index of the account associated with this transaction.
  final int accountIndex;

  /// An optional payment identifier, used to associate this transaction with a payment.
  final String paymentId;

  /// The amount of funds transferred in this transaction, represented in atomic units.
  final BigInt amount;

  /// Flag indicating whether this transaction is a spend transaction.
  final bool isSpend;

  /// The timestamp of when this transaction was created or recorded.
  final DateTime timeStamp;

  /// The unique hash of this transaction (txid).
  final String hash;

  /// A key used to prove a transaction was made and relayed and to verify its details.
  final String key;

  /// The minimum number of confirmations required for this transaction.
  final MinConfirms minConfirms;

  /// Flag indicating whether the transaction is confirmed.
  bool get isConfirmed => !isPending;

  /// Flag indicating whether the transaction is pending (i.e., not yet confirmed).
  bool get isPending => confirmations < minConfirms.value;

  Map<String, dynamic> toMap() {
    return {
      'displayLabel': displayLabel,
      'description': description,
      'fee': fee.toString(), // BigInt as string
      'confirmations': confirmations,
      'blockHeight': blockHeight,
      'accountIndex': accountIndex,
      'addressIndexes': addressIndexes.toList(), // Set<int> to List<int>
      'paymentId': paymentId,
      'amount': amount.toString(), // BigInt as string
      'isSpend': isSpend,
      'hash': hash,
      'key': key,
      'timeStamp': timeStamp.toIso8601String(), // DateTime as ISO string
      'minConfirms': minConfirms.value,
    };
  }

  static Transaction fromMap(Map<String, dynamic> map) {
    return Transaction(
      displayLabel: map['displayLabel'] as String,
      description: map['description'] as String,
      fee: BigInt.parse(map['fee'] as String),
      confirmations: map['confirmations'] as int,
      blockHeight: map['blockHeight'] as int,
      accountIndex: map['accountIndex'] as int,
      addressIndexes: Set<int>.from(map['addressIndexes'] as List),
      paymentId: map['paymentId'] as String,
      amount: BigInt.parse(map['amount'] as String),
      isSpend: map['isSpend'] as bool,
      hash: map['hash'] as String,
      key: map['key'] as String,
      timeStamp: DateTime.parse(map['timeStamp'] as String),
      minConfirms: MinConfirms.values
          .firstWhere((e) => e.value == map['minConfirms'] as int),
    );
  }
}
