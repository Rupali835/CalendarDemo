//
//  ViewController.swift
//  CalendarDemo
//
//  Created by Rupali Patil on 16/05/22.
//

import UIKit
import FSCalendar


class demodata{
    var point : Int
    var date : String
    
    init(cPoint: Int, cdate: String){
        self.point = cPoint
        self.date = cdate
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var myCalendar: FSCalendar!
  
    var rangeCircle = Int()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myCalendar.dataSource = self
        myCalendar.delegate = self
        
        myCalendar.register(FSCalendarCell.self, forCellReuseIdentifier: "cell")
        
        let point = 1200
        let date = "10/05/22"
        
        
        let p2 = 2000
        let d2 = "15/05/22"
         
        
        
        
    }

    
    func configureCell(_ cell: FSCalendarCell?, for date: Date?, at position: FSCalendarMonthPosition) {
       
        }

}

extension ViewController: FSCalendarDelegate, FSCalendarDataSource,FSCalendarDelegateAppearance
{
    
    func calendar(_ calendar: FSCalendar,
                   appearance: FSCalendarAppearance,
                   titleDefaultColorFor date: Date
     ) -> UIColor? {

        print("dates = \(date)")
         /* if self.eventsDateArray.contains(date) {
               return Colors.white
               // Return UIColor for eventsDateArray
          }*/

        return UIColor.white // Return Default Title Color
    }
    
    func calendar(_ calendar: FSCalendar,
                appearance: FSCalendarAppearance,
                fillDefaultColorFor date: Date
    ) -> UIColor? {

//        if self.eventsDateArray.contains(date) {
//              return Colors.blue // Return UIColor for eventsDateArray
//          }


        return UIColor.red // Return Default UIColor
    }
    
    
    func calendar(_ calendar: FSCalendar, cellFor date: Date, at position: FSCalendarMonthPosition) -> FSCalendarCell {
        
        let cell = calendar.dequeueReusableCell(withIdentifier: "cell", for: date, at: position)
        cell.rangeValue = 1.2
    //    cell.shapeLayer.frame=
        return cell
    }

    /*
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(date)
    }
   */
    func calendar(_ calendar: FSCalendar, imageFor date: Date) -> UIImage?
    {
        return UIImage(named: "right")
    }
    
    func minimumDate(for calendar: FSCalendar) -> Date {
//           return Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        return dateFormatter.date(from: "2020/12/31") ?? Date()
    }

    //Set maximum Date
    func maximumDate(for calendar: FSCalendar) -> Date {
 
          let dateFormatter = DateFormatter()
          dateFormatter.dateFormat = "YYYY-MM-dd"
          return dateFormatter.date(from: "2030/12/31") ?? Date()
    }
  

    func calendar(_ calendar: FSCalendar, willDisplay cell: FSCalendarCell, for date: Date, at monthPosition: FSCalendarMonthPosition) {
           self.configureCell(cell, for: date, at: monthPosition)
       }
}
