//
//  EmojiViewController.swift
//  reflection
//
//  Created by Meg on 5/28/18.
//  Copyright © 2018 meggrasse. All rights reserved.
//

import UIKit

class EmojiViewController: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    
    var selectedEmotion : Emotion = Emotion.notset
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImage.image = #imageLiteral(resourceName: "background")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func angryTapped(_ sender: Any) {
        selectedEmotion = Emotion.angry
    }
    
    @IBAction func sadTapped(_ sender: Any) {
        selectedEmotion = Emotion.sad
    }
    
    @IBAction func neutralTapped(_ sender: Any) {
        selectedEmotion = Emotion.neutral
    }
    
    @IBAction func fearTapped(_ sender: Any) {
        selectedEmotion = Emotion.fear
    }
    
    @IBAction func happyTapped(_ sender: Any) {
        selectedEmotion = Emotion.happy
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? EmotionViewController {
            viewController.selectedEmotion = selectedEmotion
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
