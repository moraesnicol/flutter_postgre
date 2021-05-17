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

//  await conn.query('''
//  CREATE TABLE customers(
//    id serial primary key not null,
//    name text,
//    email text,
//    address text,
//    country text
//)
  // ''');

//TODO Create data
//  await conn.query('''
//  INSERT INTO customers  (name, email, address, country)
//  VALUES ('Gabriel Nicol', 'moraesnicol@gmail.com', 'rua narnia 123', 'Vacinolândia')
//  ''');

//TODO Read data

  var results = await conn.query('SELECT * from customers');
  //print(results);

  //for (var row in results) {
  //   print('''
  //   ===
  //   id: ${row[0]}
  //   name: ${row[1]}
  //   email: ${row[2]}
  //   address: ${row[3]}
  //   country: ${row[4]}
  //   ===
  //   ''');
  // }

  //TODO  Update data
  // await conn.query("UPDATE customers SET country='Ghana' WHERE id=1");
  //TODO  Delete data

  await conn.query('DELETE FROM customers WHERE id > 0');

  await conn.close();
}
