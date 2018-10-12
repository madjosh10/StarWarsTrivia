//
//  FilmsVC.swift
//  StarWarsTrivia
//
//  Created by Joshua Madrigal on 10/10/18.
//  Copyright © 2018 Joshua Madrigal. All rights reserved.
//

import UIKit

class FilmsVC: UIViewController, PersonProtocol {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var episodeLbl: UILabel!
    @IBOutlet weak var directorLbl: UILabel!
    @IBOutlet weak var producerLbl: UILabel!
    @IBOutlet weak var releaseLbl: UILabel!
    @IBOutlet weak var crawlLbl: UITextView!
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var person: Person!
    let api = FilmAPI()
    var films = [String]()
    var currentFilm = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(person.name)
        films = person.filmUrls
        previousBtn.isEnabled = false
        nextBtn.isEnabled = films.count > 1
        guard let firstFilm = films.first else { return }
        getFilm(url: firstFilm)
        
    }
    
    func getFilm(url: String) {
        api.getFilm(url: url) { (film) in
            if let film = film {
                self.setUpView(film: film)
            }
        }
    }
    
    func setUpView(film: Film) {
        titleLbl.text = film.title
        episodeLbl.text = String(film.episode)
        directorLbl.text = film.director
        producerLbl.text = film.producer
        releaseLbl.text = film.releaseData
        let stripped = film.crawl.replacingOccurrences(of: "\n", with: " ")
        crawlLbl.text = stripped.replacingOccurrences(of: "\r", with: "")
    }
 
    
    @IBAction func previousClicked(_ sender: Any) {
        currentFilm -= 1
        setButtonState()
    }
    
    
    @IBAction func nextClicked(_ sender: Any) {
        currentFilm += 1
        setButtonState()
    }
    
    func setButtonState() {
        nextBtn.isEnabled = currentFilm == films.count - 1 ? false : true
        previousBtn.isEnabled = currentFilm == 0 ? false : true
        
        getFilm(url: films[currentFilm])
    }

} // end FilmsVC class
