//
//  ViewController.swift
//  demoApp
//
//  Created by abc on 10/12/20.
//  Copyright © 2020 abc. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    var results = [Result]()
    var mediaMetadata = [MediaMetadataDetails]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
    super.viewDidLoad()
        getTopStories()
    }
func getTopStories() {
    let jsonUrlString = "https://api.nytimes.com/svc/mostpopular/v2/viewed/1.json?api-key=#"
    guard let url = URL(string: jsonUrlString) else {return}

    URLSession.shared.dataTask(with: url) { (data, response, err) in

        guard let data = data, err == nil else {
            print(err!)
            return
        }

        do {
            let response = try JSONDecoder().decode(MostPopularResponse.self, from: data)
            //print(response.results.first?.title, response.results.first?.abstract)
            let result = response.results
            self.results = result
            for i in result{
                for j in i.media{
                    for k in j.mediaMetadata{
                        self.mediaMetadata.append(k)
                    }
                }
                
                DispatchQueue.main.async {
                self.tableView.reloadData()
                }
            }
       
        } catch let jsonErr {
            print("Error serializing JSON", jsonErr)
        }
    }.resume()
}

}

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let url1 = mediaMetadata
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! newTableViewCell
        cell.abstract.text = results[indexPath.row].title
        cell.byLine.text = results[indexPath.row].byline
        cell.publishedDate.text = results[indexPath.row].published_date
        
        if let url = URL(string: (url1[indexPath.row].url)){
           cell.imageUrl.kf.setImage(with: url)            
        }
        return cell
    }
    

}
