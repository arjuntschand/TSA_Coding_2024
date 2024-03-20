
import UIKit

class FosterVC: UIViewController {

    // Initialize variable get response from server
    var returnStr:String = ""

    // Set IP address used to connect to the server
    var ip_address:String = "172.20.10.2"
    
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
                        self.descriptionLabel.text = self.returnStr.components(separatedBy: ",")[0]
                        self.moreInfoLabel.text = ("Click here for more information on " + self.returnStr.components(separatedBy: ",")[1])
                        self.nextPetLabel.text = "Next Pet (" + String(self.returnStr.components(separatedBy: ",")[2]) + "/10)"
                        print(self.returnStr.components(separatedBy: ",")[2])
                        let newImageData = Data(base64Encoded: self.returnStr.components(separatedBy: ",")[3])
                        petImage.image = UIImage(data: newImageData!)
                        
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
                
                
                let url = NSURL(string: "http://" + ip_address + ":5000/foster")!
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
    

    @IBOutlet weak var nextPetLabel: UILabel!
    @IBOutlet weak var moreInfoLabel: UILabel!
    @IBOutlet weak var petImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var moreInfoButtonName: UIButton!
    @IBAction func moreInfoButton(_ sender: Any) {
    }
    @IBOutlet weak var nextPetButtonName: UIButton!
    @IBAction func nextPetButton(_ sender: Any) {
        getInfo(value2: "get")
    }
}
