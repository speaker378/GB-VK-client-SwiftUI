//
//  LoginScreenView.swift
//  GB VK client SwiftUI
//
//  Created by Сергей Черных on 13.03.2022.
//

import SwiftUI
import Combine

struct LoginScreenView: View {
    @State private var compactLayout = false
    private let keyboardIsOnPublisher = Publishers.Merge(
        NotificationCenter.default.publisher(
            for: UIResponder.keyboardWillShowNotification)
            .map { _ in true },
        NotificationCenter.default.publisher(
            for: UIResponder.keyboardWillHideNotification)
            .map { _ in false })
        .removeDuplicates()

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
                        LoginTextField()
                        PasswordTextField()
                    }
                    .padding([.leading, .trailing], 44)
                    .padding(.top, (compactLayout ? 20 : 120))

                    HStack {
                        ForgotButton()
                        Spacer()
                    }
                    .padding(.leading, 44)
                }

                LoginButton()
                    .padding(.top, (compactLayout ? 12 : 66))

                if !compactLayout {
                    Spacer()
                }
                RegisterButton()
            }
            .onReceive(keyboardIsOnPublisher) { isKeyboardOn in withAnimation(Animation.default) {
                self.compactLayout = isKeyboardOn

            }
            }
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreenView()
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
    @State private var login = ""
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
    @State private var password = ""
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

struct LoginButton: View {
    var body: some View {
        Button(action: {}) {
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
    }
}

struct RegisterButton: View {
    var body: some View {
        Button("Зарегестрироваться", action: {})
            .foregroundColor(.white)
            .opacity(0.9)
            .font(.system(size: 20))
    }
}

struct ForgotButton: View {
    var body: some View {
        HStack {
            Button("Забыли?", action: {})
                .foregroundColor(.white)
                .opacity(0.8)
                .font(.system(size: 18))
        }
    }
}

