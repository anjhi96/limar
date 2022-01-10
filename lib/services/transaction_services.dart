part of 'services.dart';

class TransactionServices {
  get transaction => null;

  static Future<ApiReturnValue<List<Transaction>>> getTransactions() async {
    await Future.delayed(Duration(seconds: 3));

    return ApiReturnValue(value: mockTransaction);
  }

  static Future<ApiReturnValue<Transaction>> submitTransaction(
      Transaction transaction) async {
    await Future.delayed(Duration(seconds: 2));

    return ApiReturnValue(
        value: transaction.copyWith(id: 1, status: TransactionStatus.closed));
  }
}
