//
//  SecondViewController.swift
//  Pryaniky
//
//  Created by Mikhail Danilov on 30.09.2020.
//

import UIKit

class SecondViewController: UIViewController {
    
    var datum: Datum?
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = datum?.name
        textLabel.text = datum?.data?.text ?? "Segment"
    }
}
