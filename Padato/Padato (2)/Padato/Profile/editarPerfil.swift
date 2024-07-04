import SwiftUI

struct editarPerfil: View {
    @Binding var nome: String
    @Binding var fotoPerfil: UIImage?
    @Binding var capa: UIImage?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var isSelectingProfileImage = false

    var body: some View {
        ZStack {
            Color("darkblue")
                .ignoresSafeArea()
            VStack(spacing: 20) {
                // Botão para selecionar capa
                Button(action: {
                    self.isSelectingProfileImage = false
                    self.showingImagePicker = true
                }) {
                    if let capa = capa {
                        Image(uiImage: capa)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 200)
                            .clipped()
                    } else {
                        Color.gray
                            .frame(height: 200)
                    }
                }
                .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                    ImagePicker(image: self.$inputImage)
                }

                // Botão para selecionar foto de perfil
                Button(action: {
                    self.isSelectingProfileImage = true
                    self.showingImagePicker = true
                }) {
                    if let fotoPerfil = fotoPerfil {
                        Image(uiImage: fotoPerfil)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            .shadow(radius: 10)
                    } else {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .foregroundColor(.gray)
                    }
                }
                .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                    ImagePicker(image: self.$inputImage)
                }

                // Campo de texto para editar nome
                TextField("Nome", text: $nome)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                // Botão para salvar alterações
                Button(action: {
                    saveProfile()
                }) {
                    Text("Salvar Alterações")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
            }
            .padding()
        .navigationTitle("Editar Perfil")
        }
    }

    func loadImage() {
        guard let inputImage = inputImage else { return }
        if isSelectingProfileImage {
            fotoPerfil = inputImage
        } else {
            capa = inputImage
        }
    }

    func saveProfile() {
        UserDefaults.standard.set(nome, forKey: "nome")
        if let fotoPerfil = fotoPerfil {
            if let data = fotoPerfil.jpegData(compressionQuality: 0.8) {
                UserDefaults.standard.set(data, forKey: "fotoPerfil")
            }
        }
        if let capa = capa {
            if let data = capa.jpegData(compressionQuality: 0.8) {
                UserDefaults.standard.set(data, forKey: "capa")
            }
        }
        print("Perfil salvo")
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }

    @Binding var image: UIImage?
    @Environment(\.presentationMode) var presentationMode

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}

struct editarPerfil_Previews: PreviewProvider {
    @State static var nome = "Nome do Usuário"
    @State static var fotoPerfil: UIImage? = UIImage(named: "profile_picture")
    @State static var capa: UIImage? = UIImage(named: "profile_cover")

    static var previews: some View {
        editarPerfil(nome: $nome, fotoPerfil: $fotoPerfil, capa: $capa)
    }
}
