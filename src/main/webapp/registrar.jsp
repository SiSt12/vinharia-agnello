<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <title>Registrar — Vinharia Agnello</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="styles.css">
</head>
<body>
  <!-- NAV -->
  <header class="topbar">
    <div class="container nav">
      <div class="brand"><span class="grape">🍇</span></div>
      <nav class="menu">
        <a href="index.jsp" class="menu-link">Sobre nós</a>
        <a href="#" class="menu-link">Produtos</a>
        <a href="#" class="menu-link">Carrinho</a>
        <a href="#" class="menu-link">Sommelier Virtual</a>
      </nav>
      <div class="auth">
        <a class="btn btn-light" href="login.jsp">Login</a>
        <a class="btn btn-dark" href="registrar.jsp">Registrar</a>
      </div>
    </div>
  </header>

  <!-- FORM DE REGISTRO -->
  <section class="form-page">
    <div class="container">
      <h1 class="title" style="text-align:center;">Registrar</h1>

      <!-- Use "#" por enquanto para não depender de servlet -->
      <form class="form-box" method="post" action="#">
        <label for="nome">Nome</label>
        <input type="text" id="nome" name="nome" required>

        <label for="sobrenome">Sobrenome</label>
        <input type="text" id="sobrenome" name="sobrenome" required>

        <label for="email">Email</label>
        <input type="email" id="email" name="email" required>

        <label for="senha">Senha</label>
        <input type="password" id="senha" name="senha" minlength="6" required>

        <label for="endereco">Endereço para entregas</label>
        <input type="text" id="endereco" name="endereco" required>

        <button type="submit" class="btn btn-dark full">Registrar</button>
      </form>
    </div>
  </section>

  <footer class="footer">
    <div class="container"><small>© 2025 Vinharia Agnello</small></div>
  </footer>
</body>
</html>
