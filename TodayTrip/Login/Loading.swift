//
//  Loading.swift
//  NowTrip
//
//  Created by Junho Son on 2022/07/23.
//

import SwiftUI

let timer = Timer
    .publish(every: 1, on: .main, in: .common)
    .autoconnect()

struct Loading: View {
    @State private var loadingAmount = 0.0
    
    var body: some View {
        ZStack {
            GeometryReader { gp in
                VStack(alignment: .leading, spacing: 0) {
                    Text("세상에서\n나를 발견하는\n마지막 찬스")
                        .bold()
                        .foregroundColor(Color.white)
                        .font(.largeTitle)
                    HStack(spacing: 0){
                        HStack(){
                            Text("바로 여행을 떠나보세요").foregroundColor(Color.white)
                        }.frame(width: gp.size.width * 0.425, alignment: .leading)
                        HStack(){
                            Button {
                                print("gckim")
                            } label: {
                                Image(systemName: "arrow.right").foregroundColor(Color.white)
                                    .padding(10)
                            }
                            .background(Color.blue)
                            .clipShape(Capsule())
                        }.frame(width: gp.size.width * 0.425, alignment: .trailing)

                    }.padding(.top)
                    ProgressView((""), value: loadingAmount, total: 100)
                        .tint(.white)
                        .frame(width: gp.size.width * 0.85, height: gp.size.height * 0.07, alignment: .center)
                        .padding(.bottom)
                }.frame(width: gp.size.width, height: gp.size.height, alignment: .bottom)
            }
        }
        .ignoresSafeArea()
        .background(
                Image("LoadingBackgroundImg")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .brightness(-0.2)
        )
        .onReceive(timer) { time in
            if (self.loadingAmount < 100) {
                self.loadingAmount += 50
            }
        }
    }
}

struct Loading_Previews: PreviewProvider {
    static var previews: some View {
        Loading()
    }
}
