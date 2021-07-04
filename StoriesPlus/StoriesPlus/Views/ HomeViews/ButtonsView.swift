//
//  ButtonsView.swift
//  StoriesPlus
//
//  Created by Andrej Kling on 01.07.21.
//

import SwiftUI

struct ButtonsView: View {
    
    @State private var selected = "Flights"
 
    var body: some View {
        VStack {
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack {
                    
                    ForEach(category, id:\.self) { item in
                        
                        ButtonView(title: item.title, image: item.image, selected: $selected)
                            
                    }
                }
                .padding(.horizontal, 24)
            }
        }
    }
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsView()
    }
}

struct ButtonView : View {
    
    var title : String
    var image : String
    
    @Binding var selected : String
    
    var body: some View {
        
        VStack {
            
            Button(action: {
                withAnimation(.easeIn(duration: 0.4)){
                    selected = title
                }
            }, label: {
                VStack(spacing: 25) {
                    
                    Image(systemName: image)
                        .foregroundColor(selected == title ? Color("Color4") : Color.white )
                        .opacity(0.6)
                    
                    Text(title)
                        .font(.footnote)
                        .foregroundColor(selected == title ? Color("Color4") : Color.white )
                        .opacity(0.6)
                }
                .frame(width: 75, height: 120)
                .background(selected == title ? Color.white : Color("Color2"))
                .cornerRadius(21)
            })
        }
    }
}

struct Data : Identifiable, Hashable {
    
    let id = UUID().uuidString
    let title : String
    let image : String
}

var category : [Data] = [
    Data(title: "All", image: "eye"),
    Data(title: "Extreme", image: "hand.raised.slash"),
    Data(title: "Flights", image: "swift"),
    Data(title: "Paragiding", image: "sparkle"),
    Data(title: "Cycling", image: "bicycle.circle"),
    Data(title: "Floating", image: "camera.aperture")
]
