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
        preparationUiElements()
      
        
        
        
        
        authorLabel.text = "Vanessa Gera gera"
        date.text = "1231241235"
        titleLabel.text = "TitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitle"
        contentLabel.text = "view.addSubview(scrollView)scrollView.addSubview(imageView) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label)view.addSubview(scrollView)scrollView.addSubview(imageView) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label) scrollView.addSubview(label)"
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
        
        let safeG = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
           
            scrollView.topAnchor.constraint(equalTo: safeG.topAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: safeG.leadingAnchor, constant: 17),
            scrollView.trailingAnchor.constraint(equalTo: safeG.trailingAnchor, constant: -17),
            scrollView.bottomAnchor.constraint(equalTo: safeG.bottomAnchor, constant: -17),
            
            
            imageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: scrollView.topAnchor, constant: view.bounds.width/1.52),
            imageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            
            authorLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 0),
            authorLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            authorLabel.trailingAnchor.constraint(equalTo: date.leadingAnchor, constant: -10),
            
            date.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 0),
            date.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            date.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: view.bounds.width/2),
            
            titleLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: view.bounds.width/1.52 - 150),
            titleLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            
            contentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            contentLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentLabel.trailingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    private func preparationUiElements() {
        
        scrollView.showsVerticalScrollIndicator = true
        scrollView.scrollsToTop = true
        
        authorLabel.numberOfLines = 1
        authorLabel.lineBreakMode = .byTruncatingTail
        
        date.numberOfLines = 1
       
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byTruncatingTail
        
        contentLabel.numberOfLines = 0
        contentLabel.textAlignment = .left
        
        imageView.image = UIImage(named: "Launch")
        imageView.contentMode = .scaleAspectFill
        
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        
        scrollView.scrollsToTop = true
        scrollView.clipsToBounds = true
        scrollView.layer.cornerRadius = 20
        scrollView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]

        /* Font text */
        
        /* Color text */

    }
}





