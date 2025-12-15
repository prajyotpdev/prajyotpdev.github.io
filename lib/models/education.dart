// In your experience.dart model file:
import 'package:flutter/cupertino.dart';

@immutable
class Experience {
  final String from;
  final String to;
  final String organization;
  final String post;

  const Experience(this.from, this.to, this.organization, this.post);
}
