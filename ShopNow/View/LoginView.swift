//
//  LoginView.swift
//  ShopNow
//
//  Created by Pooja on 08/12/25.
//

import SwiftUI

struct LoginView: View {
    @Binding var emailField: String
    @Binding var pwdField: String
    @Binding var tab: String
    @AppStorage("hasLaunchedBefore") private var hasLaunchedBefore: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    //MARK: - WELCOME TEXT
                    Text("Welcome back")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(16)
                    
                    //MARK: - PICKER VIEW
                    VStack {
                        Picker("", selection: $tab) {
                            Text("Login")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .tag("Login")
                            Text("Signup").tag("Signup")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                        }
                        .pickerStyle(.segmented)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 24)
                    
                    //MARK: - MAIL AND PASSEORD VIEW
                    VStack(spacing: 24) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Email")
                            TextField(text: $emailField) {
                                Text("Email")
                            }
                            .frame(height: 32)
                            .padding(8)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                        }//EMAIL
                        .padding(.horizontal ,16)
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Password")
                            TextField(text: $pwdField) {
                                Text("Password")
                            }
                            .frame(height: 32)
                            .padding(8)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                        }//PASSWORD
                        .padding(.horizontal ,16)
                        HStack {
                            Spacer()
                            Text("Forget password?")
                                .foregroundColor(.blue)
                                .padding(.trailing, 16)
                        }
                    }
                    
                    //MARK: - BUTTON VIEW
                    NavigationLink {
                        ContentView()
                            .onAppear {
                                hasLaunchedBefore = true
                            }
                    } label: {
                        Text("Login")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .frame(height: 52)
                            .background(Color.orange)
                            .foregroundColor(.white)
                    }
                    .cornerRadius(8)
                    .padding(.horizontal, 16)
                    
                    //MARK: - BOTTOM VIEW
                    VStack(spacing: 24) {
                        HStack {
                            RoundedRectangle(cornerRadius: 1, style: .continuous)
                                .fill(.gray)
                                .frame(height: 1)
                            Text("Or continue with")
                                .font(.footnote)
                            RoundedRectangle(cornerRadius: 1, style: .continuous)
                                .fill(.gray)
                                .frame(height: 1)
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 32)
                        HStack(spacing: 24) {
                            Spacer()
                            Image("facebook")
                                .resizable()
                                .scaledToFit()
                                .frame( height: 60)
                            Image("whatsapp")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                            Image("insta")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                            Spacer()
                        }
                        .padding(.horizontal, 16)
                    }
                }//MAINVSTACK
            }
            .navigationTitle("Shop now")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    LoginView(emailField: .constant(""), pwdField: .constant(" "), tab: .constant("Login"))
}
