import UIKit

class ReadVC: UIViewController, UIScrollViewDelegate {
    

    var scrollView  = UIScrollView()
   
    var imageView    = UIImageView()
    var authorLabel  = UILabel()
    var titleLabel   = UILabel()
    var contentLabel = UILabel()
    var date         = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(authorLabel)
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(contentLabel)
        scrollView.addSubview(date)
        
        scrollView.delegate = self
        createConstraints()
        contentLabel.font = UIFont(name: "System Light", size: userDefaults.object(forKey: KeyForUserDefaults.fontKey) as? CGFloat ?? 16.0)
        preparationUiElements()
    }
    
    //MARK: Navigation Bar Button Item
    
    @IBAction func shareButton(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func doneButton(_ sender: UIBarButtonItem) {
        
    }
    
    //MARK: Customization UI

    private func createConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints    = false
        imageView.translatesAutoresizingMaskIntoConstraints     = false
        authorLabel.translatesAutoresizingMaskIntoConstraints   = false
        titleLabel.translatesAutoresizingMaskIntoConstraints    = false
        contentLabel.translatesAutoresizingMaskIntoConstraints  = false
        date.translatesAutoresizingMaskIntoConstraints          = false
                
        NSLayoutConstraint.activate([
           
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 17),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -17),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -17),
            
            imageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: scrollView.topAnchor, constant: view.bounds.width/1.52),
            imageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            authorLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 0),
            authorLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            authorLabel.trailingAnchor.constraint(equalTo: date.leadingAnchor, constant: -10),
            
            date.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 0),
            date.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            date.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: view.bounds.width/2),
            
            titleLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            
            contentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            contentLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            contentLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            contentLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
    
    private func preparationUiElements() {
        
        scrollView.showsVerticalScrollIndicator = true
        scrollView.scrollsToTop = true
        
        authorLabel.numberOfLines = 1
        authorLabel.lineBreakMode = .byTruncatingTail
        authorLabel.textColor     = UIColor.systemGray
        authorLabel.textAlignment = .left
        authorLabel.font          = authorLabel.font.withSize(12.0)
        
        date.numberOfLines = 1
        date.textColor     = UIColor.systemGray
        date.textAlignment = .right
        date.font          = date.font.withSize(12.0)

        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byTruncatingTail
        titleLabel.textAlignment = .left
        titleLabel.font          = UIFont(name: "Hoefler Text", size: 32.0)
        
        contentLabel.numberOfLines = 0
        contentLabel.textAlignment = .natural
        contentLabel.textColor     = UIColor.darkGray
        
        imageView.image       = UIImage(named: "Launch")
        imageView.contentMode = .scaleAspectFill
        
        imageView.clipsToBounds       = true
        imageView.layer.cornerRadius  = 12
        imageView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        
        scrollView.scrollsToTop        = true
        scrollView.clipsToBounds       = true
        scrollView.layer.cornerRadius  = 12
        scrollView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]

        /* Font text */
        
        /* Color text */

    }
}





