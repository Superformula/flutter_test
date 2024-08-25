import 'dart:math';
import 'package:flutter/material.dart';

ImageProvider getRandomAvatar() {
  // Lista de avatares
  final List<String> avatars = [
    'assets/avatars/av1.png',
    'assets/avatars/av2.png',
    'assets/avatars/av3.png',
    'assets/avatars/av4.png',
    'assets/avatars/av5.png',
    'assets/avatars/av6.png',
    'assets/avatars/av7.png',
  ];

  // Seleciona um índice aleatório
  final randomIndex = Random().nextInt(avatars.length);

  // Retorna a imagem correspondente
  return AssetImage(avatars[randomIndex]);
}
