//
//  MapViewController.swift
//  OnTime
//
//  Created by Igor Manakov on 15.02.2022.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    
    public var sharedConstraints = [NSLayoutConstraint]()
    
    let mapView: MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        
        return map
    }()
    
    let locationManager = CLLocationManager()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
        setupLocationManager()
        checkLocationServices()
//        LocationManager.shared.getUserLocation { [weak self] location in
//            DispatchQueue.main.async {
//                guard let strongSelf = self else {
//                    return
//                }
//                strongSelf.mapView.showsUserLocation = true
//                strongSelf.addMapPin(with: location)
//            }
//        }
    }
    
    override func viewDidLayoutSubviews() {
    }
    
    // MARK: - Setup
    
    func setupViews() {
        navigationController?.navigationBar.barStyle = .default
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "My map"
        view.addSubview(mapView)
    }
    
    func setConstraints() {
        sharedConstraints.append(contentsOf: [
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        NSLayoutConstraint.activate(sharedConstraints)
    }
    
    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    private func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            locationManagerDidChangeAuthorization(locationManager)
        }
        else {
            // Show alert letting the user to know they have to turn this one
        }
    }
    
    func addMapPin(with location: CLLocation) {
        let pin = MKPointAnnotation()
        pin.coordinate = location.coordinate
        
        mapView.setRegion(MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)), animated: true)
        mapView.addAnnotation(pin)
        LocationManager.shared.resolveLocationName(with: location) { [weak self] locationName in
            //self?.title = locationName
        }
    }
    
    
    
}
