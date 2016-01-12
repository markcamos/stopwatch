//
//  ViewController.swift
//  Stopwatch
//
//  Created by Mark Amos on 1/9/16.
//  Copyright © 2016 Mark Amos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = NSTimer()
    
    var seconds:Int = 0
    var minutes:Int = 0
    var hours:Int = 0
    
    @IBOutlet weak var timerLabel: UILabel!
    
    func increaseTimer(){
        seconds++
        if seconds == 60 {
            minutes++
            seconds = 0
        }
        if minutes == 60 {
            hours++
            minutes = 0
        }
//        timerLabel.text = "\(hours):\(minutes):\(seconds)"
        timerLabel.text = String(format: "%0.2d:%0.2d:%0.2d", arguments: [hours, minutes, seconds])
    }
    
    @IBAction func play(sender: AnyObject) {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("increaseTimer"), userInfo: nil, repeats: true)
    }
    
    @IBAction func pause(sender: AnyObject) {
        timer.invalidate()
    }
    
    @IBAction func reset(sender: AnyObject) {
        timer.invalidate()
        seconds = 0
        minutes = 0
        hours = 0
        timerLabel.text = String(format: "%0.2d:%0.2d:%0.2d", arguments: [hours, minutes, seconds])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

