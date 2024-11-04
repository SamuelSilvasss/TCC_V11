<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ProdutosCaracteristicas;

class ProdutosCaracteristicasController extends Controller
{
    public function cadastro_preco(Request $request)
{

    $validatedData = $request->validate([
        'product_id' => 'required|exists:produtos,id_produto',
        'market_id' => 'required|exists:mercados,id_mercado',
        'preco' => 'required|numeric',
    ]);

    // Criando a avaliação no banco com os campos corretos
    ProdutosCaracteristicas::create([
        'id_produto' => $validatedData['product_id'], // Usando id_produto
        'id_mercado' => $validatedData['market_id'],   // Usando id_mercado
        'preco' => $validatedData['preco'],
    ]);

    return redirect()->back()->with('success', 'Preço registrado com sucesso!');
}

}
