import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  String _preco = "0";
  
  void _recuperarPreco() async {
    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(Uri.parse(url));

    Map<String, dynamic> retorno = json.decode(response.body);
    setState(() {
      _preco = retorno["BRL"]["buy"].toString();
    });
  } 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset("img/bitcoin.png"),
            Padding(
              padding: EdgeInsetsGeometry.only(top: 30, bottom: 30),
              child: Text(
              "R\$" + _preco,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22
              ),
              ),
            ),
              ElevatedButton(
              onPressed: _recuperarPreco, 
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2)
                  ),
                  elevation: 6,
                ),
                child: Text(
                  "Atualizar",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                  ),
                  )
                ),


          ],
        ),
      ),
    );
  }
}