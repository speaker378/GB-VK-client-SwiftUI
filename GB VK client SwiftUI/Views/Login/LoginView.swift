//
//  LoginView.swift
//  GB VK client SwiftUI
//
//  Created by Сергей Черных on 13.03.2022.
//

import SwiftUI
import Combine

struct LoginView: View {
    @State private var compactLayout = false
    @State private var showingAlert = false
    @State private var login = "admin"
    @State private var password = "admin"
    @Binding var isUserAuth: Bool
    private let keyboardIsOnPublisher = Publishers.Merge(
        NotificationCenter.default.publisher(
            for: UIResponder.keyboardWillShowNotification)
        .map { _ in true },
        NotificationCenter.default.publisher(
            for: UIResponder.keyboardWillHideNotification)
        .map { _ in false })
        .removeDuplicates()
    
    private func checkLogin() {
        if login == "admin" && password == "admin" {
            isUserAuth = true
        }
        else {
            showingAlert = true
        }
    }
    
    var body: some View {
        ZStack {
            Color("vk_blue")
                .ignoresSafeArea(.all)
                .onTapGesture {
                    UIApplication.shared.endEditing()
                }
            
            VStack {
                LogoImage()
                    .padding(.top, 88)
                
                VStack {
                    VStack(spacing: 24) {
                        LoginTextField(login: $login)
                        PasswordTextField(password: $password)
                    }
                    .padding([.leading, .trailing], 44)
                    .padding(.top, (compactLayout ? 8 : 120))
                    
                    HStack {
                        forgotButton
                        Spacer()
                    }
                    .padding(.leading, 44)
                }
                
                loginButton
                    .padding(.top, (compactLayout ? 8 : 66))
                
                if !compactLayout {
                    Spacer()
                }
                registerButton
                    .padding(.bottom, 8)
            }
            .onReceive(keyboardIsOnPublisher) { isKeyboardOn in withAnimation(Animation.default) {
                self.compactLayout = isKeyboardOn
            }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(isUserAuth: .constant(false ))
    }
}

struct LogoImage: View {
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .frame(width: 80, height: 80)
                .opacity(0.9)
        }
    }
}

struct LoginTextField: View {
    @Binding var login: String
    var body: some View {
        TextField("", text: $login)
            .placeholder(when: login.isEmpty) {
                Text("Email или телефон")
                    .opacity(0.5)
                    .foreground(LinearGradient(
                        gradient: .init(colors: [.green, .purple]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ))
            }
            .disableAutocorrection(true)
            .textInputAutocapitalization(.never)
            .frame(minHeight: 44)
            .background(Color("vk_blue"))
            .cornerRadius(.greatestFiniteMagnitude)
            .brightness(0.2)
            .accentColor(.white)
            .font(.system(size: 22))
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
    }
}

struct PasswordTextField: View {
    @Binding var password: String
    var body: some View {
        SecureField("", text: $password)
            .placeholder(when: password.isEmpty) {
                Text("Пароль")
                    .foreground(LinearGradient(
                        gradient: .init(colors: [.green, .purple]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ))
                    .opacity(0.5)
            }
            .frame(minHeight: 44)
            .background(Color("vk_blue"))
            .cornerRadius(.greatestFiniteMagnitude)
            .brightness(0.2)
            .accentColor(.white)
            .font(.system(size: 22))
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
    }
}

extension LoginView {
    var loginButton: some View {
        Button(action: checkLogin) {
            HStack {
                Text("Войти")
            }
            .frame(minWidth: 280, minHeight: 44)
            .font(.system(size: 22))
            .background()
            .foregroundColor(Color("vk_blue", bundle: nil))
            .cornerRadius(.greatestFiniteMagnitude)
            .opacity(0.9)
        }
        .alert("Ошибка", isPresented: $showingAlert) {
            EmptyView()
        } message: {
            Text("Неверный логин или пароль")
        }
    }
}

extension LoginView {
    var registerButton: some View {
        Button("Зарегестрироваться", action: {})
            .foregroundColor(.white)
            .opacity(0.9)
            .font(.system(size: 20))
    }
}

extension LoginView {
    var forgotButton: some View {
        HStack {
            Button("Забыли?", action: {})
                .foregroundColor(.white)
                .opacity(0.8)
                .font(.system(size: 18))
        }
    }
}

