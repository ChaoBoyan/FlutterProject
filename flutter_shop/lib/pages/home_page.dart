import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttershop/service/service_method.dart';
import '../config/Config.dart';
import 'package:dio/dio.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text('美好人间'),
          ),
          body: Container(

          )
      ),
    );
  }
}
