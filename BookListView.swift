import SwiftUI

struct BookListView: View {
    @Binding var books: [Book]
    
    var body: some View {
        VStack {
            List {
                ForEach(books) { book in
                    NavigationLink(destination: BookDetailView(book: self.$books[self.books.firstIndex(of: book)!], books: self.$books)) {
                        VStack(alignment: .leading) {
                            Text("\(book.title) - \(book.rating) ⭐️")
                                .font(.headline)
                            Text("by \(book.author)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .navigationBarTitle("My Books")
        }
    }
}
