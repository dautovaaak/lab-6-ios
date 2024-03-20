import SwiftUI

struct AddBookView: View {
    @Binding var books: [Book]
    @Binding var showAlert: Bool
    @State private var newBookTitle = ""
    @State private var newBookAuthor = ""
    @State private var rating = 0
    
    var body: some View {
        VStack {
            TextField("Enter book title", text: $newBookTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Enter author", text: $newBookAuthor)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Stepper(value: $rating, in: 0...5, step: 1) {
                Text("Rating: \(rating)")
            }
            .padding()
            
            Spacer()
            
            Button(action: {
                self.addBook()
                self.showAlert = true
            }) {
                Text("Add Book")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
        }
        .padding()
        .transition(.slide)
    }
    
    func addBook() {
        guard !newBookTitle.isEmpty && !newBookAuthor.isEmpty else {
            return
        }
        
        let newBook = Book(title: newBookTitle, author: newBookAuthor, rating: rating)
        books.append(newBook)
        newBookTitle = ""
        newBookAuthor = ""
        rating = 0
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView(books: .constant([]), showAlert: .constant(false))
    }
}
