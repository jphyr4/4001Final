//
//  GenreButtonScreen.swift
//  musicPlayer
//
//  Created by Jacob Paul Hassler on 7/26/18.
//  Copyright © 2018 jphyr4. All rights reserved.
//

import UIKit
import MediaPlayer

class GenreButtonScreen: UIViewController {
    
    var musicPLayer = MPMusicPlayerController.applicationMusicPlayer

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func genreButtonTapped(_ sender: UIButton) {
        MPMediaLibrary.requestAuthorization{ (status) in
            if status == .authorized {
                self.playGenre(genre: sender.currentTitle!)
            }
        }
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        
        musicPLayer.stop()
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        musicPLayer.skipToNextItem()
    }
    
    func playGenre(genre: String) {
        musicPLayer.stop()
        
        let query = MPMediaQuery()
        
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty:MPMediaItemPropertyGenre)
        
        
        query.addFilterPredicate(predicate)
        
        musicPLayer.setQueue(with: query)
        
        musicPLayer.shuffleMode = .songs
        musicPLayer.play()
    }
}
