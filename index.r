use serde::{Deserialize, Serialize};
use std::fs;

#[derive(Debug, Deserialize)]
struct Produto {
    id: String,
    nome: String,
    materias_primas: Vec<MateriaPrima>,
}

#[derive(Debug, Deserialize)]
struct MateriaPrima {
    id: String,
    quantidade: f64,
}

#[derive(Debug, Deserialize)]
struct Pedido {
    produto_id: String,
    quantidade: f64,
    data_entrega: String,
}

fn carregar_produtos(caminho: &str) -> Vec<Produto> {
    let dados = fs::read_to_string(caminho).expect("Erro ao ler o arquivo de produtos.");
    serde_json::from_str(&dados).expect("Erro ao parsear o JSON de produtos.")
}

fn carregar_pedidos(caminho: &str) -> Vec<Pedido> {
    let dados = fs::read_to_string(caminho).expect("Erro ao ler o arquivo de pedidos.");
    serde_json::from_str(&dados).expect("Erro ao parsear o JSON de pedidos.")
}

