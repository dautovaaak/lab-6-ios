import SwiftUI

struct ContentView: View {
    @State private var books = [
        Book(title: "1984", author: "George Orwell", rating: 0),
        Book(title: "To Kill a Mockingbird", author: "Harper Lee", rating: 0),
        Book(title: "Metro 2033", author: "Dmitry Glukhovsky", rating: 0)
    ]
    @State private var isAddingBook = false
    @State private var showAlert = false
    
    var body: some View {
        TabView {
            NavigationView {
                BookListView(books: $books)
            }
            .tabItem {
                Image(systemName: "book")
                Text("Books")
            }
            
            NavigationView {
                AddBookView(books: $books, showAlert: $showAlert)
            }
            .tabItem {
                Image(systemName: "plus")
                Text("Add Book")
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Book Added"), message: Text("The book has been successfully added."), dismissButton: .default(Text("OK")))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
