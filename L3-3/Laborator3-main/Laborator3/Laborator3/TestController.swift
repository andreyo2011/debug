//
//  TestController.swift
//  Laborator3
//
//  Created by user216460 on 9/6/22.
//


import UIKit


/*struct NasaNewsModel: Decodable{
    var items: [Item] = []
}

struct Item: Decodable{
    //let id:Int
    let title: String
    let date: String
    let body: String
    
    //campurile trebuie sa se potriveasca cu json
    //Coding keys ptr a schimba
}*/
class TestController: UIViewController {
    
    
    private var model = NasaNewsModel()
    private let pageSize: Int = 5
    private var page: Int = 0
    
    //
    var item: Item?

    //@IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        requestItems()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loadItems(_ sender: Any) {
        print("merge")
        page += 1
        requestItems()
        
    }
    private func requestItems(){
        let pathString = "https://mars.nasa.gov/api/v1/news_items/?page=\(page)&per_page=\(pageSize)&order=publish_date+desc,created_at+desc"
        let url = URL(string: pathString)!
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            if let _ = error{
                //print("here::",error.localizedDescription)
                return
            }
            
            let jsonDecoder = JSONDecoder()
            guard let data = data else {return}
            guard let welf = self else {return}

            guard let items = try? jsonDecoder.decode(NasaNewsModel.self, from: data) else {return}
            welf.model.items.append(contentsOf: items.items) //sau self?. fara welf
            DispatchQueue.main.async {
                welf.tableView.reloadData() // sau self?. fara welf
                
            }
        
            //print(items)
  
        }
        task.resume()
    }
    
    private func configure(){
        
        guard let item = item else {
            return
        }
        print(item)
        title = "NasaNews"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(NasaNewsTableViewCell.self, forCellReuseIdentifier: NasaNewsTableViewCell.cellId)
    }
    
    private func navigate(item: Item){
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: "ArticleViewController")
        
        as? ArticleViewController else {return}
        viewController.item = item //inlocuiteste cele 2 de jos in urma modificarilor ArticleViewController
        //viewController.textView?.text = item.body
        //viewController.title = item.title
        print("MUIE")
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

extension TestController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NasaNewsTableViewCell.cellId, for: indexPath) as? NasaNewsTableViewCell else {return UITableViewCell()}
        
        //let model = NasaNewsTableViewCellModel(title: "title", date: "date\(indexPath.row)")
        let cellModel = model.items[indexPath.row]
        cell.setUp(with: cellModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        //2
        model.items.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
        let item = model.items[indexPath.row]
        navigate(item: item)
    }
}
