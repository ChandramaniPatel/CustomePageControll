 
//  Created by Chandramani Patel on 31/07/16.
 
import UIKit

private let reuseIdentifier = "InspirationCellIdentifier"

class InspirationViewController: UIViewController {
    
    @IBOutlet weak var inspCollectionView: UICollectionView!
    
    @IBOutlet weak var pageControll: UIPageControl!
      var sectionsArray : [String] = []
      private var currentIndex:Int = 0

    // Define bounds
//    private let maxLimit = 25
//    private let minLimit = 0
 
    
    
    // Define @IBAction from UIPageControl
    
    @IBAction func moveViewLeftRight(sender: UIPageControl) {
       
        // Move to Right
        /*
        if currentIndex < maxLimit && sender.currentPage > currentIndex {
           
            currentIndex += 1
           let indexPath : IndexPath = IndexPath(item: currentIndex, section: 0)
           self.inspCollectionView.scrollToItem(at:indexPath, at: .right, animated: true)
            
            // Move to Left
        } else if currentIndex > minLimit {
            currentIndex -= 1
            let indexPath : IndexPath = IndexPath(item: currentIndex, section: 0)

            self.inspCollectionView.scrollToItem(at:indexPath, at: .left, animated: true)
        }
        */
        
        self.inspCollectionView
            .scrollRectToVisible(CGRect(
                x: Int(self.inspCollectionView.frame.size.width) * self.pageControll.currentPage,
                y: 0,
                width:Int(self.inspCollectionView.frame.size.width),
                height: Int(self.inspCollectionView.frame.size.height)),
                                 animated: true)

    }

    // uncomment if you want left and right button too and connect your IBOut to these method
  /*
    @IBAction func leftButtonAction(_ sender: AnyObject) {
        
        if self.inspCollectionView.contentOffset.x < self.inspCollectionView.contentSize.width-self.inspCollectionView.frame.size.width {
            self.inspCollectionView.setContentOffset(CGPoint(x: self.inspCollectionView.contentOffset.x + self.inspCollectionView.frame.size.width,y: 0),animated: true)
        }
        
    }
    
 
    @IBAction func rightButtonAction(_ sender: AnyObject) {

        if self.inspCollectionView.contentOffset.x>0 {
        self.inspCollectionView.setContentOffset(CGPoint(x: self.inspCollectionView.contentOffset.x - self.inspCollectionView.frame.size.width,y: 0),animated: true)
         }
    }
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.sectionsArray.append("images1.jpeg")
        self.sectionsArray.append("images2.jpeg")
        self.sectionsArray.append("images3.jpg")
        self.sectionsArray.append("images4.jpeg")
        self.sectionsArray.append("images1.jpeg")
        self.sectionsArray.append("images2.jpeg")
        self.sectionsArray.append("images3.jpg")
        
        self.pageControll.numberOfPages = self.sectionsArray.count
      
        // maxLimit = self.pageControll.numberOfPages
        // Do any additional setup after loading the view.
        self.inspCollectionView.isPagingEnabled=true;
        
    }

    override func viewDidAppear(_ animated: Bool) {
        self.view.bringSubview(toFront: self.pageControll)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     
     func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView==self.inspCollectionView {
           print("scrollViewDidEndDecelerating")
         let a = Int(self.inspCollectionView.contentOffset.x/375)
            print(a)
            currentIndex = a
            pageControll.currentPage = currentIndex


        }
    }
    
    // MARK: UICollectionViewDataSource
    
      func numberOfSectionsInCollectionView(_ collectionView: UICollectionView) -> Int {
        return 1
    }
    
      func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.sectionsArray.count
    }
    
      func collectionView(_ collectionView: UICollectionView, cellForItemAtIndexPath indexPath: IndexPath) -> UICollectionViewCell {
        
        let inspirationCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! InspirationCollectionViewCell
        
        
        inspirationCollectionViewCell.inspImageView.image = UIImage.init(named: self.sectionsArray[indexPath.row])
        
         return inspirationCollectionViewCell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        
        
        return CGSize(width: self.view.frame.size.width, height: 337)
        
        
    }
    
     func collectionView(_ collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: IndexPath){
        
        //        let cell : UICollectionViewCell = collectionView.cellForItemAtIndexPath(indexPath)!
        //        cell.backgroundColor = UIColor.magentaColor()
   

//        let sectionListObj = self.sectionsArray[(indexPath as NSIndexPath).row]
//        
//        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let bookVC = storyboard.instantiateViewController(withIdentifier: "BookViewControllerSBID") as! BookViewController
//        bookVC.topicId = sectionListObj.idSectionList
//        bookVC.bookImageName = sectionListObj.featuredImageSectionList
//        bookVC.bookDescription = sectionListObj.descriptionSectionList
//        bookVC.title = bookVC.bookDescription
//        self.navigationController?.pushViewController(bookVC, animated: true)
        

        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
