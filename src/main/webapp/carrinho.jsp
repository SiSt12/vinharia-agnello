<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <title>Carrinho — Vinharia Agnello</title>
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
        <a href="carrinho.jsp" class="menu-link active">Carrinho<span class="cart-badge"></span></a>
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
      <h1 class="title">Meu Carrinho</h1>
      <p class="subtitle">Confira os itens antes de finalizar a compra.</p>
    </div>
  </section>
  <main class="container">
    <div class="cart-empty" style="display: none;">
      <p>Seu carrinho está vazio.</p>
      <a href="produtos.jsp" class="btn btn-primary">Ver produtos</a>
    </div>

    <div class="cart-layout" style="display: none;">
      <div class="cart-items"></div>
      <aside class="cart-summary"></aside>
    </div>
  </main>
  <div id="login-modal-overlay" class="modal-overlay" style="display: none;">
    <div class="modal-content">
      <h3>Login Necessário</h3>
      <p>Você precisa estar logado para finalizar sua compra.</p>
      <div class="modal-actions">
        <button id="modal-cancel-btn" class="btn btn-ghost">Cancelar</button>
        <a id="modal-login-btn" href="login.jsp" class="btn btn-primary">Fazer Login</a>
      </div>
    </div>
  </div>

  <footer class="footer">
    <div class="container"><small>© <%= java.time.Year.now() %> Vinharia Agnello</small></div>
  </footer>

  <style>
    .cart-layout { display: grid; grid-template-columns: 2fr 1fr; gap: 2rem; align-items: start; margin: 2rem 0; }
    .cart-item { display: flex; align-items: center; gap: 1rem; padding-bottom: 1.5rem; margin-bottom: 1.5rem; border-bottom: 1px solid #eee; }    .cart-item-image { width: 96px; height: 96px; object-fit: contain; background-color: #eee; border-radius: 4px; }
    .cart-item-details { flex-grow: 1; }
    .cart-item-title { margin: 0 0 0.25rem; font-size: 1.1rem; }
    .cart-item-price { margin: 0; color: #666; }
    .cart-item-remove { font-size: 0.8rem; color: var(--brick); text-decoration: none; }
    .cart-item-actions { text-align: right; }

    .quantity-control { display: flex; align-items: center; justify-content: flex-end; gap: 0.5rem; }
    .btn-qty {
      background-color: #eee; border: 1px solid #ddd; width: 28px; height: 28px;
      border-radius: 50%; cursor: pointer; font-size: 1rem; line-height: 1;
      display: flex; align-items: center; justify-content: center;
    }
    .quantity-value { font-weight: 500; min-width: 20px; text-align: center; }

    .cart-item-total { font-weight: bold; margin: 0.5rem 0 0; }
    .cart-summary { border: 1px solid #eee; border-radius: 8px; padding: 1.5rem; background-color: #fafafa; }
    .summary-title { margin-top: 0; margin-bottom: 1.5rem; }
    .summary-row { display: flex; justify-content: space-between; margin-bottom: 1rem; }
    .summary-row.total { font-size: 1.2rem; font-weight: bold; border-top: 1px solid #eee; padding-top: 1rem; }
    .summary-actions { margin-top: 1.5rem; }
    .btn-block { display: block; text-align: center; width: 100%; margin-bottom: 0.5rem; }
    .cart-empty { text-align: center; padding: 4rem 0; margin: 2rem 0; }

    .modal-overlay {
      position: fixed; top: 0; left: 0; width: 100%; height: 100%;
      background: rgba(0,0,0,0.6);
      display: flex; align-items: center; justify-content: center;
      z-index: 1000;
      animation: fadeIn .2s ease;
    }
    .modal-content {
      background: var(--white); padding: 2rem; border-radius: .75rem;
      box-shadow: var(--shadow); text-align: center; max-width: 400px;
    }
    .modal-content h3 { margin: 0 0 .5rem; color: var(--brown); }
    .modal-actions { display: flex; gap: 1rem; justify-content: center; margin-top: 1.5rem; }

    @media (max-width: 768px) { .cart-layout { grid-template-columns: 1fr; } }
  </style>

  <script>
    document.addEventListener('DOMContentLoaded', () => {
      const cartLayout = document.querySelector('.cart-layout');
      const cartItemsContainer = document.querySelector('.cart-items');
      const cartSummaryContainer = document.querySelector('.cart-summary');
      const cartEmptyContainer = document.querySelector('.cart-empty');
      const currencyFormatter = new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' });

      loadAndRenderCart();

      function loadAndRenderCart() {
        const cart = JSON.parse(sessionStorage.getItem('vinhariaCart')) || [];

        if (cart.length === 0) {
          showEmptyCart();
          return;
        }

        cartLayout.style.display = 'grid';
        cartEmptyContainer.style.display = 'none';

        cartItemsContainer.innerHTML = '';
        cart.forEach(item => {
          cartItemsContainer.innerHTML += createCartItemHTML(item);
        });

        updateCartSummary();
        updateCartBadge();
      }

      function createCartItemHTML(item) {
        const itemTotal = item.price * item.quantity;
        return `
          <div class="cart-item" data-id="${item.id}" data-price="${item.price}">
            <img src="${item.image}" alt="Garrafa de ${item.name}" class="cart-item-image">
            <div class="cart-item-details">
              <h3 class="cart-item-title">${item.name}</h3>
              <p class="cart-item-price">${currencyFormatter.format(item.price)}</p>
              <a href="#" class="cart-item-remove" data-action="remove">Remover</a>
            </div>
            <div class="cart-item-actions">
              <div class="quantity-control">
                <button class="btn-qty" data-action="decrease">-</button>
                <span class="quantity-value">${item.quantity}</span>
                <button class="btn-qty" data-action="increase">+</button>
              </div>
              <p class="cart-item-total">${currencyFormatter.format(itemTotal)}</p>
            </div>
          </div>
        `;
      }

      function updateCartSummary() {
        const allItems = document.querySelectorAll('.cart-items .cart-item');
        let subtotal = 0;

        allItems.forEach(item => {
          const price = parseFloat(item.dataset.price);
          const quantity = parseInt(item.querySelector('.quantity-value').textContent, 10);
          subtotal += price * quantity;
        });

        cartSummaryContainer.innerHTML = `
          <h2 class="summary-title">Resumo do Pedido</h2>
          <div class="summary-row">
            <span>Subtotal</span>
            <span>${currencyFormatter.format(subtotal)}</span>
          </div>
          <div class="summary-row">
            <span>Frete</span>
            <span>Grátis</span>
          </div>
          <div class="summary-row total">
            <span>Total</span>
            <span>${currencyFormatter.format(subtotal)}</span>
          </div>
          <div class="summary-actions">
            <a href="checkout.jsp" id="checkout-btn" class="btn btn-primary btn-block">Finalizar Compra</a>
            <a href="produtos.jsp" class="btn btn-ghost btn-block">Continuar Comprando</a>
          </div>
        `;

        if (allItems.length === 0) {
          showEmptyCart();
        }
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

      function showEmptyCart() {
        cartLayout.style.display = 'none';
        cartEmptyContainer.style.display = 'block';
      }

      cartLayout.addEventListener('click', (e) => {
        const target = e.target;
        const action = target.dataset.action;
        if (!action) return;

        const cartItem = target.closest('.cart-item');
        if (!cartItem) return;
        const itemId = cartItem.dataset.id;

        let cart = JSON.parse(sessionStorage.getItem('vinhariaCart')) || [];
        const itemInCart = cart.find(item => item.id === itemId);
        if (!itemInCart) return;

        if (action === 'remove') {
          cart = cart.filter(item => item.id !== itemId);
        } else if (action === 'increase' || action === 'decrease') {
          if (action === 'increase') {
            itemInCart.quantity++;
          } else if (action === 'decrease') {
            itemInCart.quantity--;
          }

          if (itemInCart.quantity <= 0) {
            cart = cart.filter(item => item.id !== itemId);
          }
        }

        sessionStorage.setItem('vinhariaCart', JSON.stringify(cart));
        loadAndRenderCart();
      });

      const loginModalOverlay = document.getElementById('login-modal-overlay');
      const modalLoginBtn = document.getElementById('modal-login-btn');
      const modalCancelBtn = document.getElementById('modal-cancel-btn');

      document.body.addEventListener('click', (e) => {
        if (e.target.id === 'checkout-btn') {
          e.preventDefault();

          const isLoggedIn = sessionStorage.getItem('isLoggedIn') === 'true';

          if (isLoggedIn) {
            window.location.href = e.target.href;
          } else {
            modalLoginBtn.href = `login.jsp?redirect=${e.target.href}`;
            loginModalOverlay.style.display = 'flex';
          }
        }
      });
      modalCancelBtn.addEventListener('click', () => {
        loginModalOverlay.style.display = 'none';
      });

      loginModalOverlay.addEventListener('click', (e) => {
        if (e.target === loginModalOverlay) {
          loginModalOverlay.style.display = 'none';
        }
      });
    });
  </script>
</body>
</html>
