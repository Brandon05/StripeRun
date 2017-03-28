//
//  CustomAddCardViewController.swift
//  StripeRun
//
//  Created by Brandon Sanchez on 3/28/17.
//  Copyright © 2017 Brandon Sanchez. All rights reserved.
//

import UIKit
import Stripe

class CustomAddCardViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, STPAddCardViewControllerDelegate {
    
    @IBOutlet weak var cardCollectionView: UICollectionView!
    
    var cellCount: Int! // must be at least one cell (add card cell)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardCollectionView.delegate = self
        cardCollectionView.dataSource = self
        
        // Load NIb Files
        cardCollectionView.register(CardCell.self)
        cardCollectionView.register(AddCardCell.self)
        
        // Set dynamic constraint dependent on the amount of cells
        //cardTableViewBottomConstraint.constant = 500 //cardTableViewBottomConstraint.constant - (1 * 35)
        cellCount = 4
        let cardCollectionViewHeight = CGFloat(cellCount * 35) // 35 is height of cell according to Nib file
        //cardCollectionView.frame = CGRect(x: cardTableView.frame.origin.x, y: cardTableView.frame.origin.y, width: cardTableView.frame.width, height:tableViewHeight)
        
        //cardCollectionView.tableFooterView = UIView(frame: CGRect(origin: CGPoint.zero, size: CGSize.zero))
       // cardCollectionView.backgroundColor = UIColor.clear
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let addCardCell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as AddCardCell
        let cardCell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as CardCell
        
        print("indexPath.row: \(indexPath.row), endIndex: \(indexPath.endIndex)")
        
        if indexPath.row == cellCount - 1 {
            return addCardCell
        }
        
        return cardCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == cellCount - 1 {
            //self.performSegue(withIdentifier: "AddCardSegue", sender: self)
            addCardTapped()
        } else {
            self.performSegue(withIdentifier: "CardDetails", sender: self)
        }
    }
    
    func addCardTapped() {
        let addCardViewController = STPAddCardViewController()
        addCardViewController.delegate = self
        // STPAddCardViewController must be shown inside a UINavigationController.
        let navigationController = UINavigationController(rootViewController: addCardViewController)
        self.present(navigationController, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 5, height: 35)
    }
    
    // MARK: STPAddCardViewControllerDelegate
    
    func addCardViewControllerDidCancel(_ addCardViewController: STPAddCardViewController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func addCardViewController(_ addCardViewController: STPAddCardViewController, didCreateToken token: STPToken, completion: @escaping STPErrorBlock) {
//        self.submitTokenToBackend(token, completion: { (error: Error?) in
//            if let error = error {
//                completion(error)
//            } else {
//                self.dismiss(animated: true, completion: {
//                    self.showReceiptPage()
//                    completion(nil)
//                })
//            }
//        })
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
