

import UIKit
import SafariServices

class DonateVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBOutlet weak var paymentTypePicker: UISegmentedControl!
    @IBOutlet weak var paymentTimePicker: UIPickerView!
    @IBOutlet weak var moneySlider: UISlider!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBAction func moneyScroller(_ sender: UISlider) {
        self.moneyLabel.text = "$" + String(Int(moneySlider.value))
    }
    @IBAction func makePaymentButton(_ sender: Any) {
        if (paymentTypePicker.selectedSegmentIndex == 0){
            if let url = URL(string: "https://usa.visa.com/home2.html") {
            let vc = SFSafariViewController(url: url)
            present(vc, animated: true)
            }
        }
        if (paymentTypePicker.selectedSegmentIndex == 1){
            if let url = URL(string: "https://paypal.com/") {
            let vc = SFSafariViewController(url: url)
            present(vc, animated: true)
            }
        }
        if (paymentTypePicker.selectedSegmentIndex == 2){
            if let url = URL(string: "https://www.apple.com/apple-pay/") {
            let vc = SFSafariViewController(url: url)
            present(vc, animated: true)
            }
        }
}
}
