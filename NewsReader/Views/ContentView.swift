import SwiftUI

struct ContentView: View {
  
  var body: some View {
    
    // TabView в виде двух вкладок внизу экрана телефона
    TabView {
      
      // Экран с статьями
      ArticlesScreen()
        
        .tabItem {
          VStack {
            Image(systemName: "chart.bar.doc.horizontal.fill")
              .resizable()
              // Отрисовка картинки в виде миниатюры
              .renderingMode(.template)
              .foregroundColor(.yellow)
              .font(.system(size: 24, weight: .heavy))
            
            Text("News")
              .font(.system(size: 24, weight: .heavy, design: .default))
          }
        }
      
      // Экран с избранными статьями
      FavoritesScreen()
        
        .tabItem {
          VStack {
            Image(systemName: "star.square.fill")
              .resizable()
              // Отрисовка картинки в виде миниатюры
              .renderingMode(.template)
              .foregroundColor(.yellow)
              .font(.system(size: 24, weight: .heavy))
            
            Text("Favorites")
              .font(.system(size: 24, weight: .heavy, design: .default))
          }
        }
    }
  }
}
