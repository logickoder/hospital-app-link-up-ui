import 'dart:math';

import 'package:flutter/material.dart';

class Hospital {
  final String name, services, image;
  final TimeOfDay openingTime, closingTime;
  final List<double> ratings;

  const Hospital({
    required this.name,
    required this.services,
    required this.image,
    required this.openingTime,
    required this.closingTime,
    required this.ratings,
  });
}

final testHospitals = [
  Hospital(
    name: 'National Hospital Abuja, Nigeria.',
    services: 'General medicine, Specialized Surgery...',
    image:
        'https://img.freepik.com/free-photo/facade-modern-building-with-geometric-windows-curved-walls_181624-16998.jpg?w=740&t=st=1679548030~exp=1679548630~hmac=9a5e1185c9ea0d29dcb16c92c0d90c51017f70852b232ec93fc22a7c881026a8',
    openingTime: const TimeOfDay(hour: 6, minute: 0),
    closingTime: const TimeOfDay(hour: 22, minute: 0),
    ratings: List.generate(276, (index) => Random().nextDouble() * 5),
  ),
  Hospital(
    name: 'St. Thomas Hospital London - UK',
    services: 'General medicine, Specialized Surgery...',
    image:
        'https://itp1.itopfile.com/ImageServer/z_itp_050320212zvz/270/0/plusbuilding-pic-icon5z-z50721529285.webp',
    openingTime: const TimeOfDay(hour: 6, minute: 0),
    closingTime: const TimeOfDay(hour: 22, minute: 0),
    ratings: List.generate(276, (index) => Random().nextDouble() * 5),
  ),
  Hospital(
    name: 'The Royal Marsden Hospital Loondon',
    services: 'Cancer diagnosis, treatment and resea... ',
    image:
        'https://c4.wallpaperflare.com/wallpaper/798/291/709/autumn-lake-park-building-wallpaper-preview.jpg',
    openingTime: const TimeOfDay(hour: 9, minute: 0),
    closingTime: const TimeOfDay(hour: 17, minute: 30),
    ratings: List.generate(235, (index) => Random().nextDouble() * 5),
  ),
  Hospital(
    name: 'Samsung Medical Center Seoul, South Korea',
    services: 'General medicine, Specialized Surgery...',
    image:
        'https://itp1.itopfile.com/ImageServer/z_itp_050320212zvz/270/0/plusbuilding-pic-icon5z-z50721529285.webp',
    openingTime: const TimeOfDay(hour: 8, minute: 0),
    closingTime: const TimeOfDay(hour: 18, minute: 0),
    ratings: List.generate(300, (index) => Random().nextDouble() * 5),
  ),
  Hospital(
    name: 'Massachusetts General Hospital Boston',
    services: 'General medicine, Specialized Surgery...',
    image:
        'https://images.adsttc.com/media/images/5054/fb40/28ba/0d21/0400/003e/newsletter/stringio.jpg?1414195474',
    openingTime: const TimeOfDay(hour: 9, minute: 0),
    closingTime: const TimeOfDay(hour: 17, minute: 0),
    ratings: List.generate(200, (index) => Random().nextDouble() * 4.5),
  ),
  Hospital(
    name: 'Charité-Universitätsmedizin Berlin.',
    services: 'General medicine, Pediatrics, Specialized Surgery...',
    image:
        'https://research.newamericaneconomy.org/wp-content/uploads/sites/2/2016/09/NAE-Report-Cover-Image-MD.png',
    openingTime: const TimeOfDay(hour: 6, minute: 0),
    closingTime: const TimeOfDay(hour: 18, minute: 0),
    ratings: List.generate(276, (index) => Random().nextDouble() * 5),
  ),
];
