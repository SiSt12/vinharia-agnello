<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <title>Seleção Agnello — Vinharia Agnello</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" href="data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 100 100%22><text y=%22.9em%22 font-size=%2290%22>🍇</text></svg>">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;600;700;800&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="styles.css">
</head>
<body>

  <!-- NAV -->
  <header class="topbar">
    <div class="container nav">
      <div class="brand"><span class="grape">🍇</span></div>
      <nav class="menu">
        <a href="index.jsp" class="menu-link">Sobre nós</a>
        <a href="produtos.jsp" class="menu-link">Produtos</a>
        <a href="carrinho.jsp" class="menu-link">Carrinho</a>
        <a href="sommeliervirtual.jsp" class="menu-link">Sommelier Virtual</a>
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
      <button class="acc-head">Como funciona a Seleção Agnello?</button>
      <div class="acc-body">
        <p>A Seleção Agnello é nosso clube de assinatura de vinhos. Todo mês, você recebe em casa uma ou mais garrafas de vinhos selecionados por nossa equipe de especialistas, dependendo do plano escolhido. É a forma mais fácil de descobrir novos rótulos com total comodidade.</p>
      </div>

      <button class="acc-head">Qual a diferença entre os planos Agnello e Agnello Pro?</button>
      <div class="acc-body">
        <p>O plano <strong>Agnello</strong> é ideal para quem está começando a explorar o mundo dos vinhos, com o envio de 1 garrafa surpresa por mês. Já o plano <strong>Agnello Pro</strong> é para os entusiastas: você recebe 2 garrafas, pode escolher o tipo de vinho que prefere receber e ainda acumula pontos para trocar por descontos em nossa loja.</p>
      </div>

      <button class="acc-head">Como funciona o desconto do plano anual?</button>
      <div class="acc-body">
        <p>Ao optar pelo plano anual, você realiza um pagamento único que cobre 12 meses de assinatura. Como recompensa pela sua fidelidade, nós oferecemos um desconto de 20% sobre o valor total que você pagaria no plano mensal, tornando sua experiência ainda mais vantajosa.</p>
      </div>

      <button class="acc-head">Posso cancelar quando quiser?</button>
      <div class="acc-body">
        <p>Sim! Nossos planos mensais não possuem fidelidade e podem ser cancelados a qualquer momento, sem taxas ou multas. Para o plano anual, o cancelamento pode ser solicitado, e as condições de reembolso serão avaliadas com base no tempo restante da assinatura.</p>
      </div>
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
