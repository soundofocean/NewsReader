import SwiftUI

struct ContentView: View {
//  @Environment(\.managedObjectContext) private var viewContext
//
//  @FetchRequest(
//      sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//      animation: .default)
//  private var items: FetchedResults<Item>
  
  var body: some View {
    
    // TabView в виде двух вкладок внизу экрана телефона
    TabView {
      
      // Экран с статьями
      ArticlesScreen()
        
        .tabItem {
          VStack {
            Image(systemName: "chart.bar.doc.horizontal.fill")
              .resizable()
//              Отрисовка картинки в виде миниатюры
              .renderingMode(.template)
              .foregroundColor(.yellow)
              .font(.system(size: 24, weight: .heavy))
            
            Text("News")
              .font(.system(size: 24, weight: .heavy, design: .default))
          }
        }
      
      // Будущий экран с избранными статьями
      Text("Favorites")
        
        .tabItem {
          Text("Favorites")
        }
    }
  }
}

//private func addItem() {
//    withAnimation {
//        let newItem = Item(context: viewContext)
//        newItem.timestamp = Date()
//
//        do {
//            try viewContext.save()
//        } catch {
//            // Replace this implementation with code to handle the error appropriately.
//            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//            let nsError = error as NSError
//            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//        }
//    }
//}
