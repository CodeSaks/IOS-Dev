

import UIKit

struct CalculatorBrain {
    
    var bmiValue : BMI?
    
    mutating func calculateBMI(h: Float, w: Float){
        let bmi =  w / (h*h)
        
        if bmi < 18.5{
            bmiValue = BMI(value: bmi, advice: "Eat more Pies!", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        }
        else if bmi >= 18.5 && bmi < 24.9{
            bmiValue = BMI(value: bmi, advice: "Fit as a Fiddle!", color: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
        }
        else{
            bmiValue = BMI(value: bmi, advice: "Eat less Pies!", color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
        }
        
    }
    
    func getBMIValue() -> String{
        return String(format: "%.1f", bmiValue?.value ?? 0.0)
    }
    
    func getAdvice() -> String{
        return bmiValue?.advice ?? "No Result"
    }
    
    func getColor() -> UIColor{
        return bmiValue?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    
}
