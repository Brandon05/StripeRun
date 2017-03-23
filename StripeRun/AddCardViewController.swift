//
//  AddCardViewController.swift
//  StripeRun
//
//  Created by Brandon Sanchez on 3/23/17.
//  Copyright © 2017 Brandon Sanchez. All rights reserved.
//

import UIKit
import Stripe
import Alamofire

class AddCardViewController: STPAddCardViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func chargeUsing(token: STPToken) {
        let requestString = "https://powerful-retreat-17820.herokuapp.com/charge.php"
        let params = ["stripeToken": token.tokenId, "amount":"200", "currency":"usd", "description":"testRun"]
        
        Alamofire.request(requestString, method: .post, parameters: params).responseJSON {
            response in
            
            print(response.request)
            print(response.response)
            print(response.data)
            print(response.description)
            
            if let json = response.result.value {
                print("JSON: \(json)")
            }
        }
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
