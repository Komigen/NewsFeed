//import Foundation
//
//
//let url = "https://api.apilayer.com/currency_data/change?start_date={start_date}&end_date={end_date}"
//
//struct NetworkManagerApiLayer {
//
//let request = URLRequest(url: URL(string: url)!,timeoutInterval: Double.infinity)
//    
//    request.httpMethod = "GET"
//request.addValue("0macn0d3tym41JXOvCK1Dz3aSG1Sx1XA", forHTTPHeaderField: "apikey")
//
//let task = URLSession.shared.dataTask(with: request) { data, response, error in
//  guard let data = data else {
//    print(String(describing: error))
//    return
//  }
//  print(String(data: data, encoding: .utf8)!)
//}
//task.resume()
//}
