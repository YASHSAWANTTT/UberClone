//
//  MapViewActionButton.swift
//  UberClone
//
//  Created by Yash Sawant  on 6/5/23.
//

import SwiftUI

struct MapViewActionButton: View {
   
    @Binding var mapState: MapViewState
    @EnvironmentObject var viewModel: LocationSearchViewModel
    
    var body: some View {
        Button{
            withAnimation(.spring()){
               actionForState(mapState)
            }
        } label: {
        //the three arrows symbol
            Image(systemName: imageNameForState(mapState)) .font(.title2).foregroundColor(.black).padding().background(.white).clipShape(Circle()).shadow(color: .black, radius: 6)
        }
        //makes it go to the left side of the screen
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func actionForState(_ state: MapViewState) {
        switch state {
        case .noInput:
            print("DEBUG: NO INPUT")
        case .searchingForLocation:
            mapState = .noInput
        case .locationSelected, .polylineAdded:
            mapState = .noInput
            viewModel.selectedUberLocation = nil
    
            
        }
    }
    
    func imageNameForState(_ state: MapViewState) -> String {
        switch state {
        case .noInput:
            return "line.3.horizontal"
        case .searchingForLocation, .locationSelected:
           return "arrow.left"
        default:
            return "line.3.horizontal"
            
        }
    }
}

struct MapViewActionButton_Previews: PreviewProvider {
    static var previews: some View {
        MapViewActionButton(mapState: .constant(.noInput))
    }
}