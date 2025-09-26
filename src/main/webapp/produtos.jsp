<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.util.List, java.util.ArrayList, java.text.NumberFormat, java.util.Locale" %>
<%
  class Product {
    String id, name, type, image;
    double price;
    Product(String id, String name, String type, double price, String image) {
      this.id = id; this.name = name; this.type = type; this.price = price; this.image = image;
    }
  }
  List<Product> products = new ArrayList<>();
  products.add(new Product("p1", "Vinho Tinto Agnello", "Tinto Seco", 129.90, "images/wine_1.png"));
  products.add(new Product("p2", "Vinho Branco Suave", "Branco Suave", 89.50, "images/wine_2.png"));
  products.add(new Product("p3", "Espumante Brut", "Espumante", 150.00, "images/wine_3.png"));
  products.add(new Product("p4", "Vinho Rosé", "Rosé Seco", 99.00, "images/wine_4.png"));
  products.add(new Product("p5", "Vinho do Porto", "Tinto Licoroso", 250.80, "images/wine_5.png"));
  products.add(new Product("p6", "Kit Harmonização", "Seleção", 320.00, "images/wine_6.png"));

  NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(new Locale("pt", "BR"));
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <title>Produtos — Vinharia Agnello</title>
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
        <a href="produtos.jsp" class="menu-link active">Produtos</a>
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
      <h1 class="title">Nossos Produtos</h1>
      <p class="subtitle">Qualidade e variedade que você encontra aqui.</p>
    </div>
  </section>
  <main class="container">
    <div class="product-grid">
      <% for (Product p : products) { %>
        <div class="product-card"
             data-id="<%= p.id %>"
             data-name="<%= p.name %>"
             data-price="<%= p.price %>"
             data-image="<%= p.image %>">

          <img src="<%= p.image %>" alt="<%= p.name %>" class="product-image">
          <div class="product-info">
            <h3 class="product-name"><%= p.name %></h3>
            <p class="product-type"><%= p.type %></p>
            <div class="product-buy">
              <span class="product-price"><%= currencyFormatter.format(p.price) %></span>
              <button class="btn btn-primary btn-add-cart">Adicionar</button>
            </div>
          </div>
        </div>
      <% } %>
    </div>
  </main>

  <footer class="footer">
    <div class="container"><small>© <%= java.time.Year.now() %> Vinharia Agnello</small></div>
  </footer>

  <style>
    .product-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
      gap: 1.5rem;
      padding: 2rem 0 4rem;
    }
    .product-card {
      background: var(--white);
      border-radius: .75rem;
      box-shadow: var(--shadow);
      overflow: hidden;
      display: flex;
      flex-direction: column;
      transition: transform .2s ease;
    }
    .product-card:hover { transform: translateY(-4px); }
    .product-image { width: 100%; height: 200px; object-fit: contain; background-color: #eee; }
    .product-info { padding: 1rem; display: flex; flex-direction: column; flex-grow: 1; }
    .product-name { margin: 0 0 .25rem; font-size: 1.1rem; }
    .product-type { margin: 0 0 1rem; color: #666; font-size: .9rem; flex-grow: 1; }
    .product-buy { display: flex; justify-content: space-between; align-items: center; }
    .product-price { font-weight: bold; font-size: 1.2rem; }
    .btn-add-cart.added { background-color: var(--camel); cursor: default; }
  </style>

  <script>
    document.addEventListener('DOMContentLoaded', () => {
      const productGrid = document.querySelector('.product-grid');
      updateCartBadge();
      productGrid.addEventListener('click', (e) => {
        if (!e.target.classList.contains('btn-add-cart')) return;
        const button = e.target;
        const card = button.closest('.product-card');
        const product = {
          id: card.dataset.id,
          name: card.dataset.name,
          price: parseFloat(card.dataset.price),
          image: card.dataset.image,
          quantity: 1
        };
        addToCart(product, button);
      });

      function addToCart(product, button) {
        let cart = JSON.parse(sessionStorage.getItem('vinhariaCart')) || [];
        const existingProduct = cart.find(item => item.id === product.id);
        if (existingProduct) {
          existingProduct.quantity++;
        } else {
          cart.push(product);
        }
        sessionStorage.setItem('vinhariaCart', JSON.stringify(cart));

        button.textContent = 'Adicionado!';
        button.classList.add('added');
        setTimeout(() => {
          button.textContent = 'Adicionar';
          button.classList.remove('added');
        }, 1500);
        
        updateCartBadge();
      }
      
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
    });
  </script>
</body>
</html>
