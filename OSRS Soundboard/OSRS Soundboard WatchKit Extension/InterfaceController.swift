//
//  InterfaceController.swift
//  OSRS Soundboard WatchKit Extension
//
//  Created by Peter Pak on 6/2/21.
//

import WatchKit
import AVFoundation


class InterfaceController: WKInterfaceController, SoundPlaying {
    var audioPlayer: AVAudioPlayer?
    
    let sounds = Bundle.main.urls(forResourcesWithExtension: "wav", subdirectory: nil)?.map({
        $0.deletingPathExtension().lastPathComponent
    }) ?? []
    
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }

    @IBAction func playRandomSound() {
        guard let filename = sounds.randomElement()
        else {
            fatalError("Invalid filename")
        }
        playSound(named: filename)
    }
}
