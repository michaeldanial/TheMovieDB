
import UIKit
import Alamofire
import AlamofireImage
import AlamofireObjectMapper
import ObjectMapper
import SDLoader

class ViewController: UIViewController {
    
    var movies:[MovieDTO] = []
    let url = URL(string: "https://image.tmdb.org/t/p/w500/")!
    var page = 1
    
    @IBOutlet weak var MoviesCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        let sdLoader = SDLoader()
        sdLoader.startAnimating(atView: self.view)
        let baseURL = "https://api.themoviedb.org/3"
        let funcName = "/discover/movie"
        let method: HTTPMethod = .get
        let apiKey = "ceb888b71023afda704f84975d2642b5"
       
        
        
        let completeURl = "\(baseURL)\(funcName)?api_key=\(apiKey)&page=\(page)"
        
        WebService.request(completeURl: completeURl, method: method, params: nil, headers: nil, onSucces: {
            (result: DiscoverMovieResultsDTO) in
            
            self.movies = result.movies ?? []
            self.MoviesCV.reloadData()
            sdLoader.stopAnimation()
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! FilmDetail
        dest.id = (sender as! Int)
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        if page == 1000 {
            page = 1000
        } else{
            page = page + 1
        }
        let sdLoader = SDLoader()
        sdLoader.startAnimating(atView: self.view)
        let baseURL = "https://api.themoviedb.org/3"
        let funcName = "/discover/movie"
        let method: HTTPMethod = .get
        let apiKey = "ceb888b71023afda704f84975d2642b5"
        
        let completeURl = "\(baseURL)\(funcName)?api_key=\(apiKey)&page=\(page)"
        
        WebService.request(completeURl: completeURl, method: method, params: nil, headers: nil, onSucces: {
            (result: DiscoverMovieResultsDTO) in
            
            self.movies = result.movies ?? []
            self.MoviesCV.reloadData()
            sdLoader.stopAnimation()
        })
    }
    
    @IBAction func previousBtn(_ sender: Any) {
        if page == 1 {
            page = 1
        } else{
            page = page - 1
        }
        let sdLoader = SDLoader()
        sdLoader.startAnimating(atView: self.view)
        let baseURL = "https://api.themoviedb.org/3"
        let funcName = "/discover/movie"
        let method: HTTPMethod = .get
        let apiKey = "ceb888b71023afda704f84975d2642b5"
        
        let completeURl = "\(baseURL)\(funcName)?api_key=\(apiKey)&page=\(page)"
        
        WebService.request(completeURl: completeURl, method: method, params: nil, headers: nil, onSucces: {
            (result: DiscoverMovieResultsDTO) in
            
            self.movies = result.movies ?? []
            self.MoviesCV.reloadData()
            sdLoader.stopAnimation()
        })
        
    }
}


extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filmMainCell", for: indexPath) as! FilmMainCell
        cell.titleLbl.text = movies[indexPath.row].title
        cell.productionYearLbl.text = movies[indexPath.row].productionYear?.components(separatedBy: "-").first
        cell.rateLbl.text = "\(movies[indexPath.row].rate ?? 0.0)"
        let imageurl = URL(string: "\(url)\(movies[indexPath.row].imagePath ?? "")")
        cell.filmImageIV.af_setImage(withURL: imageurl!)
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if movies[indexPath.row].id != nil{
            print("selected Movie id: \(movies[indexPath.row].id!)")
            performSegue(withIdentifier: "filmDetails", sender: movies[indexPath.row].id)
        }
    }
}

























////
////  ViewController.swift
////  Web Service
////
////  Created by Omara on 30.10.18.
////  Copyright © 2018 Mahmoud Omara. All rights reserved.
////
//
//import UIKit
//import Alamofire
//import AlamofireImage
//
//class ViewController: UIViewController {
//
//    var movies:[MovieModel] = []
//    @IBOutlet weak var moviesTV: UITableView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view, typically from a nib.
//
//        let baseURL = "https://api.themoviedb.org/3"
//        let funcName = "/discover/movie"
//        let method: HTTPMethod = .get
//        let apiKey = "ceb888b71023afda704f84975d2642b5"
//        let page = 1
//
//        let completeURl = "\(baseURL)\(funcName)?api_key=\(apiKey)&page=\(page)"
//
//        Alamofire.request(completeURl, method: method, parameters: nil, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { (res) in
//            if res.result.isSuccess {
//
//                if let resultDict = res.result.value as? [String:Any] {
//                    if let moviesArr = resultDict["results"] as? [[String:Any]] {
//                        for movie in moviesArr {
//                            if let title = movie["title"] as? String,
//                            let imagePath = movie["poster_path"] as? String,
//                            let rate = movie["vote_average"] as? Double,
//                                let productionDate = movie["release_date"] as? String {
//                                let productionYear = productionDate.components(separatedBy: "-").first!
//                                self.movies.append(MovieModel(title: title, imagePath: imagePath, productionYear: productionYear, rate: rate))
//                            }
//                        }
//                        self.moviesTV.reloadData()
//                    }
//                }
//
//            } else {
//                print("Sorry")
//            }
//        }
//    }
//
//
//}
//
//extension ViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return movies.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
//        cell.textLabel?.text = movies[indexPath.row].title
//        return cell
//    }
//
//
//
//}
//


