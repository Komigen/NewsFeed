import UIKit
import WebKit

class ReadVC: UIViewController {
    
    private let webView = WKWebView()
    var stringUrl = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        loadRequest(stringUrl: stringUrl)
    }
    
    private func loadRequest(stringUrl: String) {
        
        guard let url = URL(string: stringUrl) else { return }
        
        let urlRequest = URLRequest(url: url)
        
        webView.load(urlRequest)
    }
}





