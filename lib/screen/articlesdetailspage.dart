import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 14, 44, 77),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0), // Add padding for better appearance
            child: CircleAvatar(
              backgroundImage: AssetImage("images/person1.png"),
              radius: 20.0, // Adjust the size as needed
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Embracing Calmness: A Journey to Inner Peace',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 14, 44, 77),
                ),
              ),
              const SizedBox(
                  height: 16.0), // Adds spacing between title and image
              ClipRRect(
                borderRadius:
                    BorderRadius.circular(20.0), // Adjust the radius as needed
                child: Image.asset(
                  "images/calm8.jpeg",
                  width: double.infinity, // Makes image take full width
                  height: 200.0, // Adjust the height as needed
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                  height: 16.0), // Adds spacing between image and content
              const Text(
                'In the hustle and bustle of daily life, finding moments of calm can be a challenge. Yet, it is these very moments that can offer profound relief and tranquility. As you gaze upon this image, take a deep breath and let its serene beauty remind you of the peace that is always within reach.\n\n'
                'Practice mindfulness by setting aside a few minutes each day to focus on your breath. Let go of any stress or distractions and simply be present in the moment. This practice can help center your thoughts and foster a deeper sense of inner peace.\n\n'
                'Engage in activities that promote relaxation such as reading a book, taking a warm bath, or listening to soothing music. Allow yourself time to unwind and recharge. Remember, calmness is not a destination but a journey. By integrating these practices into your daily life, you can create a more peaceful and balanced state of being.\n\n'
                'Sets the context for the image and text, acknowledging the difficulty of finding calmness in daily life and suggesting that the image can serve as a reminder of tranquility.\n\n',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
