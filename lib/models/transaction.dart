part of 'models.dart';

enum TransactionStatus { open, closed }

class Transaction extends Equatable {
  final int id;
  final Data data;
  final DateTime dateTime;
  final TransactionStatus status;
  final User user;
  final int total;

  Transaction copyWith(
      {int id,
      Data data,
      DateTime dateTime,
      TransactionStatus status,
      User user,
      Data total}) {
    return Transaction(
        id: id ?? this.id,
        data: data ?? this.data,
        dateTime: dateTime ?? this.dateTime,
        status: status ?? this.status,
        user: user ?? this.user,
        total: total ?? this.total);
  }

  Transaction(
      {this.id, this.data, this.dateTime, this.status, this.user, this.total});

  @override
  List<Object> get props => [id, data, dateTime, status, user, total];
}

List<Transaction> mockTransaction = [
  Transaction(
      id: 1,
      data: mockData[0],
      dateTime: DateTime.now(),
      status: TransactionStatus.closed,
      user: mockuser),
  // total: mockData[0]),
  Transaction(
      id: 2,
      data: mockData[1],
      dateTime: DateTime.now(),
      status: TransactionStatus.open,
      user: mockuser),
  // total: mockData[1].r1 + mockData[1].r2 + mockData[1].r3 + mockData[1].r4 + mockData[1].r5),
  Transaction(
      id: 3,
      data: mockData[2],
      dateTime: DateTime.now(),
      status: TransactionStatus.closed,
      user: mockuser),
  // total: mockData[2].r1 + mockData[2].r2 + mockData[2].r3 + mockData[2].r4 + mockData[2].r5),
  Transaction(
      id: 4,
      data: mockData[3],
      dateTime: DateTime.now(),
      status: TransactionStatus.closed,
      user: mockuser),
  // total: mockData[3].r1 + mockData[3].r2 + mockData[3].r3 + mockData[3].r4 + mockData[3].r5),
  Transaction(
      id: 5,
      data: mockData[4],
      dateTime: DateTime.now(),
      status: TransactionStatus.open,
      user: mockuser),
  // total: mockData[4].r1 + mockData[4].r2 + mockData[4].r3 + mockData[4].r4 + mockData[4].r5),
  Transaction(
      id: 6,
      data: mockData[4],
      dateTime: DateTime.now(),
      status: TransactionStatus.open,
      user: mockuser),
  Transaction(
      id: 7,
      data: mockData[4],
      dateTime: DateTime.now(),
      status: TransactionStatus.open,
      user: mockuser),
  Transaction(
      id: 8,
      data: mockData[4],
      dateTime: DateTime.now(),
      status: TransactionStatus.open,
      user: mockuser),
  Transaction(
      id: 9,
      data: mockData[4],
      dateTime: DateTime.now(),
      status: TransactionStatus.open,
      user: mockuser),
  Transaction(
      id: 10,
      data: mockData[4],
      dateTime: DateTime.now(),
      status: TransactionStatus.open,
      user: mockuser),
  Transaction(
      id: 11,
      data: mockData[4],
      dateTime: DateTime.now(),
      status: TransactionStatus.open,
      user: mockuser),
  Transaction(
      id: 12,
      data: mockData[4],
      dateTime: DateTime.now(),
      status: TransactionStatus.open,
      user: mockuser),
  Transaction(
      id: 13,
      data: mockData[4],
      dateTime: DateTime.now(),
      status: TransactionStatus.open,
      user: mockuser),
];
