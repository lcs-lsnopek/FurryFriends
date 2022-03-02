//
//  CatView.swift
//  FurryFriends
//
//  Created by Logan Snopek on 2022-03-01.
//

import SwiftUI

struct CatView: View {
    // MARK: Stored properties
    
    // Address for main image
    // Starts as a transparent pixel – until an address for an animal's image is set
    @State var currentImage = URL(string: "https://www.russellgordon.ca/lcs/miscellaneous/transparent-pixel.png")!
    
    // MARK: Computed properties
    var body: some View {
        
        VStack {
            
            // Shows the main image
            RemoteImageView(fromURL: currentImage)
            
            // Push main image to top of screen
            Spacer()

            Button(action: {
                // NOTE: Output will not be shown unless this app is run in the "full" simulator
                print("Button was pressed")
            }, label: {
                Text("New Cat")
            })
            .buttonStyle(.bordered)
            
        }
        // Runs once when the app is opened
        .task {
            
            // Example images for each type of pet
            let remoteCatImage = "https://purr.objects-us-east-1.dream.io/i/JJiYI.jpg"
//            let remoteDogImage = "https://images.dog.ceo/breeds/labrador/lab_young.JPG"
            
            // Replaces the transparent pixel image with an actual image of an animal
            // Adjust according to your preference ☺️n
            currentImage = URL(string: remoteCatImage)!
                        
        }
//        .navigationTitle("Furry Friends")
        
    }
    
    // MARK: Functions
    
}

struct CatView_Previews: PreviewProvider {
    static var previews: some View {
        CatView()
    }
}
