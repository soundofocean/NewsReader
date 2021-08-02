import SwiftUI

/// Динамические данные
class ArticlesViewModel: ObservableObject {
  
  //  enum NetWorkError: Error {
  //    case badURL, requestFailed, unknown
  //  }
  
  //  Публикация значений при изменении
  @Published var articles: [Article] = []
  
  //  Описание запроса к серверу и получение информации в виде JSON
  func loadingArticles() {
    guard let url = URL(string: "https://api.lil.software/news") else {
      print("Invalid URL")
      return
    }
    
    let request = URLRequest(url: url)
    
    URLSession.shared.dataTask(with: request) { data, response, error in
      
      if let data = data {
        do {
          let decodedResponse = try JSONDecoder().decode(News.self, from: data)
          
          DispatchQueue.main.async {
            self.articles = decodedResponse.articles
          }
        } catch let DecodingError.dataCorrupted(context) {
          print(context)
        } catch let DecodingError.keyNotFound(key, context) {
          print("Key '\(key)' not found:", context.debugDescription)
          print("codingPath:", context.codingPath)
        } catch let DecodingError.valueNotFound(value, context) {
          print("Value '\(value)' not found:", context.debugDescription)
          print("codingPath:", context.codingPath)
        } catch let DecodingError.typeMismatch(type, context)  {
          print("Type '\(type)' mismatch:", context.debugDescription)
          print("codingPath:", context.codingPath)
        } catch {
          print("error: ", error)
        }
      }
    }.resume()
  }
}

