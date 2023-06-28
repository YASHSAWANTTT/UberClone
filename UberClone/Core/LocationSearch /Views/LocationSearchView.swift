//
//  LocationSearchView.swift
//  UberClone
//
//  Created by Yash Sawant  on 6/5/23.
//

import SwiftUI

struct LocationSearchView: View {
    @State private var startLocationText = ""
   
    @Binding var mapState: MapViewState
    
    @EnvironmentObject var viewModel: LocationSearchViewModel
    var body: some View {
        VStack{
            //header
            HStack{
                VStack{
                    Circle().fill(Color(.systemGray3)).frame(width: 6, height: 6)
                    Rectangle().fill(Color(.systemGray3)).frame(width: 1, height: 24)
                    Rectangle().fill(Color(.black)).frame(width: 6, height: 6)
                }
                
                VStack{
                    TextField("current location", text: $startLocationText).frame(height: 32).background(Color(.systemGroupedBackground)).padding(.trailing)
                    
                    TextField("where to?", text: $viewModel.queryFragment).frame(height: 32).background(Color(.systemGray4)).padding(.trailing)
                }
            }.padding(.horizontal).padding(.top, 70)
            Divider().padding(.vertical)
            
            // list
            ScrollView{
                VStack(alignment: .leading)
                {
                    ForEach(viewModel.results, id: \.self) {
                        result in
                        LocationSearchResult(title: result.title, subtitle: result.subtitle)
                            .onTapGesture {
                            withAnimation(.spring()) {
                                viewModel.selectedLocation(result)
                                
                                mapState = .locationSelected
                            }
                        }
                    }
                }
            }
        }.background(Color.theme.backgroundColor)
        .background(.white)
    }
}

struct LocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchView(mapState: .constant(.searchingForLocation))
    }
}
