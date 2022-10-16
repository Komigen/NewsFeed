import UIKit

extension String {
    
    mutating func getFormattedDate(stringDate: String?) {
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MM-dd-yyyy HH:mm"
        
        let date = dateFormatterGet.date(from: "2018-02-01T19:10:04+00:00")
     
        if let safeDate = date {
            self = dateFormatterPrint.string(from: safeDate)
        }
    }
}


