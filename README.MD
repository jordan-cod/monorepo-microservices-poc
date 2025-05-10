# PoC - Monorepo com Microserviços e Docker

Esta PoC foi criada para validar uma arquitetura onde um **monorepo** gerencia múltiplos **microserviços**, cada um isolado em seu próprio repositório Git e orquestrado com Docker.

---

## Problema

Trabalhar com múltiplos microserviços espalhados em repositórios diferentes tem gerado bastante frustração. Toda vez que preciso testar algo que envolve mais de um serviço, a experiência é complicada:

É difícil orquestrar tudo localmente de forma confiável

O alinhamento de dependências vira uma tarefa manual

Deploys sincronizados são mais complexos do que deveriam

E testar o sistema como um todo exige muito esforço extra

---

## Solução Testada

- Um **monorepo central** que adiciona os microserviços como **submódulos Git**.
- Cada microserviço possui:
  - Um `Dockerfile` próprio
  - Sua própria rota `/ping` para healthcheck
- Um arquivo `docker-compose.yml` orquestra todos os serviços.
- O `gateway` (ex: NGINX) atua como ponto de entrada único.
- Healthchecks garantem que os serviços estão disponíveis antes do `gateway` iniciar.

---

## Como rodar o projeto

### 1. Clonar o repositório com os submódulos

```bash
git clone --recurse-submodules https://github.com/jordan-cod/monorepo-microservices-poc
cd monorepo-microservices-poc
```

Se esquecer a flag, use:

```bash
git submodule update --init --recursive
```

---

### 2. Rodar os containers com Docker

```bash
docker-compose up --build
```

---

### 4. Testar os serviços

Acesse via navegador ou `curl`:

- 🟢 Auth: http://localhost/auth/ping
- 🟢 Payments: http://localhost/payments/ping
- 🟢 Profile: http://localhost/profile/ping

> As rotas acima assumem que o gateway está roteando corretamente para os serviços.

---

## 📁 Estrutura do Monorepo

```
monorepo-microservices/
├── services/
│   ├── auth/        # Submódulo Git
│   ├── payments/    # Submódulo Git
│   └── profile/     # Submódulo Git
├── gateway/         # NGINX ou outro API Gateway
├── docker-compose.yml
└── README.md
```

---

## ✅ Status atual

- [x] Estrutura básica funcional com 3 serviços
- [x] Comunicação entre serviços via hostname Docker
- [x] Healthcheck automático para garantir readiness
- [ ] Integração com CI/CD (futuro)
- [ ] Testes (futuro)

---

## 🧠 Conclusão

Essa PoC é uma forma de testar, na prática, se um monorepo com submódulos Git pode realmente simplificar nosso fluxo de desenvolvimento. A ideia é facilitar a orquestração local, melhorar os testes integrados e reduzir a dor de lidar com múltiplos serviços — sem abrir mão da independência que cada um precisa ter.