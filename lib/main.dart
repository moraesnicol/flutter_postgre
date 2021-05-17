import 'package:postgres/postgres.dart';

void main(List<String> arguments) async {
  final conn = PostgreSQLConnection(
    'localhost',
    5435,
    'dart_test',
    username: 'postgres',
    password: 'password',
  );
  await conn.open();

  print('Connected to Postgres database...');

  await conn.query('''
  CREATE TABLE customers(
    id serial primary key not null
    name text,
    email text,
    address text,
    country text,
  )
  ''');

  await conn.close();
}
