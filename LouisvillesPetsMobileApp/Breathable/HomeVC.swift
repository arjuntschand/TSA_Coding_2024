//
//  AboutUsVC.swift
//  Breathable
//
//  Created by Arjun Tschand on 3/26/23.
//

import UIKit

class AboutUsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
   
    
    @IBAction func clickButton(_ sender: Any) {
        self.tabBarController?.selectedIndex=1
    }

}
