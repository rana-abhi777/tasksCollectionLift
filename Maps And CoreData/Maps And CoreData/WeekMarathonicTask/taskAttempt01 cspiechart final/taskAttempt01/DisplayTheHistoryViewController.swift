//
//  DisplayTheHistoryViewController.swift
//  taskAttempt01
//
//  Created by Sierra 4 on 16/02/17.
//  Copyright © 2017 code-brew. All rights reserved.
//

import UIKit
import GoogleMaps
import CSPieChart

class DisplayTheHistoryViewController: UIViewController, CSPieChartDataSource, CSPieChartDelegate {
    
    
    
    @IBOutlet weak var lblDistanceTotal: UILabel!   // distance total display label
    @IBOutlet weak var btnGoBack: UIButton!         // back navigation button
    @IBOutlet weak var pieChart: CSPieChart!        // piechart in the view
    
    var journeyTotal = [[CLLocationCoordinate2D]]() // array of array for journey wise points traversed by user
    var distanceJouney = [Double]()                 // array for different journeys
    var distanceTotal = Double()                    // contains total distance travelled
    
    var dataListJourney = [CSPieChartData]()
    
    //function to calculate the total journey: journey wise division
    func calculateDistanceTotal(journey: [CLLocationCoordinate2D]) -> Double {
        var distance = Double()
        var tempLatFirst = CLLocationDegrees()
        var tempLongFirst = CLLocationDegrees()
        var tempLatLast = CLLocationDegrees()
        var tempLongLast = CLLocationDegrees()
        for index in 0...(journey.count - 2) {
            tempLatFirst = journey[index].latitude
            tempLongFirst = journey[index].longitude
            tempLatLast = journey[index + 1].latitude
            tempLongLast = journey[index + 1].longitude
            let locationFirst = CLLocation(latitude: tempLatLast, longitude: tempLongLast)
            let locationLast = CLLocation(latitude: tempLatFirst, longitude: tempLongFirst)
            distance += locationLast.distance(from: locationFirst)
        }
    return distance
    }
    // function to divide the distance as per the journey
    func journeyDistanceDivision() {
        for journey in journeyTotal {
            distanceJouney.append(calculateDistanceTotal(journey: journey))
        }
    }
    // function to set the data values for the pie chart
    // which has key and value as pair in the CSPieChart
    func pieChartValues() {
        var index = 1
        for distance in distanceJouney {
            dataListJourney.append(CSPieChartData(key: "journey \(index)", value: distance))
            index += 1
            distanceTotal += distance
        }
    }
    var colorList: [UIColor] = [                            // color for the pie chart
        .red,
        .orange,
        .yellow,
        .green,
        .blue,
        .magenta
    ]
    var subViewList: [UIView] = []                         // subview list!!!!!
    func addLabel(viewText: String) {                      //genreic function to add labels to the pie chart slices
        let view = UILabel()
        view.text = "\(viewText)"
        view.textAlignment = .left
        view.font = UIFont.systemFont(ofSize: 12)
        view.sizeToFit()
        //addSubView(Subview: view)
        subViewList.append(view)
    }
    var index = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        //call to the functions for accessing the ditance per journey
        journeyDistanceDivision()
        pieChartValues()
        
        lblDistanceTotal.text = "\(Int(distanceTotal)) metres"
        

        pieChart?.dataSource = self
        pieChart?.delegate = self
        
        pieChart?.pieChartRadiusRate = 0.6
        pieChart?.pieChartLineLength = 10
        pieChart?.seletingAnimationType = .touch
        ///*
        for _ in journeyTotal {
            addLabel(viewText: "Journey\(index)")
            index += 1
        }
 //*/
        /*
        
        let view1 = UILabel()
        view1.text = "Journey 1"
        view1.textAlignment = .left
        view1.font = UIFont.systemFont(ofSize: 12)
        view1.sizeToFit()
        
        let view2 = UILabel()
        view2.text = "Journey 2"
        view2.textAlignment = .left
        view2.font = UIFont.systemFont(ofSize: 12)
        view2.sizeToFit()
        
        let view3 = UILabel()
        view3.text = "Journey 3"
        view3.textAlignment = .left
        view3.font = UIFont.systemFont(ofSize: 12)
        view3.sizeToFit()
        
        let view4 = UILabel()
        view4.text = "Journey 4"
        view4.textAlignment = .left
        view4.font = UIFont.systemFont(ofSize: 12)
        view4.sizeToFit()
        
        let view5 = UILabel()
        view5.text = "Journey 5"
        view5.textAlignment = .left
        view5.font = UIFont.systemFont(ofSize: 12)
        view5.sizeToFit()
        
        let view6 = UILabel()
        view6.text = "Journey 6"
        view6.textAlignment = .left
        view6.font = UIFont.systemFont(ofSize: 12)
        view6.sizeToFit()
        
        subViewList.append(view1)
        subViewList.append(view2)
        subViewList.append(view3)
        subViewList.append(view4)
        subViewList.append(view5)
        subViewList.append(view6)
        */
        
    }
    
    func numberOfComponentData() -> Int {
        return dataListJourney.count
    }
    
    func pieChartComponentData(at index: Int) -> CSPieChartData {
        return dataListJourney[index]
    }
    
    func numberOfComponentColors() -> Int {
        return colorList.count
    }
    
    func pieChartComponentColor(at index: Int) -> UIColor {
        return colorList[index]
    }
    
    func numberOfLineColors() -> Int {
        return colorList.count
    }
    
    func pieChartLineColor(at index: Int) -> UIColor {
        return colorList[index]
    }
    
    func numberOfComponentSubViews() -> Int {
        return subViewList.count
    }
    
    func pieChartComponentSubView(at index: Int) -> UIView {
        return subViewList[index]
    }
    
    func didSelectedPieChartComponent(at index: Int) {
        let data = dataListJourney[index]
        print("For \(data.key) distance travelled is \(Int(data.value))metres")
    }
    @IBAction func btnGoBackClick(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
}
