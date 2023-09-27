//
//  HeadingView.swift
//  Africa
//
//  Created by Bartu Kara on 25.09.2023.
//

import SwiftUI

struct HeadingView: View {
    // MARK: - Properties
    
    var headingImage : String
    var headingText : String
    
    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }//: Hstack
        .padding(.vertical)
    }
}

struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
