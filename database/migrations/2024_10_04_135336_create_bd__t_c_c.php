<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{

    public function up()
    {
        Schema::create('produtos', function (Blueprint $table) {
            $table->id('id_produto');
            $table->string('nome_produto', 100);
            $table->string('marca', 100);
            $table->timestamps();
        });

        Schema::create('mercados', function (Blueprint $table) {
            $table->id('id_mercado');
            $table->string('nome_mercado', 100);
            $table->timestamps();
        });

        Schema::create('produtos_caracteristicas', function (Blueprint $table) {
            $table->id('id_preco');
            $table->foreignId('id_produto')->constrained('produtos', 'id_produto');
            $table->foreignId('id_mercado')->constrained('mercados', 'id_mercado');
            $table->decimal('preco', 10, 2);
            $table->timestamps();
        });

        Schema::create('avaliacao_mercado', function (Blueprint $table) {
            $table->id('id_avaliacao_mercado');
            $table->foreignId('id_mercado')->constrained('mercados', 'id_mercado');
            $table->integer('avaliacao_mercado')->check('avaliacao BETWEEN 1 AND 5');
            $table->timestamps();
        });

        Schema::create('avaliacao_preco', function (Blueprint $table) {
            $table->id('id_avaliacao_preco');
            $table->enum('avaliacao_preco', ['Correto', 'Incorreto']);
            $table->foreignId('id_produto')->constrained('produtos', 'id_produto');
            $table->foreignId('id_mercado')->constrained('mercados', 'id_mercado');
            $table->timestamps();
        });

        Schema::create('favoritos', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained()->onDelete('cascade');
            $table->foreignId('id_produto')->constrained()->onDelete('cascade');
            $table->foreignId('id_mercado')->constrained()->onDelete('cascade');
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('avaliacao_preco');
        Schema::dropIfExists('avaliacao_mercado');
        Schema::dropIfExists('produtos_caracteristicas');
        Schema::dropIfExists('mercados');
        Schema::dropIfExists('produtos');
        Schema::dropIfExists('favoritos');
    }
};