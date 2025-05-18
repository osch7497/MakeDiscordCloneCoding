//
//  ContentView.swift
//  MakeDiscordCloneCoding
//
//  Created by 초천재귀요미크리쳐 on 5/8/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            VStack(alignment: .center, spacing:0){
                ZStack{
                    Color.discordPurple
                        .edgesIgnoringSafeArea(.all)
                    VStack(alignment: .center, spacing:0){
                        Image("DiscordLogo")
                            .resizable()
                            .frame(width: 200, height: 200)
                        Text("Discord에 오신걸 환영합니다")
                            .font(.title)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                            .bold()
                            .padding(.horizontal, 10.0)
                        Text("어울리고, 게임하고, 가볍게 대화하세요.\n아래를 탭해 시작해요!")
                            .multilineTextAlignment(.center)
                            .padding(.top, 3.0)
                            .foregroundColor(Color.white)
                    }
                }
                ZStack{
                    Rectangle()
                        .cornerRadius(25.0)
                        .background(Color.discordPurple)
                        .foregroundStyle(Color.discordPurple)
                        .frame(width: 500, height: 50)
                    NavigationLink(destination: NewView()){
                        ZStack{
                            Rectangle()
                                .cornerRadius(25.0)
                                .foregroundStyle(Color.white)
                                .frame(width: 500, height: 50)
                            Text("가입하기")
                                .font(.title3)
                                .bold()
                                .foregroundStyle(Color.black)
                        }
                    }.frame(width: 300, height:45)
                        .background(Color.white)
                        .foregroundStyle(Color.black)
                        .cornerRadius(25.0)
                }
                ZStack{
                    Rectangle()
                        .cornerRadius(25.0)
                        .background(Color.discordPurple)
                        .foregroundStyle(Color.discordPurple)
                        .frame(width: 500, height: 50)
                    NavigationLink(destination: NewView()){
                        ZStack{
                            Rectangle()
                                .cornerRadius(25.0)
                                .foregroundStyle(Color.discordDarkBlue)
                                .frame(width: 500, height: 50)
                            Text("로그인")
                                .font(.title3)
                                .bold()
                                .foregroundStyle(Color.white)
                        }
                    }.frame(width: 300, height:45)
                        .cornerRadius(25.0)
                        .background(Color.discordPurple)
                }
            }
        }
    }
}
struct NewView: View {
    @State private var Register: Bool = false
    @State private var RegType: Double = 1
    @State private var Info: String = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            ZStack{
                Color.discordGray
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    HStack{
                        Image(systemName: "arrow.backward")
                            .resizable()
                            .foregroundColor(Color.white)
                            .background(Color.discordGray)
                            .frame(width: 25, height: 25)
                            .padding(.leading, 40.0)
                            .onTapGesture{
                                dismiss()}
                        Spacer()
                    }
                    Text("전화번호나 이메일 주소를\n입력하세요")
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color.white)
                        .font(.title)
                        .bold()
                    ZStack{
                        Rectangle()
                            .frame(width: 350, height: 40)
                            .foregroundStyle(Color.black.opacity(0.5))
                            .cornerRadius(25)
                        HStack(spacing:3){
                            ZStack{
                                Rectangle()
                                    .frame(width: 170, height: 35)
                                    .foregroundStyle(Color.gray)
                                    .opacity(RegType == 1 ? 0.2 : 0.001)
                                    .cornerRadius(25)
                                    .onTapGesture {RegType=1; Info="";}
                                Text("휴대폰")
                                    .foregroundStyle(Color.white)
                                    .opacity(RegType == 1 ? 1 : 0.5)
                                    .bold()
                            }
                            ZStack{
                                Rectangle()
                                    .frame(width: 170, height: 35)
                                    .foregroundStyle(Color.white)
                                    .opacity(RegType == 0 ? 0.2 : 0.001)
                                    .cornerRadius(25)
                                    .onTapGesture {RegType=0; Info="";}
                                Text("이메일")
                                    .foregroundStyle(Color.white)
                                    .opacity(RegType == 0 ? 1 : 0.5)
                                    .bold()
                            }
                        }
                    }
                    ZStack{
                        VStack{
                            HStack{
                                Text("이메일")
                                    .padding(.leading, 20.0)
                                    .foregroundStyle(Color.white)
                                Spacer()
                            }
                            HStack{
                                Spacer()
                                ZStack{
                                    Rectangle()
                                        .frame(width: 350, height: 50)
                                        .background(Color.black.opacity(0.5))
                                        .cornerRadius(10)
                                    TextField(text: $Info){
                                        Text("이메일 주소")
                                            .foregroundStyle(Color.white.opacity(0.5))
                                    }.frame(width: 320, height: 50)
                                        .foregroundStyle(Color.white)
                                        .background(Color.black.opacity(0.5))
                                        .cornerRadius(10)
                                }
                                Spacer()
                            }
                        }.opacity(RegType == 0 ? 1 : 0)
                        VStack{
                            HStack{
                                Text("전화번호")
                                    .padding(.leading, 20.0)
                                    .foregroundStyle(Color.white)
                                Spacer()
                            }
                            HStack{
                                Spacer()
                                ZStack{
                                    Rectangle()
                                        .frame(width: 350, height: 50)
                                        .background(Color.black.opacity(0.5))
                                        .cornerRadius(10)
                                    TextField(text: $Info){
                                        Text("전화번호")
                                            .foregroundStyle(Color.white.opacity(0.5))
                                    }.frame(width: 320, height: 50)
                                        .foregroundStyle(Color.white)
                                        .background(Color.black.opacity(0.5))
                                        .cornerRadius(10)
                                }
                                Spacer()
                            }
                        }.opacity(RegType == 1 ? 1 : 0)
                    }
                    //NavigationLink(destination: ContentView()){
                        ZStack{
                            Rectangle()
                                .frame(width: 350, height: 40)
                                .foregroundStyle(Color.discordPurple)
                                .cornerRadius(25)
                                .opacity(Info.isEmpty ? 0.5 : 1)
                            Text("다음")
                                .opacity(Info.isEmpty ? 0.5 : 1)
                                .foregroundStyle(Color.white)
                        }
                    //}.foregroundStyle(Color.white).bold().navigationBarBackButtonHidden(true)
                        
                    Spacer()
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentView()
}
