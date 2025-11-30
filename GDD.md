# **DOCUMENTO DE DESIGN E ARQUITETURA DE JOGO**

Instituto Federal de Educação, Ciência e Tecnologia da Bahia (IFBA)

**Título do jogo:** 

**Versão do Documento:** 1.0.0

**Autores:**

**Orientador:**

# **1 GAME CONCEPT DOCUMENT**

## **1.1 Resumo conceitual:** 

Descreva o jogo em um único parágrafo. Deve conter o gênero, a mecânica principal e também o objetivo educacional.Exemplo:

## **1.2 Objetivos pedagógicos**

Defina quais as competências o jogo visa desenvolver

### **1.2.1 Conceito:** 

Exemplo: Aprendizado da tabela periódica e reações química:

## **1.3 Método de integração:**

Como o conteúdo é apresentado? Através de mecânicas, através da história?

## **1.4 Público-alvo:** 

X anos

## **1.5 Plataforma:**

Windows, XBOX, Oculus Rift. Android, IOS, etc

## **1.6 Dispositivos de entrada:**

Mouse, teclado, joystick, gamepad, tapete interativo, etc.

## **1.7 Estética e atmosfera:**

### **1.7.1 Estilo visual:** 

Exemplo: Pixel art, 3d realista, etc

### **1.7.2 Ferramenta de arte:**

Exemplo: Piskel

### **1.7.3 Referências estéticas:**

Exemplo: The legend of Zelda: A link to the past; Megaman X; Roblox; etc

# **2 GAME DESIGN DOCUMENT**

\[Detalhamento sobre regras e funcionamento geral\]

## **2.1 Ciclo de jogabilidade**

\[Descreva o ciclo de ações repetidas pelo jogador\]

1. **Ação:** \[Ação que o jogador deve tomar\] Exemplo: Explorar o mapa  
2. **Desafio:** \[O que o jogador precisa solucionar para ir para a próxima etapa\] Exemplo: Encontrar um item específico no mapa  
3. **Resolução:** \[Como o jogador conclui o desafio proposto\] Exemplo: Entregar um item para o NPC que o solicitou  
4. **Recompensa:** \[Prêmio concedido por resolver o desafio\] Exemplo: Ganha um novo poder  
   

## **2.2 Mecânicas principais**

- **Movimentação:** \[ Como o jogador interage com o personagem principal\] Exemplo: Movimentação *top-down*. Controle de direção com aceleração automática, etc  
- **Interação:** \[Como o mundo interage com o player e como ele responde a isso\] Exemplo: Combate automático por proximidade, possibilidade de diálogo com NPCs próximos, etc  
- **Sistemas específicos:** \[Sistemas de interação extradiegéticos necessários para a jogabilidade\] Exemplo: Menus de diálogo, botões flutuantes, menus de jogo, etc

## **2.3 Narrativa e personagens**

### **2.3.1 Sinopse**

\[Resumo da história\]

## **2.4 Personagens**

- Protagonista: \[Descrição\]  
- NPCs chave: \[Lista com descrição e função narrativa e/ou mecânica\]  
- Personagens jogáveis de apoio: \[Lista com objetivo funcional e narrativo\]

## **2.5 Interface**

\[Liste as telas e elementos do HUD (*Heads-Up Display*)

- **Menu principal:**   
- **HUD de gameplay:**  
- **Interface de sistema:**

# **3 Arquitetura técnica**

\[A estrutura de engenharia do software\]

## **3.1 Stack tecnológica**

- **Engine**  
- **Linguagem de programação**  
- **Estrutura de dados externos**  
- **Arte**  
- **Áudio**

## **3.2 Modelo C4**

### **3.2.1 DSL (Domain Specific Language)**

O structurizr utiliza uma forma simplificada da linguagem DSL para gerar os diagramas da arquitetura. Utilize o site [https://structurizr.com/dsl](https://structurizr.com/dsl) para testar o diagrama e o programa **structurizr** para gerar versões em json, png, html e outros formatos do diagrama.

### **3.2.2 Contextos**

\[Insira o diagrama C4 da camada de contexto aqui\]

Exemplos de agentes e containers:

- Usuário \[Agente\]: quem vai jogar e interage com o mundo do jogo  
- Administrador \[Agente\]: quem atualiza conteúdos do jogo  
- RPG educativo \[Contexto\]: o jogo em si  
- Sistema de save e estrutura que salva dados \[Contexto\]: banco de dados externo que armazena o estado atual do jogo e as configurações que o administrador pode alterar 

### **3.2.3 Containers**

\[Insira o diagrama C4 da camada de containers aqui\]  
Exemplos de containers dos contextos:

- RPG educativo \[Contexto\] tem os containers:  
  - Usuário interage com Módulo de Jogo  
  - Administrador interage com Módulo de administração

### **3.2.4 Componentes**

\[Insira o diagrama C4 da camada de componentes aqui\]  
Exemplos de componentes de container:

- Módulo de jogo \[Container\]:  
  - Gerenciador de UI  
  - Engine de diálogos  
  - etc

### **3.2.5 Código**

A estrutura de código é o próprio código fonte do projeto, adicione aqui o link para o repositório.

## **3.3 Estrutura de pastas**

\[A organização deve seguir esse padrão para facilitar a colaboração de desenvolvedores vindos de outros projetos\]

| res://├── assets/             \# Recursos Binários (Não-Script)│   ├── sprites/        \# Exportados do Piskel│   │   ├── characters/│   │   └── tilesets/│   ├── audio/          \# SFX e BGM│   └── fonts/├── src/                \# Código Fonte (Scripts)│   ├── autoload/       \# Singletons (GameManager.gd)│   ├── entities/       \# Atores (Player, Enemies, NPCs)│   ├── systems/        \# Lógica pura (Inventory, Crafting, Dialog)│   └── ui/             \# Scripts de Interface├── scenes/             \# Árvores de Nós (.tscn)│   ├── levels/         \# Mapas jogáveis│   ├── prefabs/        \# Objetos instanciáveis (Player.tscn, Coin.tscn)│   └── ui/             \# Menus e HUDs└── data/               \# Arquivos JSON editáveis (Conteúdo Educativo) |
| :---- |

# **4 Melhores práticas de codificação**

\[Guia para manter o código padronizado, limpo e escalável\]

## **4.1 Padrões de nomenclatura**

- **Classes e nós**  
- **Arquivos e pastas**  
- **Variáveis e funções**  
- **Constantes e enums**

## **4.2 Padrões de design de código**

\[Exemplos\]

- Princípio de composição: evite criar árvores de herança profunda.  
  - **Errado: Inimigo** herda de **Personagem** que herda de **Entity**  
  - **Correto: Inimigo** é um **nó base** que não **herda de ninguém**, mas compõe os componentes: **HealthComponent**, **HitboxComponent**, **MovementComponent**  
- Padrão Observable: Scripts não devem depender diretamente uns dos outros. Utilize signals para emitir eventos que serão ouvidos  
  - **Call Down, Signal Up:** Chame funções nos filhos, emita sinais para os pais. Exemplo: Quando o jogador coleta um item, o script do Player não deve chamar HUD.update(). Ele deve emitir um sinal item\_collected. O GameManager (que ouve o sinal) é quem avisa a HUD.

## **4.3 Gerenciamento de assets**

1. Exporte sprites no Piskel como PNG  
2. Importe no Godot na pasta assets/sprites

## **4.4 Versionamento**

- **Tecnologia utilizada:** Git e GitHub  
- **Padrões de commit:** Utilize o padrão *Conventional Commits* para uma escrita coesa e com mais semântica  
- **Micro commits:** Crie pequenos commits com trechos de código, criando um histórico das atualizações no código de forma semântica  
- **Git ignore:** Tenha a pasta .godot no arquivo .gitignore do projeto, pois é um arquivo de cache  
- 

## **4.5 Dados externos**

Utilizando uma fonte de dados externo (banco de dados local, em um servidor externo, arquivo JSON ou YAML, etc) permite que podemos adicionar novos conteúdos sem precisar recompilar o jogo, facilitando atualizações futuras. Defina nessa sessão como a tecnologia será implementada

# **5 Fases do desenvolvimento**

\[Exemplo\]

1. **Protótipo:**: Criar primeiros sprites, primeiras entidades e personagens  
2. **Core:** Implementar interações entre entidades, gameplay e narrativa  
3. **Polimento:** Substituir arte temporária por arte final, Testes de usabilidade e de UI
