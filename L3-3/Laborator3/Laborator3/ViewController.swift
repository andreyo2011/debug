//
//  ViewController.swift
//  Laborator3
//
//  Created by user216460 on 8/31/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        // Do any additional setup after loading the view.
    }
    
    private func configure(){
        title = "NasaNews"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(NasaNewsTableViewCell.self, forCellReuseIdentifier: NasaNewsTableViewCell.cellId)
    }
    
}

extension ViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NasaNewsTableViewCell.cellId, for: indexPath) as? NasaNewsTableViewCell else {return UITableViewCell()}
        
        let model = NasaNewsTableViewCellModel(title: "title", date: "date\(indexPath.row)")
        cell.setUp(with: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        2
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
    }
}































