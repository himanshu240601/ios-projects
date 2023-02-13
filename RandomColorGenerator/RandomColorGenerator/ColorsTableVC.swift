//
//  ColorsTableVC.swift
//  RandomColorGenerator
//
//  Created by Himanshu on 2/13/23.
//

import UIKit

class ColorsTableVC: UIViewController{
    
    var colorArr: [UIColor] = []
    
    enum Cells {
        static let colorCell = "ColorCell"
    }
    
    enum Segues {
        static let toDetailVC = "ToColorsDetailVC"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createRandomColors()
    }
    
    func createRandomColors(){
        for _ in 0..<50 {
            
            colorArr.append(.generateRandomColor())
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let desVC = segue.destination as! ColorsDetailVC
        desVC.color = sender as? UIColor
    }

}

extension ColorsTableVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.colorCell) else {
            return UITableViewCell()
        }
        
        cell.backgroundColor = colorArr[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorArr.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let color = colorArr[indexPath.row]
        performSegue(withIdentifier: Segues.toDetailVC, sender: color)
    }
}
