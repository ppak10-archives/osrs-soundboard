//
//  SoundPlaying.swift
//  OSRS Soundboard WatchKit Extension
//
//  Created by Peter Pak on 6/2/21.
//

import AVFoundation

protocol SoundPlaying: AnyObject {
    var audioPlayer: AVAudioPlayer? { get set }
}

extension SoundPlaying {
    func playSound(named name: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: "wav")
        else {
            fatalError("Unable to find sound file \(name).wav")
        }
        
        // Play through watch speaker.
        try? AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
        try? AVAudioSession.sharedInstance().setActive(true)
        
        try? audioPlayer = AVAudioPlayer(contentsOf: url)
        audioPlayer?.play()
    }
}
