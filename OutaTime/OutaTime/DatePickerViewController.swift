//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Dahna on 3/25/20.
//  Copyright © 2020 Dahna Buenrostro. All rights reserved.
//

import UIKit

protocol DatePickerDelgate {
    func destinationDateWasChosen(destinationDate: Date)
    
}

class DatePickerViewController: UIViewController {
     
    var dateDelegate: DatePickerDelgate?

    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        dateDelegate?.destinationDateWasChosen(destinationDate: datePicker.date)
        dismiss(animated: true, completion: nil)
    }
    
    
   

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

}
