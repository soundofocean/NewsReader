import SwiftUI

/// ViewModel - наблюдаемый объект, в котором описываются все возможные действия, которые могут происходить в ArticlesScreen
class ArticlesViewModel: ObservableObject {
  
  
  /// Издатель типа пустого массива Article
  @Published var articles: [Article] = []
  
  /// Метод запроса к серверу и загрузка информации в виде JSON
  func loadingArticles() {
    
    //    При отрицательном результате выдается ошибка, при положительном - константе url присвается значение, определяющее расположение ресурса
    guard let url = URL(string: "https://api.lil.software/news") else {
      print("Invalid URL")
      return
    }
    
    /// Запрос на загрузку URL-адреса
    let request = URLRequest(url: url)
    
    //    Попытка получить информацию с сервера
    URLSession.shared.dataTask(with: request) { data, response, error in
      
      // #warning!
      if let data = data {
        do {
          /// Константа, в которую записывается декодированный ответ
          let decodedResponse = try JSONDecoder().decode(News.self, from: data)
          
          //          Асинхронное выполнение последовательности действий???
          DispatchQueue.main.async {
            
            //            Запись в параметр декодированного ответа
            self.articles = decodedResponse.articles
          }
          
          //          Описание ошибок, которые могут возникнуть при декодировании информации
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

