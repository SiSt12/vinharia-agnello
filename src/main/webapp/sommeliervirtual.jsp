<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <title>Sommelier Virtual — Vinharia Agnello</title>
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
        <a href="sommeliervirtual.jsp" class="menu-link active">Sommelier Virtual</a>
      </nav>
      <div class="auth">
        <a class="btn btn-light" href="login.jsp">Login</a>
        <a class="btn btn-dark" href="registrar.jsp">Registrar</a>
      </div>
    </div>
  </header>

  <section class="hero">
    <div class="container hero-inner">
      <h1 class="title">Sommelier Virtual</h1>
      <p class="subtitle">Deixe nosso Sommelier Virtual escolher o vinho perfeito para você.</p>
    </div>
  </section>
  <main class="container">
    <div class="sommelier-container">
      <div class="sommelier-step active" data-step="1">
        <h3 class="step-question">Qual é a ocasião?</h3>
        <div class="options-grid">
          <label class="option-label">
            <input type="radio" name="occasion" value="jantar">
            <span>Jantar especial</span>
          </label>
          <label class="option-label">
            <input type="radio" name="occasion" value="churrasco">
            <span>Churrasco com amigos</span>
          </label>
          <label class="option-label">
            <input type="radio" name="occasion" value="relaxar">
            <span>Relaxar sozinho(a)</span>
          </label>
        </div>
        <p class="step-error">Por favor, selecione uma opção.</p>
      </div>

      <div class="sommelier-step" data-step="2">
        <h3 class="step-question">Com o que você vai harmonizar?</h3>
        <div class="options-grid">
          <label class="option-label">
            <input type="radio" name="pairing" value="carne">
            <span>Carnes vermelhas</span>
          </label>
          <label class="option-label">
            <input type="radio" name="pairing" value="aves_peixes">
            <span>Aves ou peixes</span>
          </label>
          <label class="option-label">
            <input type="radio" name="pairing" value="massas_queijos">
            <span>Massas ou queijos</span>
          </label>
        </div>
        <p class="step-error">Por favor, selecione uma opção.</p>
      </div>

      <div class="sommelier-step" data-step="3">
        <h3 class="step-question">Qual seu paladar preferido?</h3>
        <div class="options-grid">
          <label class="option-label">
            <input type="radio" name="flavor" value="seco">
            <span>Seco e encorpado</span>
          </label>
          <label class="option-label">
            <input type="radio" name="flavor" value="frutado">
            <span>Leve e frutado</span>
          </label>
          <label class="option-label">
            <input type="radio" name="flavor" value="doce">
            <span>Levemente adocicado</span>
          </label>
        </div>
        <p class="step-error">Por favor, selecione uma opção.</p>
      </div>

      <div class="sommelier-step" id="recommendation-result">
      </div>
      <div class="step-nav">
        <button class="btn btn-ghost" id="prev-btn" style="display: none;">Voltar</button>
        <button class="btn btn-primary" id="next-btn">Próximo</button>
      </div>
    </div>
  </main>

  <footer class="footer">
    <div class="container"><small>© <%= java.time.Year.now() %> Vinharia Agnello</small></div>
  </footer>

  <style>
    .sommelier-container {
      max-width: 600px;
      margin: 2rem auto 4rem;
      background: var(--sand);
      padding: 2rem;
      border-radius: .75rem;
      box-shadow: var(--shadow);
    }
    .sommelier-step { display: none; }
    .sommelier-step.active { display: block; }
    .step-question {
      text-align: center;
      margin: 0 0 1.5rem;
      font-size: 1.4rem;
      color: var(--brown);
    }
    .options-grid {
      display: grid;
      gap: 1rem;
    }
    .option-label {
      display: block;
      background: var(--bg);
      padding: 1rem;
      border-radius: .5rem;
      border: 1px solid rgba(0,0,0,.1);
      cursor: pointer;
      transition: .2s ease;
    }
    .option-label:hover {
      transform: translateY(-2px);
      box-shadow: 0 4px 12px rgba(0,0,0,.08);
    }
    .option-label input[type="radio"] { display: none; }
    .option-label input[type="radio"]:checked + span {
      font-weight: bold;
      color: var(--brick);
    }
    .step-nav {
      display: flex;
      justify-content: space-between;
      margin-top: 2rem;
      border-top: 1px solid rgba(0,0,0,.1);
      padding-top: 1.5rem;
    }
    .step-error {
        color: var(--brick);
        font-size: 0.9rem;
        text-align: center;
        margin-top: 1rem;
        display: none;
    }
    #next-btn { margin-left: auto; }
    .sommelier-step {
        display: none;
        animation: fadeIn .4s ease;
    }
    @keyframes fadeIn { from { opacity: 0; transform: translateY(10px); } to { opacity: 1; transform: translateY(0); } }
    .recommendation-card {
      text-align: center;
    }
    .recommendation-card img {
      width: auto;
      height: 220px;
      object-fit: contain;
      border-radius: .5rem;
      margin-bottom: 1rem;
      background-color: var(--white);
    }
    .recommendation-title {
      font-size: 1.5rem;
      margin: 0 0 .5rem;
      color: var(--brown);
    }
    .recommendation-desc {
      margin: 0 0 1.5rem;
    }
    .recommendation-actions {
        display: flex;
        justify-content: center;
        gap: 1rem;
    }
  </style>

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

      const steps = document.querySelectorAll('.sommelier-step');
      const nextBtn = document.getElementById('next-btn');
      const prevBtn = document.getElementById('prev-btn');
      const sommelierContainer = document.querySelector('.sommelier-container');
      let currentStep = 1;
      const userAnswers = {};

      nextBtn.addEventListener('click', () => {
        if (currentStep < 3) {
          if (validateAndSaveStep(currentStep)) {
            currentStep++;
            showStep(currentStep);
          }
        } else {
          if (validateAndSaveStep(currentStep)) {
            displayRecommendation();
          }
        }
      });

      prevBtn.addEventListener('click', () => {
        if (currentStep > 1) {
          currentStep--;
          showStep(currentStep);
        }
      });

      function validateAndSaveStep(stepNumber) {
        const currentStepEl = document.querySelector(`.sommelier-step[data-step="${stepNumber}"]`);
        const errorEl = currentStepEl.querySelector('.step-error');
        const selectedOption = currentStepEl.querySelector('input:checked');

        if (!selectedOption) {
          errorEl.style.display = 'block';
          return false;
        }

        errorEl.style.display = 'none';
        userAnswers[selectedOption.name] = selectedOption.value;
        return true;
      }

      function showStep(stepNumber) {
        steps.forEach(step => step.classList.remove('active'));
        document.querySelector(`.sommelier-step[data-step="${stepNumber}"]`).classList.add('active');

        prevBtn.style.display = stepNumber > 1 ? 'inline-flex' : 'none';
        nextBtn.textContent = stepNumber === 3 ? 'Ver Recomendação' : 'Próximo';
      }

      function displayRecommendation() {
        const recommendation = getRecommendation(userAnswers);
        const resultContainer = document.getElementById('recommendation-result');

        resultContainer.innerHTML = `
          <div class="recommendation-card">
            <h3 class="step-question">Sua combinação perfeita é...</h3>
            <img src="${recommendation.image}" alt="${recommendation.name}" class="product-image">
            <h4 class="recommendation-title">${recommendation.name}</h4>
            <p class="recommendation-desc">${recommendation.description}</p>
            <div class="recommendation-actions">
                <button class="btn btn-primary btn-add-cart" data-id="${recommendation.id}" data-name="${recommendation.name}" data-price="${recommendation.price}" data-image="${recommendation.image}">Adicionar ao Carrinho</button>
                <button class="btn btn-ghost" id="restart-btn">Recomeçar</button>
            </div>
          </div>
        `;

        steps.forEach(step => step.classList.remove('active'));
        resultContainer.classList.add('active');
        document.querySelector('.step-nav').style.display = 'none';
      }

      function getRecommendation(answers) {
        if (answers.pairing === 'carne' || answers.flavor === 'seco') {
          return {
            id: 'p1',
            name: 'Vinho Tinto Agnello',
            description: 'Ideal para carnes vermelhas e paladares que apreciam sabores intensos e marcantes. Perfeito para um jantar sofisticado.',
            image: 'images/wine_1.png',
            price: 129.90
          };
        } else if (answers.pairing === 'aves_peixes' || answers.occasion === 'relaxar') {
          return {
            id: 'p2',
            name: 'Vinho Branco Suave',
            description: 'Refrescante e versátil, harmoniza bem com pratos leves como aves e peixes, ou para ser apreciado em um momento de relaxamento.',
            image: 'images/wine_2.png',
            price: 89.50
          };
        } else if (answers.flavor === 'doce' || answers.occasion === 'churrasco') {
          return {
            id: 'p4',
            name: 'Vinho Rosé',
            description: 'Uma escolha alegre e descontraída, ótima para socializar. Sua leve doçura e notas de frutas vermelhas agradam a todos.',
            image: 'images/wine_4.png',
            price: 99.00
          };
        } else {
          return {
            id: 'p3',
            name: 'Espumante Brut',
            description: 'Versátil e elegante, um espumante é sempre uma boa pedida para celebrar ou acompanhar uma variedade de queijos e entradas.',
            image: 'images/wine_3.png',
            price: 150.00
          };
        }
      }

      sommelierContainer.addEventListener('click', (e) => {
        if (e.target.id === 'restart-btn') {
            currentStep = 1;
            Object.keys(userAnswers).forEach(key => delete userAnswers[key]);
            showStep(1);
            document.querySelector('.step-nav').style.display = 'flex';
        }

        if (e.target.classList.contains('btn-add-cart')) {
            const button = e.target;
            const product = {
                id: button.dataset.id,
                name: button.dataset.name,
                price: parseFloat(button.dataset.price),
                image: button.dataset.image,
                quantity: 1
            };
            
            let cart = JSON.parse(sessionStorage.getItem('vinhariaCart')) || [];
            const existingProduct = cart.find(item => item.id === product.id);

            if (existingProduct) {
                existingProduct.quantity++;
            } else {
                cart.push(product);
            }

            sessionStorage.setItem('vinhariaCart', JSON.stringify(cart));
            updateCartBadge();

            button.textContent = 'Adicionado!';
            button.disabled = true;
        }
      });
    });
  </script>
</body>
</html>
