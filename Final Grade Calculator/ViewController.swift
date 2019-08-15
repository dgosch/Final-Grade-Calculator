//
//  ViewController.swift
//  Final Grade Calculator
//
//  Created by Gosch, Daniel on 6/24/19.
//  Copyright © 2019 Daniel Gosch. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var currentGradeTextField: UITextField!
    @IBOutlet weak var examWorthTextField: UITextField!
    @IBOutlet weak var finalGradeLabel: UILabel!
    @IBOutlet weak var gradeWantedLabel: UILabel!
    @IBOutlet weak var gradeWantedSlider: UISlider!
    @IBOutlet weak var gradeWantedTextField: UITextField!
    @IBOutlet weak var letterWantTextField: UITextField!
    @IBOutlet weak var letterGetTextField: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    //THIS IS THE DIVIDE
    //THIS IS THE DIVIDE
    //THIS IS THE DIVIDE
    
    
    @IBAction func sliderValueChanged(_ sender: UISlider)
    {
        gradeWantedTextField.text = String(format: "%.0f", gradeWantedSlider.value)
        
        //make slider value variable
        var sliderValue = Int(gradeWantedSlider.value)
        
        //display slider value as letter grade
        if sliderValue >= 90
        {
            letterWantTextField.text = String("A")
        }
        else if sliderValue >= 80
        {
            letterWantTextField.text = String("B")
        }
        else if sliderValue >= 70
        {
            letterWantTextField.text = String("C")
        }
        else if sliderValue >= 60
        {
            letterWantTextField.text = String("D")
        }
    
        
        
        //grab current grade
        var currentGrade = Double(currentGradeTextField.text!) ?? 0
        
        
        //grab percent exam worth
        var examWorth = Double(examWorthTextField.text!) ?? 0
        var examWorthDec = examWorth/100
        
        //grab grade I want from slider
        var gradeWanted = Double(gradeWantedSlider.value)
    
        //calculate weight of current grade (1- exam grade)
        var currentGradeWeight = (1 - examWorthDec)
        
        //create variable for current grade times its weight
        var weightedCurrent = currentGrade * currentGradeWeight
        
        //subtract weighted current grade from the grade wanted
        var examWeighted = gradeWanted - weightedCurrent
        
        //divide examWeighted by examWorthDec
        var examGradeNeeded = examWeighted / examWorthDec
        
        
        //display the calculation
        var resultsString = String(format: "%.2f", examGradeNeeded)
        finalGradeLabel.text = "You need to get \(resultsString)% on the final"
    
        if currentGradeTextField.text == "" || examWorthTextField.text == ""
        {
        finalGradeLabel.text = "Fill in the numbers at the top"
        }
        
        
        
        var letterNeeded = 0
        var letterGradeWanted: Double
        var letterExamWeighted = 0.0
        var letterExamGradeNeeded = Double(0)
        
        letterGradeWanted = 100
        
        //0=F
        //1=D
        //2=C
        //3=B
        //4=A

        if sliderValue < 70
        {
            letterGradeWanted = 60
        }
        else if sliderValue < 80
        {
            letterGradeWanted = 70
        }
        else if sliderValue < 90
        {
            letterGradeWanted = 80
        }
        else if sliderValue < 1000
        {
            letterGradeWanted = 90
        }
        
        letterExamWeighted = letterGradeWanted - weightedCurrent
        
        letterExamGradeNeeded = letterExamWeighted / examWorthDec
        
        
        
        
        if letterExamGradeNeeded < 60
        {
            letterGetTextField.text = String("F")
        }
        else if letterExamGradeNeeded < 70
        {
            letterGetTextField.text = String("D")
        }
        else if letterExamGradeNeeded < 80
        {
            letterGetTextField.text = String("C")
        }
        else if letterExamGradeNeeded < 90
        {
            letterGetTextField.text = String("B")
        }
        else if letterExamGradeNeeded < 100
        {
            letterGetTextField.text = String("A")
        }
        else if letterExamGradeNeeded < 1000
        {
            letterGetTextField.text = String("EC")
        }
    }
    
}

