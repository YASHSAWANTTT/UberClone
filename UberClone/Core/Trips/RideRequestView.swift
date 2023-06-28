//
//  RideRequestView.swift
//  UberClone
//
//  Created by Yash Sawant  on 6/27/23.
//

import SwiftUI

struct RideRequestView: View {
    
    @State private var SelectedRideType: RideType = .uberX
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
    
    
    var body: some View {
        VStack{
            Capsule()
                .foregroundColor(Color(.systemGray5))
                .frame(width: 48, height: 6)
                .padding(.top, 8)
            
            //info view
            HStack{
                
                //indicator
                
                VStack{
                    Circle().fill(Color(.systemGray3)).frame(width: 8, height: 8)
                    Rectangle().fill(Color(.systemGray3)).frame(width: 1, height: 32)
                    Rectangle().fill(Color(.black)).frame(width: 8, height: 8)
                }
                
                VStack(alignment: .leading, spacing: 24){
                    HStack{
                        Text("Current Location")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.gray)
                        Spacer()
                        
                        Text(locationViewModel.pickUpTime ?? "")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.gray)
                        
                        
                    }.padding(.bottom, 10)
                    
                    HStack{
                        if let location = locationViewModel.selectedUberLocation {
                            Text(location.title)
                                .font(.system(size: 16, weight: .semibold))
                        }
                            
                        Spacer()
                        
                        Text(locationViewModel.dropOffTime ?? "")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.gray)
                        
                        
                    }
                }.padding(.leading, 8)
            }.padding()
            
            
            Divider()

            //ride type select
            Text("Suggested Rides").font(.subheadline).fontWeight(.semibold).padding().foregroundColor(.gray).frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal) {
                HStack(spacing: 12){
                    ForEach(RideType.allCases){ type in
                        VStack(alignment: .leading) {
                            Image(type.imageName)
                                .resizable()
                                .scaledToFit()
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(type.description) .font(.system(size: 14, weight: .semibold))
                                    
                                
                                Text(locationViewModel.computeRidePrice(for: type).toCurrency()) .font(.system(size: 14, weight: .semibold))
                                   
                            }.padding(8)
                            
                            
                        }.frame(width: 112, height: 140)
                            .foregroundColor(type == SelectedRideType ? .white: Color.theme.primaryTextColor)
                            .background(type == SelectedRideType ? .blue : Color.theme.secondaryBackgroundColor)
                            .scaleEffect(type == SelectedRideType ? 1.2: 1.0)
                            .cornerRadius(10)
                            .onTapGesture{
                                withAnimation(.spring()) {
                                    SelectedRideType = type
                                }
                            }
                    }
                }
            }.padding(.horizontal)
            
            
                Divider()
            
            //payment
            
            HStack(spacing: 12) {
                Text("Visa")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(6)
                    .background(.blue)
                    .cornerRadius(4)
                    .foregroundColor(.white)
                    .padding(.leading)
                
                Text("***234")
                    .fontWeight(.bold)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .imageScale(.medium)
                    .padding()
            }.frame(height: 50)
                .background(Color.theme.secondaryBackgroundColor)
                .cornerRadius(10)
                .padding(.horizontal)
            
            Divider().padding(.vertical, 8)
            
            //request ride
            
            Button {
                
            } label: {
                Text("Confirm Ride")
                    .fontWeight(.bold)
                    .frame(width: UIScreen.main.bounds.width - 32,height: 50)
                    .background(.blue)
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    
            }
        }
        .padding(.bottom, 24)
        .background(Color.theme.backgroundColor)
        .cornerRadius(16)
    }
}

struct RideRequestView_Previews: PreviewProvider {
    static var previews: some View {
        RideRequestView()
    }
}
