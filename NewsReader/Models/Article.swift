import Foundation

/// Модель статьи типа Codable для декодирования информации формата JSON, поступающей с сервера и типа Identifiable для возможности использования уникального идентфикатора
struct Article: Codable, Identifiable {
  
  /// Уникальный идентификатор
  var id: String = UUID().uuidString
  
  /// Заголовок статьи
  var title: String?
  
  /// Автор статьи
  var author: String?
  
  /// Ресурс, откуда получена статья
  var source: String?
  
  /// Ссылка в виде URL
  var url: String?
  
  /// Описание
  var description: String?
  
  /// Картинка
  var image: String?
  
  /// Дата
  var date: String?
  
  //  Нужны ли??
  /// Используются при декодировании информации, все case - это параметры самой модели Article
  enum CodingKeys: CodingKey {
    case title
    case author
    case source
    case url
    case description
    case image
    case date
  }
}

