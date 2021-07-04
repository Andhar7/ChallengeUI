//
//  MainDetailView.swift
//  StoriesPlus
//
//  Created by Andrej Kling on 03.07.21.
//

import SwiftUI

struct MainDetailView: View {
    
    @State private var currentIndex: Int = 0
    @State private var count = 0
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    @Binding var selected : Model
    @Binding var showDetail : Bool
    
    var body: some View {
        
        ZStack(alignment: .topLeading) {
            
            ZStack(alignment: Alignment.bottom)  {
                
                MiddleView(currentIndex: $currentIndex, count: $count,  selected: $selected)
                
                Button(action: {
                    
                }, label: {
                    RoundedRectangle(cornerRadius: 55, style: .continuous)
                        .fill(Color("Color4"))
                        .frame(width: width - 33, height: height / 21, alignment: .center)
                        .overlay(
                            Text("Add to Cart")
                                .font(.system(size: 15, weight: .bold, design: .serif))
                                .foregroundColor(.white)
                        )
                })
                .padding(.bottom, height < 750 ?  42 : 31)
                
            }
            .background(Color("Color1").ignoresSafeArea(.all, edges: .bottom))
            
            Button(action: {
                withAnimation(.spring()){
                    self.showDetail.toggle()
                }
            }, label: {
                Image(systemName: "arrow.left")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.leading, 33)
                    .blur(radius: 0.2)
                    .shadow(color: Color.white.opacity(0.5), radius: 5, x: 5, y: 5)
                    .shadow(color: Color.white.opacity(0.5), radius: 5, x: -5, y: -5)

            })
        }
    }
}

struct MainDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MainDetailView( selected: .constant(dataModel[0]), showDetail: .constant(false))
    }
}
 
extension LinearGradient {
    
    static let darkBlueGradient = LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)).opacity(0.03), Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)).opacity(0.7)]), startPoint: .top, endPoint: .bottom)
}
 


