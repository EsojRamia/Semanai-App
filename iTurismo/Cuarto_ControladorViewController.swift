//
//  Cuarto_ControladorViewController.swift
//  iTurismo
//
//  Created by ITESM CAMPUS TAMPICO on 30/09/16.
//  Copyright © 2016 ITESM CAMPUS TAMPICO. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class Cuarto_ControladorViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var Mapa: MKMapView!
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        var location = CLLocationCoordinate2DMake(
            22.2163108,
            -97.8596762)
        
        var ann = MKPointAnnotation()
        ann.coordinate = (location)
        ann.title = "Catedral de Tampico"
        Mapa.addAnnotation(ann)
        
        var span = MKCoordinateSpanMake(0.2, 0.2)
        
        var region = MKCoordinateRegionMake(location, span)
        
        Mapa.setRegion(region, animated: true)
        
        if CLLocationManager.authorizationStatus() == .NotDetermined {
            CLLocationManager().requestWhenInUseAuthorization()
        }
        
        
        self.locationManager.delegate = self
        
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        self.locationManager.requestWhenInUseAuthorization()
        
        self.locationManager.startUpdatingLocation()
        
        self.Mapa.showsUserLocation = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        

        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let loc = locations.last
        
        let center = CLLocationCoordinate2D(latitude: loc!.coordinate.latitude, longitude: loc!.coordinate.longitude)
        
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
        
        self.Mapa.setRegion(region, animated: true)
        
    }
    
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Errors" + error.localizedDescription)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
