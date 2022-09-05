import UIKit

var dataArrayNews = [ModelNews]()
var networkManager = NetworkManager()

class FirstVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        networkManager.fetchDataByCountrysHeadlines(country: .UnitedStates)
        networkManager.onCompletion = { currentPost, image in
            print(currentPost.content ?? "Error")
        }
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
//        self.collectionView.visibleCells[]
      
        
        
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

            cell.label.text = "12"        
        
//        cell.label.text = NetworkManager
//
//        cell.label.text = item.articles
//        cell.image = UIImage(data: dataArrayNews[indexPath.row].)
        
//        let currentNews =
        
        return cell
    }
}
