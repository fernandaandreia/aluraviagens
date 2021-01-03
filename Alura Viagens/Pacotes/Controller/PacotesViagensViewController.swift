//
//  PacotesViagensViewController.swift
//  Alura Viagens
//
//  Created by Fernanda Andreia Nascimento on 02/01/21.
//

import UIKit

class PacotesViagensViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionPacotes: PacoteViagemCollectionViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        collectionPacotes.delegate = self
//        collectionPacotes.dataSource  = self

    }
    
    
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



    
    let listaViagens: Array<Viagem> = ViagemDAO().retornaTodasAsViagens()

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return UIDevice.current.userInterfaceIdiom == .phone ? CGSize(width: collectionView.bounds.width/2-20, height: 160) : CGSize(width: collectionView.bounds.width/3-20, height: 250)
    }
    
}

