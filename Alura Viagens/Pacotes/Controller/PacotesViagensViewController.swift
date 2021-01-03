//
//  PacotesViagensViewController.swift
//  Alura Viagens
//
//  Created by Fernanda Andreia Nascimento on 02/01/21.
//

import UIKit

class PacotesViagensViewController: UIViewController, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listaViagens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let celulaPacote = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPacote", for: indexPath) as! PacoteViagemCollectionViewCell
        
        let viagemAtual = listaViagens[indexPath.item]
        
        celulaPacote.labelTitulo.text = viagemAtual.titulo
        celulaPacote.labelQuantidadeDias.text = " \(viagemAtual.quantidadeDeDias)  dias"
        celulaPacote.labelPreco.text = "R$ \(viagemAtual.preco)"
        celulaPacote.imagemViagem.image = UIImage(named: viagemAtual.caminhoDaImagem) // inserir imagem
        
        celulaPacote.layer.borderWidth = 0.5
        celulaPacote.layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
        
        return celulaPacote
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        collectionPacotes.dataSource = self
       

    }
    

    @IBOutlet weak var collectionPacotes: PacoteViagemCollectionViewCell!
    
    let listaViagens: Array<Viagem> = ViagemDAO().retornaTodasAsViagens()

}
