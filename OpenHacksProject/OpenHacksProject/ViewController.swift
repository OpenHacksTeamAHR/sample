//
//  ViewController.swift
//  OpenHacksProject
//
//  Created by Rahul Rao on 5/23/20.
//  Copyright © 2020 OpenHacks Project. All rights reserved.
//

import CoreLocation
import Foundation
import UIKit
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

    class ViewController: UIViewController {
        
        var db: Firestore!
        
        @IBOutlet weak var backgroundGradientView: UIView!
        
        
        
        var locationManager = CLLocationManager()
        override func viewDidLoad() {
           super.viewDidLoad()

           // [START setup]
           let settings = FirestoreSettings()

           Firestore.firestore().settings = settings
           db = Firestore.firestore()
           // [END setup]
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
        
        @IBAction func didTouchSmokeTestButton(_ sender: AnyObject) {
            // Quickstar
            addLoc()
            getCollection()
            
        }
        
        private func addLoc(){
            let locationManager = CLLocationManager()
            super.viewDidLoad()
            locationManager.requestAlwaysAuthorization()
            var currentLoc: CLLocation!
            if(CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == .authorizedAlways) {
               currentLoc = locationManager.location
               print(currentLoc.coordinate.latitude)
               print(currentLoc.coordinate.longitude)
            }
             var ref: DocumentReference? = nil
             ref = db.collection("users").addDocument(data: [
                 "location": [currentLoc.coordinate.latitude, currentLoc.coordinate.longitude],
             ]) { err in
                 if let err = err {
                     print("Error adding document: \(err)")
                 } else {
                     print("Document added with ID: \(ref!.documentID)")
                 }
             }
        }
        
        private func getCollection() {
            // [START get_collection]
            db.collection("users").getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                    }
                }
            }
            // [END get_collection]
        }
        
       // private func checkvi(){
            
       // }
        
        func vibrateTime(dist: Float) -> Float {
            if (dist>=12){
                return 0
            }
            return Float(pow(Double(1.2),Double(dist)))/6
        }

        func distBetween(xone:Float, yone:Float, xtwo:Float, ytwo:Float) -> Float{
            return sqrtf((yone-ytwo)*(yone-ytwo)-(xone-xtwo)*(xone-xtwo))
        }
        
        override var shouldAutorotate: Bool {
            return false
        }
        
 
}

