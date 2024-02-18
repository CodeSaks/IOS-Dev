
import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
//        titleLabel.text = ""
//        var charIndex = 0.0
//        let titleText = "⚡️FlashChat"
//        
//        
//        for letter in titleText{
//            
//            print(letter)
//            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { (timer) in
//                self.titleLabel.text?.append(letter)
//            }
//            print(titleLabel.text!)
//            charIndex += 1
//        }
//        
//        print(titleLabel.text!)
        
        if #available(iOS 13.0, *) {
                let appearance = UINavigationBarAppearance()
                appearance.configureWithDefaultBackground()
            appearance.backgroundColor = UIColor(named: Constants.BrandColors.blue)

                navigationController?.navigationBar.standardAppearance = appearance
                navigationController?.navigationBar.scrollEdgeAppearance = appearance
                //navigationController?.navigationBar.compactAppearance = appearance
                
            } else {
                // Fallback on earlier versions
                navigationController?.navigationBar.barTintColor = UIColor(named: Constants.BrandColors.blue)
            }
        
        navigationController?.navigationBar.barTintColor = UIColor(named: Constants.BrandColors.blue)
        titleLabel.text = Constants.appName
       
    }
    

}
