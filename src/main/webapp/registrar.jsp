<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <title>Registrar — Vinharia Agnello</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" href="data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 100 100%22><text y=%22.9em%22 font-size=%2290%22>🍇</text></svg>">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;600;700;800&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="styles.css">
</head>
<body>
  <header class="topbar">
    <div class="container nav">
      <div class="brand"><span class="grape">🍇</span></div>
      <nav class="menu">
        <a href="index.jsp" class="menu-link">Sobre nós</a>
        <a href="produtos.jsp" class="menu-link">Produtos</a>
        <a href="carrinho.jsp" class="menu-link">Carrinho<span class="cart-badge"></span></a>
        <a href="sommeliervirtual.jsp" class="menu-link">Sommelier Virtual</a>
      </nav>
      <div class="auth">
        <a class="btn btn-light" href="login.jsp">Login</a>
        <a class="btn btn-dark" href="registrar.jsp">Registrar</a>
      </div>
    </div>
  </header>

  <section class="form-page">
    <div class="container">
      <h1 class="title" style="text-align:center;">Registrar</h1>
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
    <div class="container"><small>© <%= java.time.Year.now() %> Vinharia Agnello</small></div>
  </footer>

  <script>
    document.addEventListener('DOMContentLoaded', () => {
      function updateCartBadge() {
        const cart = JSON.parse(sessionStorage.getItem('vinhariaCart')) || [];
        const badge = document.querySelector('.cart-badge');
        if (!badge) return;

        const totalItems = cart.reduce((sum, item) => sum + item.quantity, 0);

        if (totalItems > 0) {
          badge.textContent = totalItems;
          badge.classList.add('visible');
        } else {
          badge.classList.remove('visible');
        }
      }

      updateCartBadge();
    });
  </script>
</body>
</html>
