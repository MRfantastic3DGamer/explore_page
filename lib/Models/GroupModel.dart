import 'package:explore/data.dart';
import 'package:flutter/material.dart';

class Group {
  final String title;
  final String creator;
  final int amount;
  final String timeSpan;
  final int requiredMemberCount;
  final int currentMemberCount;
  final int similarGroups;
  final AssetImage logo;
  final AssetImage creatorImage;

  const Group({
    required this.creator,
    required this.amount,
    required this.timeSpan,
    required this.requiredMemberCount,
    required this.currentMemberCount,
    required this.similarGroups,
    required this.title,
    required this.logo,
    required this.creatorImage,
  });
}
