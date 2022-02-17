//
//  MapViewController+CLLocationManager.swift
//  OnTime
//
//  Created by Igor Manakov on 17.02.2022.
//

import CoreLocation
import MapKit

//extension MapViewController: CLLocationManagerDelegate {
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let location = locations.first {
//            let latitude = location.coordinate.latitude
//            let longitude = location.coordinate.longitude
//            print(latitude, longitude)
//            manager.stopUpdatingLocation()
//            
//            render(location)
//        }
//    }
//    
//    func render(_ location: CLLocation) {
//        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
//        
//        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
//        
//        let region = MKCoordinateRegion(center: coordinate, span: span)
//        
//        mapView.setRegion(region, animated: true)
//    }
//    
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        print(error)
//    }
//    
//    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
//        switch manager.authorizationStatus {
//        case .authorizedAlways:
//            break
//        case .authorizedWhenInUse:
//            break
//        case .denied:
//            break
//        case .notDetermined:
//            break
//        case .restricted:
//            break
//        @unknown default:
//            print("Other Satus")
//        }
//    }
//    
//}
