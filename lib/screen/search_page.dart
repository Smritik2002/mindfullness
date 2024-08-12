import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  final List<String> _searchResults = [
    'Meditation Guide',
    'Sleep Tips',
    'Healthy Eating',
    'Mindfulness Practices',
    'Yoga for Beginners',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 14, 44, 77),
        title: Text(
          'Search',
          style: GoogleFonts.poppins(
              fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  _searchQuery = value.toLowerCase();
                });
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Search Results
            Expanded(
              child: ListView(
                children: _searchResults
                    .where(
                        (result) => result.toLowerCase().contains(_searchQuery))
                    .map((result) {
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                    title: Text(
                      result,
                      style: GoogleFonts.poppins(fontSize: 18),
                    ),
                    leading: const Icon(Icons.article, color: Colors.blue),
                    onTap: () {
                      // Define action for tap, e.g., navigate to detail page
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
