
import UIKit
import SafariServices

class MatchVC: UIViewController {
    
    // Initialize variable get response from server
    var returnStr:String = ""
    
    // Set IP address used to connect to the server
    var ip_address:String = "10.46.68.171"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    // Starts asyncrhonous request to server with answers
    func sendAnswers(value2: String) {
        sendRequestToServer(parameters: value2) {
            (returnval, error) in
            if (returnval)!
            {
                // Wait for response from server before updating imageView and label
                DispatchQueue.main.async {[self] in
                    self.descriptionLabel.text = self.returnStr.components(separatedBy: "θ")[1]
                    
                    if (Int(self.returnStr.components(separatedBy:"θ")[2])) == 10 {
                        self.meetButtonLabel2.text = "Start Over"
                    } else {
                        self.meetButtonLabel2.text = "Next (" + String(self.returnStr.components(separatedBy: "θ")[2]) + "/10)"
                    }
                    
                    self.nameLabel.text = self.returnStr.components(separatedBy: "θ")[3]
                    let newImageData = Data(base64Encoded: self.returnStr.components(separatedBy: "θ")[0])
                    print(self.returnStr.components(separatedBy: "θ")[0])
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
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var meetButtonLabel2: UILabel!
    @IBAction func meetMatchesButton(_ sender: Any) {
        label1.isHidden = true
        label2.isHidden = true
        label3.isHidden = true
        label4.isHidden = true
        petTypeSelector.isHidden = true
        freeTimeSelector.isHidden = true
        energySelector.isHidden = true
        experienceSelector.isHidden = true
        meetButtonLabel.isHidden=true
        meetButtonLabel2.isHidden=false
        activitiesLabel.text = "Recommended Activities"
        responsesLabel.text = ("Each recommendation is unique and newly generated on every click using backend machine learning analysis.")
        directionsLabel.isHidden = false
        directionsButton.isHidden = false
        infoLabel.isHidden = false
        infoButton.isHidden = false
        image.isHidden = false
        descriptionLabel.isHidden = false
        nameLabel.isHidden=false
        sendAnswers(value2: "send")
        
        //self.tabBarController?.selectedIndex = 2
    }
    
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var activitiesLabel: UILabel!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var responsesLabel: UILabel!
    @IBOutlet weak var meetButtonLabel: UILabel!
    @IBOutlet weak var directionsLabel: UILabel!
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var directionsButton: UIButton!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var meetButton: UIButton!
    @IBOutlet weak var petTypeSelector: UISegmentedControl!
    @IBOutlet weak var freeTimeSelector: UISegmentedControl!
    @IBOutlet weak var energySelector: UISegmentedControl!
    @IBOutlet weak var experienceSelector: UISegmentedControl!
    
    @IBAction func getDirections(_ sender: Any) {
        let address = "1 Six Flags Blvd, Jackson Township, NJ 08527"
        if let encodedAddress = address.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
           let url = URL(string: "https://maps.apple.com/?address=1%20Six%20Flags%20Blvd,%20Jackson,%20NJ%2008527,%20United%20States&auid=12956238510625474881&ll=40.137744,-74.440495&lsp=9902&q=Six%20Flags%20Great%20Adventure") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }

    @IBAction func getInfo(_ sender: Any) {
            if let url = URL(string: "https://www.sixflags.com/greatadventure?utm_campaign=SFGAD_2024&utm_medium=cpc&utm_source=google&utm_content=consumer&gad_source=1&gclid=Cj0KCQjwwYSwBhDcARIsAOyL0fi3jKXRAr9VbWVXTcUxaPShJXDCFXeaS9t4B2ohdSx9kJerhrirMm4aAlKKEALw_wcB") {
            let vc = SFSafariViewController(url: url)
            present(vc, animated: true)
        }
    }
}
