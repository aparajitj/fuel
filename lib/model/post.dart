import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Movies {
  final title;
  final  overview;
  final  vote_average;
  final  poster_path;


  Movies({this.title,this.overview,this.vote_average,this.poster_path});

  factory Movies.fromJson(Map<String, dynamic> json) {
    return Movies(

        title: json['title'],
        overview : json['overview'],
        vote_average : json['vote_average'],
        poster_path: json['poster_path'],

    );
  }
}

Future<Movies> fetchPost( ) async {
  final response =  await http.get('http://api.themoviedb.org/3/movie/popular?api_key=802b2c4b88ea1183e50e6b285a27696e');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.

    return Movies.fromJson(json.decode(response.body)['results']);
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}