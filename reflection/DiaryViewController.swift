//
//  DiaryViewController.swift
//  reflection
//
//  Created by Meg on 5/28/18.
//  Copyright © 2018 meggrasse. All rights reserved.
//

import UIKit

class DiaryViewController: UIViewController {
    
    @IBOutlet weak var entryBox: UITextView!
    
    var selectedEmotion : Emotion = Emotion.notset
    var entry : String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        entryBox.text = entry
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? EmojiViewController {
            viewController.entry = entryBox.text
        }
        if let viewController = segue.destination as? EmotionViewController {
            viewController.selectedEmotion = self.selectedEmotion
            viewController.view.backgroundColor = self.view.backgroundColor
            viewController.entry = entryBox.text
        }
    }

}
