//
//  EmotionViewController.swift
//  reflection
//
//  Created by Meg on 5/28/18.
//  Copyright © 2018 meggrasse. All rights reserved.
//

import UIKit

class EmotionViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var currentEmotionTextField: UITextField!
    
    let emotionDict = [
        Emotion.happy : ["Excited", "Playful", "Confident", "Peaceful", "Energetic"],
        Emotion.sad : ["Lonely", "Ashamed", "Discouraged", "Hurt", "Inferior"],
        Emotion.angry : ["Irritated", "Offended", "Frustrated", "Aggressive", "Resentful"],
        Emotion.fear : ["Anxious", "Alienated", "Unsure", "Insecure", "Frightened"],
        Emotion.neutral : ["Content", "Bored", "Apathetic", "Indifferent", "Ambivalent"]
    ]
    
    var selectedEmotion : Emotion = Emotion.notset
    var entry : String = ""
 
    override func viewDidLoad() {
        super.viewDidLoad()

        let emotionButtons = [button1, button2, button3, button4, button5]
        
        if let emotions = emotionDict[selectedEmotion] {
            populateButtonText(emotions, emotionButtons)
        }
        
        currentEmotionTextField.delegate = self
        currentEmotionTextField.isUserInteractionEnabled = false
        currentEmotionTextField.clearsOnBeginEditing = true
        currentEmotionTextField.returnKeyType = UIReturnKeyType.done

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
    @IBAction func otherButtonTapped(_ sender: Any) {
        currentEmotionTextField.isUserInteractionEnabled = true
        currentEmotionTextField.becomeFirstResponder()
        if nextButton.titleLabel?.text == nil {
            nextButton.setTitle("⇨", for: UIControlState.normal)
        }
    }
    
    //not the best name since there is a side effect
    @IBAction func populateCurrentEmotionLabel(_ sender: Any) {
        currentEmotionTextField.isUserInteractionEnabled = false
        currentEmotionTextField.text = (sender as? UIButton)?.titleLabel?.text
        // 🤔
        if nextButton.titleLabel?.text == nil {
            nextButton.setTitle("⇨", for: UIControlState.normal)
        }
    }
    
    // MARK: - UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        currentEmotionTextField.resignFirstResponder()
        return true
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
