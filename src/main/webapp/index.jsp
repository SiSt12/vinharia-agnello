<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
    class Review {
        String name, text, avatar;
        Review(String n, String t, String a){name=n;text=t;avatar=a;}
    }
    java.util.List<Review> reviews = new java.util.ArrayList<>();
    reviews.add(new Review("Ana Souza", "Lorem ipsum dolor sit amet, consectetur.", "https://i.pravatar.cc/48?img=1"));
    reviews.add(new Review("Carlos Lima", "Excelente seleção e atendimento impecável.", "https://i.pravatar.cc/48?img=2"));
    reviews.add(new Review("João Pedro", "Descobri rótulos que eu nem conhecia!", "https://i.pravatar.cc/48?img=3"));
    reviews.add(new Review("Mariana G.", "Entrega rápida e embalagem premium.", "https://i.pravatar.cc/48?img=4"));
    reviews.add(new Review("Beatriz", "Sommelier virtual ajudou demais na escolha.", "https://i.pravatar.cc/48?img=5"));
    reviews.add(new Review("Rafael", "Voltarei a comprar. Recomendo!", "https://i.pravatar.cc/48?img=6"));
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <title>Vinharia Agnello</title>
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
      <div class="brand">
        <span class="grape">🍇</span>
      </div>
      <nav class="menu">
        <a href="index.jsp" class="menu-link active">Sobre nós</a>
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

  <section class="hero">
    <div class="container hero-inner">
      <h1 class="title">Vinharia Agnello</h1>
      <p class="subtitle">Vinhos selecionados</p>
      <div class="cta">
        <a href="selecao.jsp" class="btn btn-primary">Seleção Agnello</a>
        <a href="produtos.jsp" class="btn btn-ghost">Ver todos produtos</a>
      </div>
    </div>
  </section>

  <section class="banner">
    <div class="container">
      <img src="images/wine-index.jpg" alt="Garrafas de vinho em exposição" class="banner-image">
    </div>
  </section>
  <section class="reviews">
    <div class="container">
      <h2 class="reviews-title">Avaliações</h2>

      <div class="grid">
        <%
          for(Review r : reviews){
        %>
        <article class="card">
          <p class="card-text"><%= r.text %></p>
          <div class="card-user">
            <img class="avatar" src="<%= r.avatar %>" alt="Foto de <%= r.name %>">
            <span class="username"><%= r.name %></span>
          </div>
        </article>
        <% } %>
      </div>
    </div>
  </section>

  <footer class="footer">
    <div class="container">
      <small>© <%= java.time.Year.now() %> Vinharia Agnello — Todos os direitos reservados.</small>
    </div>
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
