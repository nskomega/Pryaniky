//
//  ViewController.swift
//  Pryaniky
//
//  Created by Mikhail Danilov on 29.09.2020.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController {
    
    @IBOutlet weak var tableViewData: UITableView!
    var purpleData: PurpleData?

    override func viewDidLoad() {
        super.viewDidLoad()
        DataLoaders().loadData { data in
            self.purpleData = data
            self.tableViewData.reloadData()
            
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            super.prepare(for: segue, sender: sender)
            if let controller = segue.destination as? SecondViewController, let datum = sender as? Datum {
                    controller.datum = datum
        }
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return purpleData?.view.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataCell") as! DataCell
        if let key = purpleData?.view[indexPath.row]{
            if let datum = purpleData?.key(key: key){
                switch key {
                case "hz":
                    cell.setupLabel(dataClass: datum.data)
                case "picture":
                    cell.setupImage(dataClass: datum.data)
                case "selector":
                    cell.setupSegment(dataClass: datum.data)
                default:
                    break
                }
            }
        }

        return cell
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let key = purpleData?.view[indexPath.row]{
            if let datum = purpleData?.key(key: key){
                performSegue(withIdentifier: "secondView", sender: datum)
            }
        }
    }
}
