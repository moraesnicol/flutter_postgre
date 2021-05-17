import 'package:postgres/postgres.dart';

void main(List<String> arguments) {
  final conn = PostgreSQLConnection(
    'localhost',
    5435,
    'dart_test',
    username: 'postgres',
    password: 'password',
  );
}
