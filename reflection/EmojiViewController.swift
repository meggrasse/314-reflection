//
//  EmojiViewController.swift
//  reflection
//
//  Created by Meg on 5/28/18.
//  Copyright © 2018 meggrasse. All rights reserved.
//

import UIKit

class EmojiViewController: UIViewController {
    
    var selectedEmotion : Emotion = Emotion.notset
    var destinationBackgroundColor : UIColor = UIColor.white
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func angryTapped(_ sender: Any) {
        selectedEmotion = Emotion.angry
        destinationBackgroundColor = UIColor.init(red: 255 / 255.0 , green: 118 / 255.0, blue: 117 / 255.0, alpha: 1)
    }

    // TODO: figure out why never called
    @IBAction func sadTapped(_ sender: Any) {
        selectedEmotion = Emotion.sad
        destinationBackgroundColor = UIColor.init(red: 116 / 255.0, green: 185 / 255.0, blue: 255 / 255.0, alpha: 1)
    }
    
    @IBAction func neutralTapped(_ sender: Any) {
        selectedEmotion = Emotion.neutral
        destinationBackgroundColor = UIColor.init(red: 181 / 255.0, green: 181 / 255.0, blue: 181 / 255.0, alpha: 1)
    }
    
    @IBAction func fearTapped(_ sender: Any) {
        selectedEmotion = Emotion.fear
        destinationBackgroundColor = UIColor.init(red: 162 / 255.0, green: 155 / 255.0, blue: 254 / 255.0, alpha: 1)
    }
    
    @IBAction func happyTapped(_ sender: Any) {
        selectedEmotion = Emotion.happy
        destinationBackgroundColor = UIColor.init(red: 253 / 255.0, green: 203 / 255.0, blue: 110 / 255.0, alpha: 1)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? EmotionViewController {
            viewController.selectedEmotion = selectedEmotion
            viewController.view.backgroundColor = destinationBackgroundColor
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
