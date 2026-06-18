import 'package:flutter/material.dart';

class CareerStep {
  final String num;
  final String title;
  final String desc;
  final bool isSpecial;

  CareerStep({required this.num, required this.title, required this.desc, this.isSpecial = false});
}

class CareerModel {
  final String title;
  final IconData icon;
  final String description;
  final String salary;
  final List<String> tasks;
  final List<String> skills;
  final List<CareerStep> careerPath;

  CareerModel({
    required this.title,
    required this.icon,
    required this.description,
    required this.salary,
    required this.tasks,
    required this.skills,
    required this.careerPath,
  });
}