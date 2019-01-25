//
//  SerivceViewController.swift
//  PuService
//
//  Created by TST-APP-02 on 25/1/2562 BE.
//  Copyright © 2562 Nardanong.s. All rights reserved.
//

import UIKit

import MapKit



class SerivceViewController: UIViewController {
    
    @IBOutlet weak var myMapView: MKMapView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

//      showMap(lat: 13.607464, lng: 100.765487)
        showMapType2(lat: 13.607464, lng: 100.765487)
        
    }//Main Method
    
    func showMapType2(lat:Double,lng:Double) -> Void {
        
        let latitude:CLLocationDegrees = lat
        let longtitude:CLLocationDegrees = lng
        
        let laDelta: CLLocationDegrees = 0.01
        let lngDelta:  CLLocationDegrees = 0.01
        
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: laDelta, longitudeDelta: lngDelta)
        let company: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longtitude)
        let region:MKCoordinateRegion = MKCoordinateRegion(center: company, span: span)
        
        self.myMapView.setRegion(region, animated: true)
        
//        Company Anotation
        let companyAnotation = MKPointAnnotation()
        companyAnotation.coordinate = company
        companyAnotation.title = "Hitachi Transport System Vantec (Thailamnd), Ltd.,"
        companyAnotation.subtitle = "Company Hitachi Transport System Vantec (Thailamnd), Ltd.,"
        self.myMapView.addAnnotation(companyAnotation)
        
//        Bus Stop
        let latBus:CLLocationDegrees = 13.608640
        let longBus:CLLocationDegrees = 100.766738
        
        let busStopAnotatiopn = MKPointAnnotation()
        busStopAnotatiopn.coordinate = CLLocationCoordinate2D(latitude: latBus, longitude: longBus)
        busStopAnotatiopn.title = "Bus Stop"
        busStopAnotatiopn.subtitle = "Bus Stop Here..."
        self.myMapView.addAnnotation(busStopAnotatiopn)
        
    }
    
    func showMap(lat:Double,lng:Double) -> Void {
        let homeCoordinate = CLLocationCoordinate2DMake(lat, lng)
        let regionDistant: CLLocationDistance = 1000
        let regionSpan = MKCoordinateRegion.init(center: homeCoordinate, latitudinalMeters: regionDistant, longitudinalMeters: regionDistant)
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        let placemarker = MKPlacemark(coordinate: homeCoordinate)
        let mapItem = MKMapItem(placemark: placemarker)
        mapItem.name = "Hitachi Transport System Vantec (Thailand), Ltd.,"
        mapItem.openInMaps(launchOptions: options)
        
        
        
        
    }
    
}//Main Class
