//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Dahna on 3/25/20.
//  Copyright © 2020 Dahna Buenrostro. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var presentTimeText: UILabel!
    @IBOutlet weak var lastTimeText: UILabel!
    @IBOutlet weak var speedText: UILabel!
    
    
    
    @IBAction func setDestinationTimeTapped(_ sender: UIButton) {
    }
    
    @IBAction func travelBackButtonTapped(_ sender: UIButton) {
        func startTimer() {
        }
    }
    
    var currentSpeed = 0
    private var timer: Timer?
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateSpeed), userInfo: nil, repeats: true)
        
        if currentSpeed == 88 {
            resetTimer()
        }
        
    }
    
    
    
 
    @ objc func updateSpeed() {
       currentSpeed = 0
        
        if currentSpeed < 88 {
            currentSpeed += 1
            speedText.text = String(currentSpeed)
        
        } else if currentSpeed >= 88 {
            lastTimeText.text = presentTimeText.text
            presentTimeText.text = destinationLabel.text
            currentSpeed = 0
            showAlert()
        }
    }
    
    func resetTimer() {
        timer?.invalidate()
        timer = nil
       
    }
   
    private func showAlert() {
        let alert = UIAlertController(title: "Time Travel Successful", message: "Your new date is \(String(describing: presentTimeText.text))", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
        
    }
    
   var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
          
    
    
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentDate = Date()
        presentTimeText.text = dateFormatter.string(from: currentDate)
        
        speedText.text = "\(currentSpeed) MPH"
        
        destinationLabel.text = "--- -- ----"
        lastTimeText.text = "--- -- ----"
        
        // Do any additional setup after loading the view.
        
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue" {
          let vc = segue.destination as? DatePickerViewController
            vc?.dateDelegate = self
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    


}

extension TimeCircuitsViewController: DatePickerDelgate {
    func destinationDateWasChosen(destinationDate: Date) {
        destinationLabel.text = dateFormatter.string(from: destinationDate)
    }
    
    
}
