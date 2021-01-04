//
//  PacoteViagemCollectionViewCell.swift
//  Alura Viagens
//
//  Created by Fernanda Andreia Nascimento on 02/01/21.
//

import UIKit

class PacoteViagemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imagemViagem: UIImageView!
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelQuantidadeDias: UILabel!
    @IBOutlet weak var labelPreco: UILabel!
    
    func configuraCelula(pacoteViagem:PacoteViagem){
        labelTitulo.text = pacoteViagem.viagem.titulo
        labelQuantidadeDias.text = " \(pacoteViagem.viagem.quantidadeDeDias)  dias"
        labelPreco.text = "R$ \(pacoteViagem.viagem.preco)"
        imagemViagem.image = UIImage(named: pacoteViagem.viagem.caminhoDaImagem) // inserir imagem
        
        layer.borderWidth = 0.5
        layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
    }
}
