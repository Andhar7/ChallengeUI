//
//  CardsMainView.swift
//  StoriesPlus
//
//  Created by Andrej Kling on 01.07.21.
//

import SwiftUI

struct CardsMainView: View {
    
    @State private var selected : Model = dataModel[0]
    @State private var showDetail = false
    
    let height = UIScreen.main.bounds.height
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            Color("Color1")
                .frame(height: height - 280)
                .cornerRadius(69, corners: [.bottomLeft])
                .ignoresSafeArea(.all, edges: .top)
            
            VStack(alignment: .leading, spacing: 0) {
                
                HStack {
                    
                    Text("Best present")
                        .font(.system(size: 24, weight: .bold, design: .serif))
                        .italic()
                        .foregroundColor(Color("Color4"))
                    
                    Text("for a")
                        .font(.system(size: 24, weight: .bold, design: .serif))
                        .italic()
                        .foregroundColor(Color.white)
                }
                .padding(.leading, 15)
                
                Text("special day")
                    .font(.system(size: 24, weight: .bold, design: .serif))
                    .italic()
                    .foregroundColor(Color.white)
                    .padding(.leading, 15)
                
                Spacer().frame(height: 45)
                
                Text("Choose a category")
                    .font(.system(size: 14, weight: .bold, design: .serif))
                    .italic()
                    .opacity(0.5)
                    .foregroundColor(Color.white)
                    .padding(.leading, 15)
                
                Spacer().frame(height: 15)
                
                ButtonsView()
                    .padding(.leading, 15)
                
                Spacer().frame(height: 15)
                
                Text("Popular")
                    .font(.system(size: 21, weight: .bold, design: .serif))
                    .italic()
                    .opacity(0.5)
                    .foregroundColor(Color.white)
                    .padding(.leading, 15)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 21) {
                        
                        ForEach(dataModel) { i in
                            
                            CardView(card: i)
                                .onTapGesture {
                                    withAnimation(.spring()){
                                        selected = i
                                        self.showDetail.toggle()
                                    }
                                }
                        }
                    }
                    .padding(.leading, 35)
                    .padding(.top, 21)
                    .padding(.bottom, height < 750 ? 55 : 31)
                }
                
            }
            .padding(.top, 23)
            
            ZStack {
                
                Color("Color3")
                    .ignoresSafeArea()
                
            }
            .zIndex(-1)
            
            if self.showDetail {
                MainDetailView(selected: $selected, showDetail: $showDetail)
            }
        }
    }
}

struct CardsMainView_Previews: PreviewProvider {
    static var previews: some View {
        CardsMainView()
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
