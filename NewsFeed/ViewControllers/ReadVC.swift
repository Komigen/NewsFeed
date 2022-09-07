import UIKit

class ReadVC: UIViewController {
    
    var scrollView  = UIScrollView()
    var imageView   = UIImageView()
    
    var authorLabel = UILabel()
    var titleLabel  = UILabel()
    var textLabel   = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        preparationUiElements()
        scrollView.isScrollEnabled = true
        scrollView.contentInsetAdjustmentBehavior = .automatic
        

        scrollView.backgroundColor = UIColor.darkGray
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(authorLabel)
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(textLabel)
        
        scrollView.translatesAutoresizingMaskIntoConstraints    = false
        imageView.translatesAutoresizingMaskIntoConstraints     = false
        authorLabel.translatesAutoresizingMaskIntoConstraints   = false
        titleLabel.translatesAutoresizingMaskIntoConstraints    = false
        textLabel.translatesAutoresizingMaskIntoConstraints     = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -17),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            
            imageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: scrollView.topAnchor, constant: view.bounds.width/1.52),
            
            
            authorLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 0),
            authorLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            authorLabel.trailingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            authorLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            
            titleLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: view.bounds.width/1.52 - 150),
            titleLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            
            textLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            textLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            textLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        
        
        
        authorLabel.text = "Author"
        titleLabel.text = "TitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitle"
        textLabel.text = "view.addSubview(scrollView)scrollView.addSubview(imageView) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label)"
    }
    func preparationUiElements() {
        
        scrollView.showsVerticalScrollIndicator = true
        scrollView.scrollsToTop = true
        authorLabel.numberOfLines = 1
        authorLabel.lineBreakMode = .byTruncatingTail
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byTruncatingTail
        textLabel.numberOfLines = 0
        textLabel.textAlignment = .left
        
        imageView.image = UIImage(named: "ru")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 20
        scrollView.layer.cornerRadius = 10
    }
}





