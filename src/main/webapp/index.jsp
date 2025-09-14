<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
    // Dados de exemplo (poderiam vir do banco/serviço)
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
  <link rel="stylesheet" href="styles.css">
</head>
<body>

  <!-- Topbar / Navbar -->
  <header class="topbar">
    <div class="container nav">
      <div class="brand">
        <span class="grape">🍇</span>
      </div>
      <nav class="menu">
        <a href="#" class="menu-link active">Sobre nós</a>
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

  <!-- Hero -->
  <section class="hero">
    <div class="container hero-inner">
      <h1 class="title">Vinharia Agnello</h1>
      <p class="subtitle">Vinhos selecionados</p>
      <div class="cta">
        <a href="selecao.jsp" class="btn btn-primary">Seleção Agnello</a>
        <a href="#" class="btn btn-ghost">Ver todos produtos</a>
      </div>
    </div>
  </section>

  <!-- Banner imagem (placeholder cinza) -->
  <section class="banner">
    <div class="container">
      <div class="image-placeholder">
        <div class="image-icon">🖼️</div>
      </div>
    </div>
  </section>

  <!-- Avaliações -->
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

</body>
</html>
