import SwiftUI

struct BookDetailView: View {
    @Binding var book: Book
    @Binding var books: [Book]
    @Environment(\.presentationMode) var presentationMode
    @State private var rating: Int
    
    var body: some View {
        VStack {
            Text("Book Title: \(book.title)")
            Text("Author: \(book.author)")
            
            HStack {
                ForEach(1 ..< 6) { index in
                    Image(systemName: index <= self.rating ? "star.fill" : "star")
                        .foregroundColor(.yellow)
                        .onTapGesture {
                            self.rating = index
                            self.book.rating = index
                        }
                }
            }
            
            Button("Done") {
                self.presentationMode.wrappedValue.dismiss()
            }
            .padding()
        }
        .navigationBarTitle("\(book.title)")
    }
    
    init(book: Binding<Book>, books: Binding<[Book]>) {
        self._book = book
        self._books = books
        self._rating = State(initialValue: book.wrappedValue.rating)
    }
}
