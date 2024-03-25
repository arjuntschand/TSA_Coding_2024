//
//  MoreInfoVC.swift
//  Breathable
//
//  Created by Arjun Tschand on 3/26/23.
//

import UIKit
import SafariServices


class MoreInfoVC: UIViewController {

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

    @IBAction func donateFoodButton(_ sender: Any) {if let url = URL(string: "https://barclaysquareprinceton.com/blog/30-fun-facts-about-new-jersey/") {
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }}
    @IBAction func donateClothesButton(_ sender: Any) {
        if let url = URL(string: "https://www.nj.gov/nj/about/history/short_history.html") {
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
        }}
    @IBAction func volunteerButton(_ sender: Any) {
        if let url = URL(string: "https://www.travelandleisure.com/new-jersey-travel-8552239") {
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
        }}
    @IBAction func petHealthButton(_ sender: Any) {
        if let url = URL(string: "https://davisic.princeton.edu/climate-and-clothing") {
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    }
    
    @IBAction func instagramButton(_ sender: Any) {
        if let url = URL(string: "https://www.instagram.com") {
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    }
    
    @IBAction func twitterButton(_ sender: Any) {
        if let url = URL(string: "https://www.twitter.com") {
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    }
    @IBAction func snapchatButton(_ sender: Any) {
        if let url = URL(string: "https://www.snapchat.com") {
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    }
}
    
