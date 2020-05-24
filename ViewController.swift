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
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift
import GoogleSignIn


    class ViewController: UIViewController {
        
        var db: Firestore!
        
        
        var locationManager = CLLocationManager()
        
        override func viewDidLoad() {
           super.viewDidLoad()
            
           // [START setup]
            let settings = FirestoreSettings()
            Firestore.firestore().settings = settings
            db = Firestore.firestore()
            GIDSignIn.sharedInstance()?.presentingViewController = self
            GIDSignIn.sharedInstance().signIn()
           // [END setup]
            getCollection()
            
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
        
        @IBAction func didTouchSmokeTestButton(_ sender: AnyObject) {
            // Quickstar
            writetoserv()
            getCollection()
            
        }
        private func setupCacheSize() {
            // [START fs_setup_cache]
            let settings = Firestore.firestore().settings
            settings.cacheSizeBytes = FirestoreCacheSizeUnlimited
            Firestore.firestore().settings = settings
            // [END fs_setup_cache]
        }
        
        private func writetoserv(){
            var ref: DocumentReference? = nil
            ref = db.collection("users").addDocument(data: [
                "lat": Loc().0,
                "long": Loc().1
            ]) { err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    print("Document added with ID: \(ref!.documentID)")
                }
            }
        }
        
        
        private func Loc() -> (CLLocationDegrees, CLLocationDegrees){
            let locationManager = CLLocationManager()
            //locationManager.requestWhenInUseAuthorization()
            //locationManager.requestAlwaysAuthorization()
            var currentLoc: CLLocation!
            if(CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == .authorizedAlways) {
               currentLoc = locationManager.location
                return (currentLoc.coordinate.latitude, currentLoc.coordinate.longitude)
            }
            else{
                return (0, 0)
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
            return
            // [END get_collection]
        }
        
       // private func checkvi(){
            
       // }
        
        private func vibrateTime(dist: Float) -> Float {
            if (dist>=12){
                return 0
            }
            return Float(pow(Double(1.2),Double(dist)))/6
        }

        private func distBetween(xone:Float, yone:Float, xtwo:Float, ytwo:Float) -> Float{
            return sqrtf((yone-ytwo)*(yone-ytwo)-(xone-xtwo)*(xone-xtwo))
        }
        
        override var shouldAutorotate: Bool {
            return false
        }
        
 
}
