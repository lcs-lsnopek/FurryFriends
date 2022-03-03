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
    
    @State var catModel = CatModel(file: "")
    
    // MARK: Computed properties
    var body: some View {
        
        VStack {
            
            // Shows the main image
            RemoteImageView(fromURL: currentImage)
            
            // Push main image to top of screen
            Spacer()

            Button(action: {
                Task {
                    await loadNewJoke()

                }
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
    func loadNewJoke() async {
        
        // Assemble the URL that points to the JSON endpoint
        let url = URL(string: "https://aws.random.cat/meow")!
        
        // Define what type of request will be sent to the URL above
        var request = URLRequest(url: url)
        // This request will accept a JSON-formatted response
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        // Start a URL session to interact with the endpoint
        let urlSession = URLSession.shared
                    
        // Try to fetch a new joke
        do {
            // Get the raw data from the endpoint
            let (data, _) = try await urlSession.data(for: request)
            
            // Attempt to decode and return the object containing
            // a new joke
            // NOTE: We decode to DadJoke.self since the endpoint
            //       returns a single JSON object
            catModel = try JSONDecoder().decode(CatModel.self, from: data)
            
            // Replaces the transparent pixel image with an actual image of an animal
            // Adjust according to your preference ☺️n
            currentImage = URL(string: catModel.file)!
            
        } catch {
            print("Could not retrieve / decode JSON from endpoint.")
            print(error)
        }
        
    }
}

struct CatView_Previews: PreviewProvider {
    static var previews: some View {
        CatView()
    }
}
