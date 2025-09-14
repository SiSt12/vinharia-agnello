<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <title>Seleção Agnello — Vinharia Agnello</title>
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

  <!-- HERO -->
  <section class="hero">
    <div class="container hero-inner">
      <h1 class="title">Seleção Agnello</h1>
      <p class="subtitle">Deixe que nós cuidemos da curadoria</p>
    </div>
  </section>

  <!-- SWITCH BILLING -->
  <section class="billing container">
    <button class="chip chip-active" id="mensalBtn" aria-pressed="true">Mensal</button>
    <button class="chip" id="anualBtn" aria-pressed="false">Anual 20%OFF</button>
  </section>

  <!-- PRICING -->
  <section class="pricing container">
    <!-- Plano básico -->
    <article class="plan plan-light">
      <h3 class="plan-title">Agnello</h3>
      <div class="price-wrap">
        <span class="currency">R$</span><span class="price" data-m="50" data-a="40">50</span><span class="per">/mo</span>
      </div>
      <ul class="features">
        <li>Recebe 1 garrafa de vinho selecionado</li>
        <li>Tipo de vinho aleatório</li>
        <li>Entrega inclusa no preço mensal</li>
      </ul>
      <button class="btn btn-brown full">Assinar</button>
    </article>

    <!-- Plano pro -->
    <article class="plan plan-dark">
      <h3 class="plan-title">Agnello Pro</h3>
      <div class="price-wrap">
        <span class="currency">R$</span><span class="price" data-m="80" data-a="64">80</span><span class="per">/mo</span>
      </div>
      <ul class="features">
        <li>Recebe 2 garrafas de vinho mensalmente</li>
        <li>Tipo de vinho escolhido por você previamente</li>
        <li>Entrega inclusa no preço mensal</li>
        <li>Acúmulo de pontos para descontos</li>
      </ul>
      <button class="btn btn-light full">Assinar</button>
    </article>
  </section>

  <!-- FAQ -->
  <section class="faq container">
    <h2 class="reviews-title" style="text-align:center;margin-top:1rem;">FAQ</h2>

    <div class="accordion">
      <button class="acc-head">Title</button>
      <div class="acc-body">
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum feugiat rutrum eleifend. Praesent ultricies mauris id tortor bibendum, et dictum.</p>
      </div>

      <button class="acc-head">Title</button>
      <div class="acc-body"><p>Conteúdo do item 2.</p></div>

      <button class="acc-head">Title</button>
      <div class="acc-body"><p>Conteúdo do item 3.</p></div>
    </div>
  </section>

  <footer class="footer">
    <div class="container"><small>© <%= java.time.Year.now() %> Vinharia Agnello</small></div>
  </footer>

  <script>
    // Toggle mensal/anual (apenas atualiza números na tela)
    const mensalBtn = document.getElementById('mensalBtn');
    const anualBtn  = document.getElementById('anualBtn');
    const prices = document.querySelectorAll('.price');

    function setMensal(activeMensal){
      prices.forEach(p=>{
        p.textContent = activeMensal ? p.dataset.m : p.dataset.a;
      });
      mensalBtn.classList.toggle('chip-active', activeMensal);
      anualBtn.classList.toggle('chip-active', !activeMensal);
      mensalBtn.setAttribute('aria-pressed', activeMensal);
      anualBtn.setAttribute('aria-pressed', !activeMensal);
    }
    mensalBtn.addEventListener('click', ()=>setMensal(true));
    anualBtn.addEventListener('click', ()=>setMensal(false));

    // Accordion
    document.querySelectorAll('.acc-head').forEach(h=>{
      h.addEventListener('click', ()=>{
        h.classList.toggle('open');
        const body = h.nextElementSibling;
        body.style.maxHeight = body.style.maxHeight ? null : body.scrollHeight + 'px';
      });
    });
    // estado inicial
    setMensal(true);
  </script>
</body>
</html>
