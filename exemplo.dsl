workspace "English's Journey - IFBA" "Modelo arquitetural para RPG Educativo de aprendizado de Inglês." {

    model {
        # ---------------------------------------------------------
        # NÍVEL 1: CONTEXTO
        # ---------------------------------------------------------
        
        student = person "Estudante / Jogador" "Aluno que joga para aprender inglês através de mecânicas de RPG."
        educator = person "Educador / Colaborador" "Professor ou desenvolvedor que expande o jogo adicionando novos diálogos."
        
        fileSystem = softwareSystem "Sistema de Arquivos Local" "Armazena configurações do usuário e arquivos de 'Save'."

        rpgSystem = softwareSystem "Plataforma RPG Educacional" "Jogo Top-Down feito na Godot Engine focado em ensino de Inglês." {
            
            # ---------------------------------------------------------
            # NÍVEL 2: CONTAINERS
            # ---------------------------------------------------------

            gameClient = container "Cliente do Jogo" "Aplica as regras, renderiza gráficos e processa input." "Godot Engine 4.x (GDScript)" {
                
                # ---------------------------------------------------------
                # NÍVEL 3: COMPONENTES
                # ---------------------------------------------------------
                
                group "Game Client Components" {
                    
                    # Camada de Gerenciamento (Core)
                    gameManager = component "Game Manager" "Singleton: Controla o ciclo de vida (Start, Pause), carrega cenas e gerencia estados globais." "GDScript"
                    saveSystem = component "Save/Load System" "Serializa o progresso do jogador (inventário, posição) para disco." "GDScript / FileAccess"

                    # Camada de Jogabilidade (Gameplay)
                    playerController = component "Player Controller" "Gerencia input (WASD), movimentação física e colisão com o mundo." "CharacterBody2D"
                    worldManager = component "World/Scene Manager" "Gerencia a troca de mapas (Vilarejo -> Masmorra) e instância de NPCs." "Node Tree"
                    interactionSystem = component "Interaction System" "Detecta proximidade (Area2D) e permite interação com objetos ou NPCs." "GDScript"

                    # Camada Educacional (A Lógica de Domínio)
                    dialogParser = component "Dialog System" "Processa diálogos em inglês para aprendizado do player." "GDScript"
                    questSystem = component "Quest System" "Gerencia o estado das missões." "GDScript"
                    
                    # Camada de Interface (UI)
                    uiManager = component "UI Manager" "Exibe HUD, Inventário, Diálogos e Menus." "Control Nodes"
                }
            } 
            
            educationalData = container "Módulos de Conteúdo (Data Assets)" "Arquivos JSON/Text contendo vocabulário inglês e reações químicas." "JSON Files" {
                tags "Config"
            }

            assetsContainer = container "Assets Gráficos e Sonoros" "Sprites exportados do Piskel e arquivos de áudio." "PNG / WAV"
        }

        # ---------------------------------------------------------
        # RELACIONAMENTOS
        # ---------------------------------------------------------

        # Contexto
        student -> rpgSystem "Joga e interage"
        educator -> rpgSystem "Edita arquivos de conteúdo"
        rpgSystem -> fileSystem "Lê/Escreve Saves"

        # Containers
        student -> gameClient "Visualiza e Controla"
        educator -> educationalData "Adiciona novas aulas/fórmulas"
        gameClient -> educationalData "Lê regras e textos"
        gameClient -> assetsContainer "Carrega texturas e sons"
        gameClient -> fileSystem "Persiste dados"

        # Componentes
        # Fluxo do Jogador
        playerController -> interactionSystem "Aciona interação"
        interactionSystem -> dialogParser "Inicia conversa com NPC"
        interactionSystem -> questSystem "Acessa status das missões"
        
        # Fluxo de Dados Educacionais
        questSystem -> educationalData "Valida requisitos necessários para completar as tarefas"
        dialogParser -> educationalData "Carrega textos em inglês (JSON)"
        
        # Feedback Visual
        dialogParser -> uiManager "Exibe texto e opções"
        questSystem -> uiManager "Mostra resultado das missões"
        
        # Gerenciamento
        gameManager -> worldManager "Troca de cena"
        gameManager -> saveSystem "Solicita salvamento"
        saveSystem -> fileSystem "Grava arquivo"
    }

    views {
        systemContext rpgSystem "Contexto" {
            include *
            autoLayout
        }

        container rpgSystem "Containers" {
            include *
            autoLayout
        }

        component gameClient "Componentes" {
            include *
            autoLayout
        }

        styles {
            element "Software System" {
                background #1168bd
                color #ffffff
            }
            element "Container" {
                background #438dd5
                color #ffffff
            }
            element "Component" {
                background #85bbf0
                color #000000
            }
            element "Person" {
                shape Person
                background #08427b
                color #ffffff
            }
            element "Config" {
                shape Cylinder
                background #999999
            }
        }
    }
}
