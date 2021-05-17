import 'dart:io';
import 'dart:convert';

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

  //await conn.query('DELETE FROM customers WHERE id > 0');

//See db

 /*  await conn.query('''
    CREATE TABLE orders(
      id serial primary key not null,
      order_id int not null,
      customer_id int not null,
      oder_date date
    )
  '''); */

 /*  await conn.transaction((ctx) async {
    final mockStr = await File('./mock_customers.json').readAsString();
    final mockData = json.decode(mockStr);
    final mockDataStream = Stream.fromIterable(mockData);

    await for (var row in mockDataStream) {
      await ctx.query(''' 
    INSERT INTO orders (order_id,customer_id,over_date)
    VALUES (@orderId,@customerId,@orderDate)
    ''', substitutionValues: {
        'orderId': row['order_id'],
        'customerId': row['customer_id'],
        'orderDate': row['over_date'],
      
      });
    }
  }); */

 /*  var resultMap = await conn.mappedResultsQuery('''
    SELECT * FROM customers
  ''');
  print(resultMap); */
  await conn.close();
}
