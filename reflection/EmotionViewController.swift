//
//  EmotionViewController.swift
//  reflection
//
//  Created by Meg on 5/28/18.
//  Copyright © 2018 meggrasse. All rights reserved.
//

import UIKit

class EmotionViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    
    @IBOutlet weak var currentEmotionLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    let emotionDict = [
        Emotion.happy : ["Excited", "Playful", "Confident", "Peaceful", "Energetic"],
        Emotion.sad : ["Lonely", "Ashamed", "Discouraged", "Hurt", "Inferior"],
        Emotion.angry : ["Irritated", "Offended", "Frustrated", "Aggressive", "Resentful"],
        Emotion.fear : ["Anxious", "Alienated", "Unsure", "Insecure", "Frightened"],
        Emotion.neutral : ["Empty", "Bored", "Apathetic", "Indifferent", "Ambivalent"]
    ]
    
    var selectedEmotion : Emotion = Emotion.notset
    var entry : String = ""
 
    override func viewDidLoad() {
        super.viewDidLoad()

        let emotionButtons = [button1, button2, button3, button4, button5]
        
        if let emotions = emotionDict[selectedEmotion] {
            populateButtonText(emotions, emotionButtons)
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func populateButtonText(_ emotions: [String], _ buttons: [UIButton?]) {
        for i in 0..<emotions.count {
            buttons[i]?.setTitle(emotions[i], for: UIControlState.normal)
        }
    }
    
    //not the best name since there is a side effect
    @IBAction func populateCurrentEmotionLabel(_ sender: Any) {
        currentEmotionLabel.text = (sender as? UIButton)?.titleLabel?.text
        // 🤔
        if nextButton.titleLabel?.text == nil {
            nextButton.setTitle("⇨", for: UIControlState.normal)
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let viewController = segue.destination as? DiaryViewController {
            viewController.view.backgroundColor = self.view.backgroundColor
            viewController.entry = entry
        }
    }

}
