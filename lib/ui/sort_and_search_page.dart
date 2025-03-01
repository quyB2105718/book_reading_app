import 'package:flutter/material.dart';
import '/models/book.dart';

class SortAndSearchPage extends StatefulWidget {
  final List<Book> books;
  final Function(List<Book>) onApplySortAndSearch;

  SortAndSearchPage({required this.books, required this.onApplySortAndSearch});

  @override
  _SortAndSearchPageState createState() => _SortAndSearchPageState();
}

class _SortAndSearchPageState extends State<SortAndSearchPage> {
  String _sortBy = 'Default'; // Default sorting option
  String _searchQuery = ''; // Search query
  List<Book> _filteredBooks = []; // Filtered and sorted books

  @override
  void initState() {
    super.initState();
    _filteredBooks = List.from(widget.books); // Initialize with all books
  }

  void _applySortAndSearch() {
    List<Book> result = List.from(widget.books);

    // Apply search filter
    if (_searchQuery.isNotEmpty) {
      result = result
          .where((book) =>
              book.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
              book.author.toLowerCase().contains(_searchQuery.toLowerCase()) ||
              book.genre.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    }

    // Apply sorting
    switch (_sortBy) {
      case 'Favorite':
        result.sort((a, b) {
          if (a.isFavourite && !b.isFavourite) {
            return -1; // a comes before b
          } else if (!a.isFavourite && b.isFavourite) {
            return 1; // b comes before a
          } else {
            return 0; // no change in order
          }
        });
        break;
      case 'Author':
        result.sort(
            (a, b) => a.author.compareTo(b.author)); // Sort by author (A-Z)
        break;
      case 'Genre':
        result
            .sort((a, b) => a.genre.compareTo(b.genre)); // Sort by genre (A-Z)
        break;
      default:
        // Default sorting (no specific order)
        break;
    }

    setState(() {
      _filteredBooks = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sort and Search'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              // Return the filtered and sorted books to the main page
              widget.onApplySortAndSearch(_filteredBooks);
              Navigator.pop(context); // Close the sorting and searching page
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                labelText: 'Search by title, author, or genre',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
                _applySortAndSearch(); // Apply search filter
              },
            ),
            SizedBox(height: 20),

            // Sorting Options
            DropdownButton<String>(
              value: _sortBy,
              onChanged: (value) {
                setState(() {
                  _sortBy = value!;
                });
                _applySortAndSearch(); // Apply sorting
              },
              items: [
                DropdownMenuItem(
                  value: 'Default',
                  child: Text('Default'),
                ),
                DropdownMenuItem(
                  value: 'Favorite',
                  child: Text('Sort by Favorite'),
                ),
                DropdownMenuItem(
                  value: 'Author',
                  child: Text('Sort by Author'),
                ),
                DropdownMenuItem(
                  value: 'Genre',
                  child: Text('Sort by Genre'),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Display Filtered and Sorted Books
            Expanded(
              child: ListView.builder(
                itemCount: _filteredBooks.length,
                itemBuilder: (context, index) {
                  final book = _filteredBooks[index];
                  return ListTile(
                    title: Text(book.title),
                    subtitle: Text('${book.author} - ${book.genre}'),
                    trailing: Icon(
                      book.isFavourite ? Icons.favorite : Icons.favorite_border,
                      color: book.isFavourite ? Colors.red : Colors.grey,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
