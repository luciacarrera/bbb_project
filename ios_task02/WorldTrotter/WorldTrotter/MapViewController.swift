//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Lucia Carrera Saenz on 11/19/21.
//  Copyright © 2021 Lucia Carrera Saenz. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var mapView: MKMapView!
    
    @objc func mapTypeChanged(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }
    
    @objc func poiDisplay(_ poiSwitch: UISwitch) {
        if poiSwitch.isOn {
            mapView.pointOfInterestFilter = MKPointOfInterestFilter(excluding: [])
        } else {
            mapView.pointOfInterestFilter = MKPointOfInterestFilter(including: [])
        }
    }
    
    override func loadView() {
        // Create a map view
        mapView = MKMapView()
        
        //Set it as 'the' view of this view controller
        view = mapView
        
        // Segment control
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.systemBackground
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(self, action: #selector(mapTypeChanged(_:)), for: .valueChanged)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
        // Points of intrest label
        let pointsOfInterest = UILabel()
        pointsOfInterest.text = "Points of Interest"
        pointsOfInterest.textColor = UIColor.black
        
        pointsOfInterest.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pointsOfInterest)
        
        let pointsLabelTopConstraint = pointsOfInterest.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 8)
        let pointsLabelLeadingConstraint = pointsOfInterest.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        
        pointsLabelTopConstraint.isActive = true
        pointsLabelLeadingConstraint.isActive = true
        
        // Points of interest switch
        let ptsOfIntSwitch = UISwitch()
        ptsOfIntSwitch.isOn = true
        
        ptsOfIntSwitch.addTarget(self, action: #selector(poiDisplay(_ :)), for: .valueChanged)
        
        ptsOfIntSwitch.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ptsOfIntSwitch)
        
        let switchTopConstraint = ptsOfIntSwitch.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 8)
        let switchLeadingConstraint = ptsOfIntSwitch.leadingAnchor.constraint(equalTo: pointsOfInterest.trailingAnchor, constant: 12)
        
        switchTopConstraint.isActive = true
        switchLeadingConstraint.isActive = true
        
        // Locations button
        let findMe = UIButton()
        findMe.setTitle("Find Me", for: .normal)
        findMe.setTitleColor(.black, for: .normal)
        findMe.backgroundColor = .white
        findMe.layer.borderWidth = 1
        findMe.layer.cornerRadius = 2
        
        findMe.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(findMe)
    
        let fmButtonWidthConstraints = findMe.widthAnchor.constraint(equalTo: findMe.titleLabel!.widthAnchor, constant: 10.0)
        
        let findMeTopConstraint = findMe.topAnchor.constraint(equalTo: pointsOfInterest.bottomAnchor, constant: 8)
        let findMeLeadingConstraint = findMe.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        
        fmButtonWidthConstraints.isActive = true
        findMeTopConstraint.isActive = true
        findMeLeadingConstraint.isActive = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MapViewController loaded its view.")
    }
}
