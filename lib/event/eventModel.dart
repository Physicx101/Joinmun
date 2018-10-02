import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Event {
  final String name;
  final String time;
  final String date;
  final String dressCode;
  final String image;
  final String imagePath;
  final IconData icon;
  final List<Speaker> speakers;
  final String where;
  final String floor;
  final String when;
  final String description;
  final List<RecipeIngredient> ingredients;
  final List<RecipeStep> steps;

  const Event(
      {this.name,
        this.time,
        this.date,
      this.dressCode,
      this.image,
      this.imagePath,
      this.icon,
      this.speakers,
      this.where,
      this.floor,
      this.when,
      this.description,
      this.ingredients,
      this.steps});
}

class RecipeIngredient {
  const RecipeIngredient({this.amount, this.description});

  final String amount;
  final String description;
}

class RecipeStep {
  const RecipeStep({this.duration, this.description});

  final String duration;
  final String description;
}

class Speaker {
  final String fullName;
  final String avatarUrl;

  const Speaker({this.fullName, this.avatarUrl});
}

