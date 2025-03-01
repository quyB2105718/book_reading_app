// main_page.dart
import 'package:flutter/material.dart';
import '/models/book.dart';
import 'reading_page.dart';
import 'add_book_page.dart'; // Import the add book page

class BookListScreen extends StatefulWidget {
  @override
  _BookListScreenState createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  List<Book> books = [
    Book(
      title: "The Onion",
      author: "Idries Shah",
      imageUrl:
          "https://cdn-jdbfh.nitrocdn.com/XTbOLvleLvLTNFoFUdqUzTQBhtILBLqa/assets/images/optimized/rev-4a653e8/idriesshahfoundation.org/wp-content/uploads/2022/03/theonion_bookcover-1.png", // Replace with actual image URL
      genre: "Story",
      content:
          "The Onion by Idries Shah\n\nIn this richly illustrated book, a town full of people who have never before seen an onion, try to sum up the mysterious vegetable's essence. But each person approaching the onion jumps immediately and inevitably to the wrong conclusion.\n\nThe Onion illustrates how people have a tendency to judge based on random coincidences and rash judgement. It is only when humans approach something with open-minded experimentation that sound and useful conclusions can be reached.\n\nThis whimsical story, featuring fabulously detailed spreads, transmits a vital message in a way that adults and children alike will appreciate.",
    ),
    Book(
      title: "The Rich Man and the Monkey",
      author: "Idries Shah",
      imageUrl:
          "https://cdn-jdbfh.nitrocdn.com/XTbOLvleLvLTNFoFUdqUzTQBhtILBLqa/assets/images/optimized/rev-4a653e8/idriesshahfoundation.org/wp-content/uploads/2024/05/childrensbook_TheRichManAndTheMonkey.png", // Replace with actual image URL
      genre: "Humor",
      content:
          "The Rich Man and the Monkey by Idries Shah\n\nWhen a monkey meets a rich man, he complains that he is poor. 'I own nothing, not even clothes,' the monkey says. The rich man, who has a big house and vast estates, starts to feel guilty about possessing so much while the monkey remains destitute. So he decides to sign over all his possessions to the animal. Is this a wise choice? Or has the rich man been too hasty in giving everything away to a monkey?\n\nFor more than 1,000 years this story has entertained children, helped foster the ability to examine their own assumptions and think for themselves. Part of a rich body of literature from Central Asia and the Middle East, The Rich Man and the Monkey is one of many tales collected by the late Afghan author and thinker, Idries Shah.",
    ),
    Book(
      title: "The Horrible Dib Dib",
      author: "Idries Shah",
      imageUrl:
          "https://cdn-jdbfh.nitrocdn.com/XTbOLvleLvLTNFoFUdqUzTQBhtILBLqa/assets/images/optimized/rev-4a653e8/idriesshahfoundation.org/wp-content/uploads/2022/03/thehorribledibdib_bookcover-1.png", // Replace with actual image URL
      genre: "Horror",
      content:
          "The Horrible Dib Dib by Idries Shah\n\nAn extremely useful tale of how human emotions are infectious, not just the positive ones. Just as negative thoughts can cascade, so in this book, the Horrible Dib Dib chains many characters in its deathly grip.\n\nA thief attempting to rob an old woman hears her muttering about the Horrible Dib Dib. 'This abominable Dib Dib will be the death of me,' she cries. Gripped with paranoia, the thief slinks home in chills, setting off a chain of events that ultimately reveals what exactly this horrible, abominable Dib Dib is, that is worrying the life out of so many people. A wonderful tale that reminds the reader how powerful human thoughts can be, even when they're misguided.",
    ),
    Book(
      title: "The Tale of Melon City",
      author: "Idries Shah",
      imageUrl:
          "https://cdn-jdbfh.nitrocdn.com/XTbOLvleLvLTNFoFUdqUzTQBhtILBLqa/assets/images/optimized/rev-4a653e8/idriesshahfoundation.org/wp-content/uploads/2024/05/childrensbook_TheTaleOfMelonCity.png", // Replace with actual image URL
      genre: "Humor",
      content:
          "The Tale of Melon City by Idries Shah\n\nHow can a mere melon be crowned a king? All too easily, it seems, in a city where basic common sense is in short supply. Its people are willing to accept authority in any shape or form, and their silly former king has ordered his own execution -- all because he bumped his head on an arch and couldn't find someone else to blame! For centuries, this hilarious Central Asian teaching-story about a society where rationality turns in on itself has been a firm favourite with children. But is it really so far-fetched?\n\nThe Tale of Melon City is one of many stories collected by the late Afghan author and thinker, Idries Shah.",
    ),
  ];

  void toggleFavorite(int index) {
    setState(() {
      books[index] =
          books[index].copyWith(isFavourite: !books[index].isFavourite);
    });
  }

  void navigateToBookContent(BuildContext context, Book book) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookContentScreen(book: book),
      ),
    );
  }

  void navigateToAddBookPage(BuildContext context) async {
    // Navigate to the Add Book Page and wait for a result
    final newBook = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddBookPage(
          onAddBook: (book) {
            // Add the new book to the list
            setState(() {
              books.add(book);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book List'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => navigateToAddBookPage(context),
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 0.7,
        ),
        itemCount: books.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => navigateToBookContent(context, books[index]),
            child: Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(12.0)),
                      child: Image.network(
                        books[index].imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          books[index].title,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          books[index].author,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          books[index].genre,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      icon: Icon(
                        books[index].isFavourite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color:
                            books[index].isFavourite ? Colors.red : Colors.grey,
                      ),
                      onPressed: () => toggleFavorite(index),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
