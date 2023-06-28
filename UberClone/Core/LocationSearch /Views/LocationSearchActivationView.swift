//
//  LocationSearchActivationView.swift
//  UberClone
//
//  Created by Yash Sawant  on 6/5/23.
//

import SwiftUI

struct LocationSearchActivationView: View {
    var body: some View {
        HStack{
            Rectangle().fill(Color.black).frame(width: 8,height: 8).padding(.horizontal)
            Text("where to?").foregroundColor(Color(.darkGray))
            
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width - 64, height: 50).background(Rectangle().fill(Color.white).shadow(color: .black, radius: 6))
    }
}

struct LocationSearchActivationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchActivationView()
    }
}
