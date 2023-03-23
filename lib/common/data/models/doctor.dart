import 'dart:math';

class Doctor {
  final String name, hospital, image, type;
  final double rating;

  const Doctor({
    required this.name,
    required this.hospital,
    required this.type,
    required this.image,
    required this.rating,
  });
}

final testDoctors = [
  Doctor(
    name: 'Dr. Jane . C . Nelson ',
    hospital: 'National Hospital Abuja, Nigeria.',
    type: 'Cardiologists',
    image:
        'https://res.cloudinary.com/sagacity/image/upload/c_crop,h_6016,w_4016,x_0,y_0/c_limit,dpr_auto,f_auto,fl_lossy,q_80,w_1080/DrMishra-065_c8hbqk.jpg',
    rating: Random().nextDouble() * 5,
  ),
  Doctor(
    name: 'Dr. Martins Peters',
    hospital: 'Mayo Clinic Rochester, Minn.',
    type: 'Medical Doctor',
    image:
        'https://adldentallabs.wpenginepowered.com/wp-content/uploads/2019/03/adllabs-committed-to-continuing-education-1024x683.jpg',
    rating: Random().nextDouble() * 5,
  ),
  Doctor(
    name: 'Dr. Nwakanma Oluebube',
    hospital: 'Mayo Clinic Rochester, Minn.',
    type: 'Medical Doctor',
    image: 'https://yourcontrol.co/wp-content/uploads/2019/07/blackdoctor.png',
    rating: Random().nextDouble() * 5,
  ),
];
