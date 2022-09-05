import UIKit

var dataArrayNews = [ModelNews]()
var networkManager = NetworkManager()

class FirstVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


        self.collectionView.dataSource = self
        self.collectionView.delegate = self
//        self.collectionView.visibleCells[]
        networkManager.fetchData(urlString: networkManager.stringForUrl) { [weak self] currentPost in

        }
        
        self.collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
    }


    /*

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension FirstVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
//        let item = dataArrayNews[indexPath.row]
//        
//        cell.label.text = item.articles
//        cell.image = UIImage(data: dataArrayNews[indexPath.row].)
        
//        let currentNews =
        
        return cell
    }
    

}
