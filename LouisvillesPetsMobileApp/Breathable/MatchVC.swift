
import UIKit

class MatchVC: UIViewController {
    
    // Initialize variable get response from server
    var returnStr:String = ""

    // Set IP address used to connect to the server
    var ip_address:String = "172.20.10.2"

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
                    DispatchQueue.main.async {
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
                
                
                let url = NSURL(string: "http://" + ip_address + ":5000/match?petType=" + String(petTypeSelector.selectedSegmentIndex) + "&time=" + String(freeTimeSelector.selectedSegmentIndex) + "&energy=" + String(energySelector.selectedSegmentIndex) + "&experience=" + String(experienceSelector.selectedSegmentIndex))!
                
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

    @IBAction func meetMatchesButton(_ sender: Any) {
        sendAnswers(value2: "send")
        
        self.tabBarController?.selectedIndex = 2
        }
    
    
    @IBOutlet weak var meetButtonLabel: UILabel!
    @IBOutlet weak var meetButton: UIButton!
    @IBOutlet weak var petTypeSelector: UISegmentedControl!
    @IBOutlet weak var freeTimeSelector: UISegmentedControl!
    @IBOutlet weak var energySelector: UISegmentedControl!
    @IBOutlet weak var experienceSelector: UISegmentedControl!
    
}
