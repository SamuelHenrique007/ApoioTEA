<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ApoioTEA</title>
    <link rel="stylesheet" href="css/Cadastro.css">
</head>
<body>
    <header class="barra topo">
        <h1 class="logo">ApoioTEA</h1>
    </header>
    <main>
        <div class="container">
            <h1>Cadastro</h1>
            <form id="cadastroForm">
                <label for="tipo">Eu sou:</label>
                <select id="tipo" name="tipo" required onchange="mostrarCamposEspecificos()">
                    <option value="">Selecione</option>
                    <option value="voluntario">Volunt�rio</option>
                    <option value="familia">Fam�lia</option>
                </select>
                <label for="nome">Nome:</label>
                <input type="text" id="nome" name="nome" required>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>

                <label for="senha">Senha:</label>
                <input type="password" id="senha" name="senha" required>

                <label for="cidade">Cidade:</label>
                <input type="text" id="cidade" name="cidade" required>

                <label for="estado">Estado:</label>
                <input type="text" id="estado" name="estado" required>

                <label for="descricao">Descri��o:</label>
                <textarea id="descricao" name="descricao" rows="3" required></textarea>
                <div id="voluntarioCampos" class="especificos">
                    <label for="experiencia">Experi�ncia:</label>
                    <textarea id="experiencia" name="experiencia" rows="3" required></textarea>

                    <label for="habilidades">Habilidades:</label>
                    <textarea id="habilidades" name="habilidades" rows="3" required></textarea>
                </div>
                <div id="familiaCampos" class="especificos">
                </div>

                <button type="submit">Cadastrar-se</button>
            </form>
        </div>
    </main>
    <footer class="barra rodape">
       
    </footer>

    <script src="Js/script.js"></script>
    <script>
        function mostrarCamposEspecificos() {
            const tipo = document.getElementById("tipo").value;
            const voluntarioCampos = document.getElementById("voluntarioCampos");
            const familiaCampos = document.getElementById("familiaCampos");
            voluntarioCampos.style.display = "none";
            familiaCampos.style.display = "none";
            if (tipo === "voluntario") {
                voluntarioCampos.style.display = "block";
            } else if (tipo === "familia") {
                familiaCampos.style.display = "block";
            }
        }
    </script>
</body>
</html>