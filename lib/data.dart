import 'package:explore/Models/GroupModel.dart';
import 'package:flutter/material.dart';

import '/Models/Highlights.dart';
import 'Models/Offers.dart';

List<Highlight> highlights = [
  const Highlight(
      id: '1',
      title: 'title 1',
      placeholder: AssetImage('assets/Images/Highlites/ssl1.png'),
      image: AssetImage('assets/Images/Highlites/ss1.png')),
  const Highlight(
      id: '2',
      title: 'title 2',
      placeholder: AssetImage('assets/Images/Highlites/ssl2.png'),
      image: AssetImage('assets/Images/Highlites/ss2.png')),
  const Highlight(
      id: '3',
      title: 'title 3',
      placeholder: AssetImage('assets/Images/Highlites/ssl3.png'),
      image: AssetImage('assets/Images/Highlites/ss3.png')),
];

List<Offer> offers = [
  Offer(
    id: '1',
    title: 'Disney + Hotstar Pro',
    image: const AssetImage('assets/Images/Subscription posters/disney+hotstar.jpg'),
    offer: 30,
    price: 299,
    logo: imagesAssets['Disney'] as AssetImage,
  ),
  Offer(
    id: '2',
    title: 'Linked in Pro',
    image: const AssetImage('assets/Images/Subscription posters/linked in.jpg'),
    offer: 30,
    price: 299,
    logo: imagesAssets['Linkedin'] as AssetImage,
  ),
  Offer(
    id: '3',
    title: 'Soni liv Pro',
    image: const AssetImage('assets/Images/Subscription posters/soni liv.jpg'),
    offer: 30,
    price: 299,
    logo: imagesAssets['Soniliv'] as AssetImage,
  ),
  Offer(
    id: '4',
    title: 'Voot Pro',
    image: const AssetImage('assets/Images/Subscription posters/voot.jpg'),
    offer: 30,
    price: 299,
    logo: imagesAssets['Voot'] as AssetImage,
  ),
  Offer(
    id: '5',
    title: 'Amazon prime',
    image: const AssetImage('assets/Images/Subscription posters/amazon prime.jpg'),
    offer: 30,
    price: 299,
    logo: imagesAssets['Amazon'] as AssetImage,
  ),
  Offer(
    id: '6',
    title: 'Zee 5 Pro',
    image: const AssetImage('assets/Images/Subscription posters/zee 5.jpg'),
    offer: 30,
    price: 299,
    logo: imagesAssets['Zee5'] as AssetImage,
  ),
];

List<String> titles = [
  'Spotify Family Plan',
  'Spotify Duo Plan',
  'Netflix Standard Plan',
  'Netflix Premium Plan',
  'Canvas Pro',
  'Zomato Pro'
];

Map<String, AssetImage> imagesAssets = {
  'Amazon': const AssetImage('assets/Images/Logos/amazon prime.jpg'),
  'Canva': const AssetImage('assets/Images/Logos/Canva.jpg'),
  'Disney': const AssetImage('assets/Images/Logos/Disney+hotstar.jpg'),
  'Linkedin': const AssetImage('assets/Images/Logos/linked in.png'),
  'Netflix': const AssetImage('assets/Images/Logos/Netflix.png'),
  'Soniliv': const AssetImage('assets/Images/Logos/soni liv.jpg'),
  'Spotify': const AssetImage('assets/Images/Logos/Spotify.png'),
  'Voot': const AssetImage('assets/Images/Logos/voot.png'),
  'Zee5': const AssetImage('assets/Images/Logos/Zee5.png'),
  'Zomato': const AssetImage('assets/Images/Logos/Zomato.png'),
  'user': const AssetImage('assets/Images/user_default.webp'),
  'coin': const AssetImage('assets/Images/gold-coin-icon.jpg'),
  'subSpace': const AssetImage('assets/Images/Logos/subspace.png'),
};

List<Group> groups = [
  Group(
      title: titles[0],
      amount: 40,
      creator: "Yogesh Saini",
      requiredMemberCount: 6,
      timeSpan: 'Months',
      currentMemberCount: 1,
      similarGroups: 40,
      logo: imagesAssets['Spotify'] as AssetImage,
      creatorImage: imagesAssets['user'] as AssetImage),
  Group(
      title: titles[1],
      amount: 40,
      creator: "Satya Das",
      requiredMemberCount: 2,
      timeSpan: 'Quarter',
      currentMemberCount: 1,
      similarGroups: 40,
      logo: imagesAssets['Spotify'] as AssetImage,
      creatorImage: imagesAssets['user'] as AssetImage),
  Group(
      title: titles[1],
      amount: 40,
      creator: "Tarun",
      requiredMemberCount: 2,
      timeSpan: 'Months',
      currentMemberCount: 1,
      similarGroups: 40,
      logo: imagesAssets['Spotify'] as AssetImage,
      creatorImage: imagesAssets['user'] as AssetImage),
  Group(
      title: titles[0],
      amount: 40,
      creator: "Weeshify",
      requiredMemberCount: 6,
      timeSpan: 'Quarter',
      currentMemberCount: 2,
      similarGroups: 40,
      logo: imagesAssets['Spotify'] as AssetImage,
      creatorImage: imagesAssets['user'] as AssetImage),
  Group(
      title: titles[1],
      amount: 40,
      creator: "Priyan",
      requiredMemberCount: 2,
      timeSpan: 'Year',
      currentMemberCount: 1,
      similarGroups: 40,
      logo: imagesAssets['Spotify'] as AssetImage,
      creatorImage: imagesAssets['user'] as AssetImage),
  Group(
      title: titles[2],
      amount: 40,
      creator: "Anil Thakur",
      requiredMemberCount: 2,
      timeSpan: 'Months',
      currentMemberCount: 1,
      similarGroups: 40,
      logo: imagesAssets['Netflix'] as AssetImage,
      creatorImage: imagesAssets['user'] as AssetImage),
  Group(
      title: titles[3],
      amount: 40,
      creator: "Yogesh Saini",
      requiredMemberCount: 4,
      timeSpan: 'Months',
      currentMemberCount: 1,
      similarGroups: 40,
      logo: imagesAssets['Netflix'] as AssetImage,
      creatorImage: imagesAssets['user'] as AssetImage),
  Group(
      title: titles[4],
      amount: 40,
      creator: "Devesh_09",
      requiredMemberCount: 5,
      timeSpan: 'Year',
      currentMemberCount: 1,
      similarGroups: 40,
      logo: imagesAssets['Canva'] as AssetImage,
      creatorImage: imagesAssets['user'] as AssetImage),
  Group(
      title: titles[4],
      amount: 40,
      creator: "Saurabh D.",
      requiredMemberCount: 5,
      timeSpan: 'Months',
      currentMemberCount: 1,
      similarGroups: 40,
      logo: imagesAssets['Canva'] as AssetImage,
      creatorImage: imagesAssets['user'] as AssetImage),
  Group(
      title: titles[5],
      amount: 40,
      creator: "Dhruv",
      requiredMemberCount: 3,
      timeSpan: 'Months',
      currentMemberCount: 1,
      similarGroups: 40,
      logo: imagesAssets['Zomato'] as AssetImage,
      creatorImage: imagesAssets['user'] as AssetImage),
];
