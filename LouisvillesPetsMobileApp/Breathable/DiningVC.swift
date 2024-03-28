
import UIKit
import SafariServices

class FosterVC: UIViewController {

    // Initialize variable get response from server
    var returnStr:String = ""

    // Set IP address used to connect to the server
    var ip_address:String = "10.46.68.171"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.getInfo(value2: "get")
    }
    
    // Starts asyncrhonous request to server to get pet information
    func getInfo(value2: String) {
            sendRequestToServer(parameters: value2) {
                (returnval, error) in
                if (returnval)!
                {
                    // Wait for response from server before updating imageView and label
                    DispatchQueue.main.async {[self] in
                        self.descriptionLabel.text = self.returnStr.components(separatedBy: "θ")[1]
                        if (Int(self.returnStr.components(separatedBy:"θ")[2])) == 5 {
                            self.buttonLabel2.text = "Start Over"
                        } else {
                            self.buttonLabel2.text = "Next (" + String(self.returnStr.components(separatedBy: "θ")[2]) + "/5)"
                        }
                        
                        self.nameLabel.text = self.returnStr.components(separatedBy: "θ")[3]
                        let newImageData = Data(base64Encoded: self.returnStr.components(separatedBy: "θ")[0])
                        image.image = UIImage(data: newImageData!)
                        
                    }
                } else {
                    print(error)
                }
            }
            DispatchQueue.main.async { // Correct
            }
        }
        
        // Sends HTTP request to the server
        func sendRequestToServer(parameters: String, CompletionHandler: @escaping (Bool?, Error?) -> Void){
            let json = [parameters]
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
                
                
                let url = NSURL(string: "http://" + ip_address + ":5000/attractions")!
                let request = NSMutableURLRequest(url: url as URL)
                request.httpMethod = "Get"
                
                request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
                
                // Send HTTP request to the server
                let task = URLSession.shared.dataTask(with: request as URLRequest){ [self] data, response, error in
                    if let returned = String(data: data!, encoding: .utf8) {
                        print(returned)
                        self.returnStr = returned
                        
                        CompletionHandler(true,nil)
                    } else {
                    }
                }
                task.resume()
            } catch {
                print(error)
            }
        }
    

   
    @IBOutlet weak var buttonLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var picker1: UISegmentedControl!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var picker3: UISegmentedControl!
    @IBOutlet weak var dietPicker: UISegmentedControl!
    @IBOutlet weak var moneyLabel: UILabel!
    
    @IBOutlet weak var scrollerValue: UISlider!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBAction func scroll(_ sender: Any) {
        self.moneyLabel.text = "$" + String(Int(scrollerValue.value))
    }
    @IBOutlet weak var disclaimerLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var buttonLabel2: UILabel!
    @IBOutlet weak var directionsButton: UIButton!
    @IBAction func nextButton(_ sender: Any) {
        label1.isHidden=true
        dietPicker.isHidden=true
        label2.isHidden=true
        label3.isHidden=true
        label4.isHidden=true
        picker1.isHidden=true
        picker3.isHidden=true
        moneyLabel.isHidden=true
        scrollerValue.isHidden=true
        image.isHidden=false
        descriptionLabel.isHidden=false
        infoButton.isHidden=false
        directionsButton.isHidden=false
        titleLabel.text = "Recommended Dining"
        disclaimerLabel.text = ("Each recommendation is unique and newly generated on every click using backend machine learning analysis.")
        buttonLabel.isHidden=true
        buttonLabel2.isHidden=false
        nameLabel.isHidden=false
        getInfo(value2: "get")
    }
    
    @IBAction func getDirections(_ sender: Any) {
        let address = "1 Six Flags Blvd, Jackson Township, NJ 08527"
        if let encodedAddress = address.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
           let url = URL(string: "https://maps.apple.com/?address=93%20Summit%20Ave,%20Neptune%20City,%20NJ%2007753,%20United%20States&auid=7715466794191038870&ll=40.199032,-74.029006&lsp=9902&q=Pete%20%26%20Elda's%20Bar%20/%20Carmen's%20Pizzeria") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }

    @IBAction func getInfo(_ sender: Any) {
            if let url = URL(string: "https://peteandeldas.com/") {
            let vc = SFSafariViewController(url: url)
            present(vc, animated: true)
        }
    }
    

}
