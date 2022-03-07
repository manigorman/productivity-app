//
//  MapViewController.swift
//  OnTime
//
//  Created by Igor Manakov on 15.02.2022.
//

import UIKit
import MapKit
import CoreLocation
import AudioToolbox

class MapViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    
    public let mapView: MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    
    private let myLocationButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        button.layer.cornerRadius = button.frame.width / 2
        button.backgroundColor = .systemBackground
        let image = UIImage(systemName: "location.north.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .medium))
        button.setImage(image, for: .normal)
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.7
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        button.addTarget(self, action: #selector(renderUserLocation), for: .touchUpInside)
        
        return button
    }()
    
    let searchBarController = UISearchController()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
        setupViews()
        setConstraints()
        setupLocationManager()
        checkLocationServices()
        locationManager.startUpdatingLocation()
        //        LocationManager.shared.getUserLocation { [weak self] location in
        //            DispatchQueue.main.async {
        //                guard let strongSelf = self else {
        //                    return
        //                }
        //                strongSelf.mapView.showsUserLocation = true
        //                strongSelf.addMapPin(with: location)
        //            }
        //        }
        
        
        searchBarController.searchBar.showsCancelButton = true
        searchBarController.searchBar.showsScopeBar = true
        
        let pressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
//        pressGesture.minimumPressDuration = 1
        pressGesture.delaysTouchesBegan = true
        pressGesture.allowableMovement = 10
        mapView.addGestureRecognizer(pressGesture)
    }
    
    override func viewDidLayoutSubviews() {
        
        myLocationButton.frame = CGRect(x: view.frame.size.width - 70 - view.safeAreaInsets.right, y: view.frame.size.height - 90 - view.safeAreaInsets.bottom, width: 50, height: 50)
        
        searchBarController.searchBar.frame = CGRect(x: 0, y: 50, width: view.frame.width, height: 40)
    }
    
    // MARK: - Setup
    
    func setupViews() {
        view.backgroundColor = .systemBackground
        view.addSubview(mapView)
        view.addSubview(myLocationButton)
        view.addSubview(searchBarController.searchBar)
    }
    
    func setConstraints() {
        var sharedConstraints = [NSLayoutConstraint]()
        
        sharedConstraints.append(contentsOf: [
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
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
//        LocationManager.shared.resolveLocationName(with: location) { [weak self] locationName in
//        }
    }
    
    @objc private func handleLongPress(gestureRecognizer: UILongPressGestureRecognizer) {
        print("tap")
        if gestureRecognizer.state == UIGestureRecognizer.State.ended {
            let location = gestureRecognizer.location(in: mapView)
            let coordinate = mapView.convert(location, toCoordinateFrom: mapView)
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            print("Coordinates = \(coordinate)")
            mapView.addAnnotation(annotation)
        }
        else {
            print("xxxxx")
        }
    }
    
    @objc private func renderUserLocation() {
        locationManager.startUpdatingLocation()
    }
}
