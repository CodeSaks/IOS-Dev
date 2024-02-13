

import UIKit

struct BMI {
    
    var value : Float
    var advice : String
    var color : UIColor
    
    mutating func BMI(value: Float, advice: String, color: UIColor){
        self.value=value
        self.advice=advice
        self.color=color
    }
}
