console.log("Arquivo JS carregado!");

let produtosArray = []; // Array global para armazenar os produtos
let produtosVisiveis = []; // Array para armazenar os produtos atualmente visíveis

document.addEventListener('DOMContentLoaded', () => {
    console.log("DOM totalmente carregado");

    // Inicializa os produtos
    produtosArray = Array.from(document.getElementsByClassName('product-card'));
    produtosVisiveis = [...produtosArray]; // Preenche produtos visíveis com todos os produtos no início

    console.log("Produtos encontrados: ", produtosArray);

    // Adiciona eventos para os inputs de pesquisa
    const produtoInput = document.getElementById('produtoDigitado');
    const mercadoInput = document.getElementById('mercadoDigitado');

    if (produtoInput && mercadoInput) {
        produtoInput.addEventListener('input', pesquisar);
        mercadoInput.addEventListener('input', pesquisar);
    } else {
        console.log("Campos de input de pesquisa não foram encontrados.");
    }

    organizarProdutos(); // Chama a função de organizar produtos

    // Aplica as estrelas de avaliação inicialmente
    aplicarEventosEstrelas();
}
);


// FUNÇÃO UTILIZADA PARA AVALIAR MERCADOS
function configurarEstrelas(seletor, hiddenInputId) {
    const estrelas = document.querySelectorAll(seletor);
    const hiddenInput = document.getElementById(hiddenInputId);

    if (estrelas.length > 0 && hiddenInput) {
        console.log("Estrelas encontradas: ", estrelas);
        estrelas.forEach(star => {
            star.addEventListener('click', () => {
                const value = star.getAttribute('data-value');
                hiddenInput.value = value; // Define o valor do input oculto
                console.log("Avaliação clicada: ", value);

                estrelas.forEach(s => {
                    s.classList.remove('fas', 'far');
                    if (s.getAttribute('data-value') <= value) {
                        s.classList.add('fas'); // Adiciona a classe 'fas' para estrelas preenchidas
                    } else {
                        s.classList.add('far'); // Adiciona a classe 'far' para estrelas vazias
                    }
                });
            });
        });
    } else {
        console.log(`Estrelas ou input não encontrados para o seletor: ${seletor} e o hiddenInputId: ${hiddenInputId}`);
    }
}

// Função para reaplicar eventos de avaliação nas estrelas
function aplicarEventosEstrelas() {
    configurarEstrelas('.avaliacaoMercado1 i', 'avaliacao_mercado1');
    configurarEstrelas('.avaliacaoMercado2 i', 'avaliacao_mercado2');
    configurarEstrelas('.avaliacaoMercado3 i', 'avaliacao_mercado3');
    configurarEstrelas('.avaliacaoMercado4 i', 'avaliacao_mercado4');
}


//FUNÇÕES QUE ATUALIZAM A POSIÇÃO DOS PRODUTOS NA PÁGINA

// Função para pesquisar produtos
function pesquisar() {
    const inputProduto = document.getElementById('produtoDigitado').value.toLowerCase();
    const inputMercado = document.getElementById('mercadoDigitado').value.toLowerCase();

    // Filtra os produtos de acordo com a pesquisa
    produtosVisiveis = produtosArray.filter(produto => {
        const produtoNome = produto.getElementsByClassName('product-name')[0].textContent.toLowerCase();
        const mercadoNome = produto.getElementsByClassName('market-name')[0].textContent.toLowerCase();
        return produtoNome.includes(inputProduto) && mercadoNome.includes(inputMercado);
    });

    console.log("Produtos visíveis após pesquisa: ", produtosVisiveis);
    atualizarProdutosContainer(produtosVisiveis); // Atualiza o container com produtos visíveis
}

// Função para organizar produtos
function organizarProdutos() {
    const radios = document.querySelectorAll('input[name="flexRadioDefault"]');

    radios.forEach(radio => {
        radio.addEventListener('change', function () {
            if (this.checked) {
                console.log("Opção de ordenação selecionada: ", this.id);
                let produtosOrdenados = [...produtosVisiveis]; // Cópia dos produtos visíveis

                produtosOrdenados.sort((a, b) => {
                    const priceElementA = a.getElementsByClassName('product-price')[0];
                    const priceElementB = b.getElementsByClassName('product-price')[0];
                    const dateElementA = a.getElementsByClassName('product-date')[0];
                    const dateElementB = b.getElementsByClassName('product-date')[0];
                    const quantityElementA = a.querySelector('#product-quantity strong');
                    const quantityElementB = b.querySelector('#product-quantity strong');

                    // Verifica qual tipo de ordenação foi selecionado
                    if (this.id === 'opcaoBarato' || this.id === 'opcaoCaro') {
                        // Ordenação por preço
                        if (!priceElementA || !priceElementB) {
                            console.error("Elemento de preço não encontrado:", priceElementA, priceElementB);
                            return 0;
                        }

                        console.log("Texto do preço A:", priceElementA.innerText);
                        console.log("Texto do preço B:", priceElementB.innerText);

                        const precoA = parseFloat(priceElementA.innerText.replace('R$', '').replace('.', '').replace(',', '.').trim());
                        const precoB = parseFloat(priceElementB.innerText.replace('R$', '').replace('.', '').replace(',', '.').trim());

                        if (isNaN(precoA) || isNaN(precoB)) {
                            console.error("Erro ao converter preços:", precoA, precoB);
                            return 0;
                        }

                        return this.id === 'opcaoBarato' ? precoA - precoB : precoB - precoA;

                    } else if (this.id === 'opcaoRecente' || this.id === 'opcaoAntigo') {
                        // Ordenação por data
                        if (!dateElementA || !dateElementB) {
                            console.error("Elemento de data não encontrado:", dateElementA, dateElementB);
                            return 0;
                        }

                        console.log("Texto da data A:", dateElementA.innerText);
                        console.log("Texto da data B:", dateElementB.innerText);

                        const dataRegex = /(\d{2}\/\d{2}\/\d{4} \d{2}:\d{2}:\d{2})/;
                        const matchA = dateElementA.innerText.match(dataRegex);
                        const matchB = dateElementB.innerText.match(dataRegex);

                        const dataA = matchA ? new Date(matchA[0].split('/').reverse().join('-')) : null;
                        const dataB = matchB ? new Date(matchB[0].split('/').reverse().join('-')) : null;

                        // Tratamento para datas inválidas
                        if (!dataA || isNaN(dataA)) {
                            console.warn("Data inválida em A:", dateElementA.innerText);
                        }
                        if (!dataB || isNaN(dataB)) {
                            console.warn("Data inválida em B:", dateElementB.innerText);
                        }

                        // Definindo datas inválidas como maiores ou menores, dependendo da ordenação
                        if (!dataA && !dataB) return 0;
                        if (!dataA) return this.id === 'opcaoRecente' ? 1 : -1;
                        if (!dataB) return this.id === 'opcaoRecente' ? -1 : 1;

                        return this.id === 'opcaoRecente' ? dataB - dataA : dataA - dataB;

                    } else if (this.id === 'opcaoAvaliacao') {
                        // Ordenação por quantidade de avaliações corretas
                        if (!quantityElementA || !quantityElementB) {
                            console.error("Elemento de quantidade não encontrado:", quantityElementA, quantityElementB);
                            return 0;
                        }

                        const quantidadeA = parseInt(quantityElementA.innerText.trim(), 10);
                        const quantidadeB = parseInt(quantityElementB.innerText.trim(), 10);

                        return quantidadeB - quantidadeA;
                    }
                });

                // Atualiza o container com os produtos organizados
                atualizarProdutosContainer(produtosOrdenados);
            }
        });
    });
}


// Função para atualizar o container de produtos
function atualizarProdutosContainer(produtos) {
    const produtosContainer = document.getElementById('produtos-container');
    produtosContainer.innerHTML = ''; // Limpa o container

    produtos.forEach(produto => {
        const colDiv = document.createElement('div'); // Cria um novo elemento div para a coluna
        colDiv.classList.add('col-lg-4', 'col-md-6', 'mb-4'); // Adiciona classes para estilo
        colDiv.appendChild(produto); // Adiciona o card dentro da nova coluna
        produtosContainer.appendChild(colDiv); // Adiciona a coluna ao container
    });

    // Reaplica os eventos das estrelas após a atualização dos produtos
    aplicarEventosEstrelas();
}