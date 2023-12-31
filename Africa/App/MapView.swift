//
//  MapView.swift
//  Africa
//
//  Created by Bartu Kara on 25.09.2023.
//

import SwiftUI
import MapKit



struct MapView: View {
    // MARK: - Properties
    
    @State private var region : MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
    }()
    
    let locations : [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    // MARK: - Body
    var body: some View {
        // MARK: - 1-Basic Map
        //Map(coordinateRegion: $region)
        
        // MARK: - 2- Advanced Map
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: {
            item in
            // (A) Pin : Old Style (always static)
            //MapMarker(coordinate: item.location, tint: .accentColor)
            
            // (B) Custım Basic Annotion (it could be interactive)
            //MapAnnotation(coordinate: item.location){
              //  Image("logo")
                //    .resizable()
                  //  .scaledToFit()
                    //.frame(width: 32, height: 32, alignment: .center)
            //}
            
            // (C) Custom Advanced Annotion (it could be interactive)
            MapAnnotation(coordinate: item.location){
                MapAnnotationView(location: item)
            }
        })//: Map
        .overlay(
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                .frame(width: 48, height: 48)
                
                VStack(alignment: .leading, spacing: 3){
                    HStack{
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }//: Hstack
                    Divider()
                    
                    HStack{
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }//: Hstack
                }//: Vstack
            }//: Hstack
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(
                    Color.black
                        .cornerRadius(8)
                        .opacity(0.6)
                )
                .padding()
            ,alignment: .top
        )
    }
}

// MARK: - Preview
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
