//
//  ViewController.swift
//  SwiftCalculator
//
//  Created by Manjula Jonnalagadda on 6/9/14.
//  Copyright (c) 2014 Manjula Jonnalagadda. All rights reserved.
//

import UIKit

var op1:Double=0;
var op2:Double=0;
var op:String="";


class ViewController: UIViewController {
    
    
    @IBOutlet var displayLabel : UILabel
    
    @IBAction func numBtnTapped(sender : UIButton) {
        
        if sender.currentTitle=="0" && self.displayLabel.text=="0"{
            
            return;
            
        }
        if sender.currentTitle=="." && displayLabel.text.rangeOfString("."){
            
            return;
            
        }
        if self.displayLabel.text=="0"{
            displayLabel.text=sender.currentTitle
        }else{
            displayLabel.text=displayLabel.text+sender.currentTitle
            
        }
        
    }
    
    
    @IBAction func operatorTapped(sender : UIButton) {
        
        op=op+displayLabel.text+sender.currentTitle
        displayLabel.text="0"
        
        
    }
    
    @IBAction func calculate(sender : UIButton) {
        op=op+displayLabel.text
        NSLog("\(op)")
        let exp=NSExpression(format: op)
        var result : AnyObject!=exp.expressionValueWithObject(nil, context: nil)
        
        displayLabel.text="\(result)"
        
    }
    
    @IBAction func clear(sender : UIButton) {
        displayLabel.text="0"
        op=""
    }
    
    
    @IBAction func alternatePosNeg(sender : UIButton) {
        
        if displayLabel.text=="0"{
            
            return
        }
        
        if displayLabel.text.hasPrefix("-"){
            displayLabel.text=displayLabel.text.substringFromIndex(1)
        }else{
            displayLabel.text="-"+displayLabel.text
        }
        
    }
    
    @IBAction func percentage(sender : UIButton) {
        
        var dl:Double=displayLabel.text.bridgeToObjectiveC().doubleValue
        var res=dl/100;
        displayLabel.text="\(ress)"
        
    }
    /*
    @IBAction func add(sender : UIButton) {
        
        var op1:Double=self.op1TextField.text.bridgeToObjectiveC().doubleValue;
        var op2:Double=self.op2TextField.text.bridgeToObjectiveC().doubleValue;

        /*
        var op1:Int=self.op1TextField.text.toInt()!;
        var op2:Int=self.op2TextField.text.toInt()!;
*/
        var result=op1+op2;
        self.resultLabel.text="\(result)"
        
    }
*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

