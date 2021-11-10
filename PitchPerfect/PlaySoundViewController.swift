//
//  PlaySoundViewController.swift
//  PitchPerfect
//
//  Created by Waged Baioumy on 06.11.21.
//

import UIKit
import AVFoundation

class PlaySoundViewController: UIViewController {

    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipMunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    
    var recordedAudioURL:URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!

    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }
    
    //MARK: function to enable all buttons after UI is ready.
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
    }
    
    //MARK: function to disable all buttons before UI is ready.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
    
    //MARK: function to execute each button by its unique tag id.
    @IBAction func playSoundForButton(_ sender: UIButton){
        print("play sound button pressed!")
        switch(ButtonType(rawValue: sender.tag)!){
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        configureUI(.playing)
    }
    
    //MARK: function to stop playing sound.
    @IBAction func stopButton(_ sender: AnyObject){
        print("Audio stopped!")
        stopAudio()
    }


}
