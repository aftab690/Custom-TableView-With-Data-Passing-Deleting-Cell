//
//  ViewController.swift
//  demo tblview swift copy
//
//  Created by aftab khan on 27/09/2025.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tblview: UITableView!
    var array1 = ["AAA", "BBB", "CCC", "DDD", "EEE", "FFF", "GGG", "HHH"]
    var array2 = ["aaa", "bbb", "ccc", "ddd", "eee", "fff", "ggg", "hhh"]
    var arrimg = [#imageLiteral(resourceName: "c5"), #imageLiteral(resourceName: "c6"),#imageLiteral(resourceName: "c7"), #imageLiteral(resourceName: "c4"),#imageLiteral(resourceName: "c8"), #imageLiteral(resourceName: "c2"),#imageLiteral(resourceName: "c3"), #imageLiteral(resourceName: "c1")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        array2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.lbl1.text = array1[indexPath.row]
        cell.lbl2.text = array2[indexPath.row]
        cell.img.image = arrimg[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // self.view.backgroundColor = UIColor.blue
        let detail:DetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detail.strlbl1 = array1[indexPath.row]
        detail.strlbl2 = array2[indexPath.row]
        detail.strimg = arrimg[indexPath.row]
        self.navigationController?.pushViewController(detail, animated: true)
        
        
    
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            array1.remove(at: indexPath.row)
            array2.remove(at: indexPath.row)
            arrimg.remove(at: indexPath.row)
            tblview.deleteRows(at: [indexPath], with: .fade)
        }
    }

}

