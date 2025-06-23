# Aplicativo de Gerenciamento de Tarefas

## Desenvolvido por Luiz - RA: 1171074

## Descrição do Projeto
Este é um aplicativo de gerenciamento de tarefas desenvolvido em Flutter, que permite aos usuários gerenciar suas atividades diárias de forma eficiente e organizada. O aplicativo oferece funcionalidades de autenticação, cadastro de tarefas, visualização em calendário e lista, além de operações básicas de CRUD (Create, Read, Update, Delete).

## Estrutura do Projeto

### Organização de Diretórios
```
lib/
  ├── models/
  │   └── task.dart           # Modelo de dados para tarefas
  ├── screens/
  │   ├── splash_screen.dart  # Tela inicial com informações do desenvolvedor
  │   ├── login_screen.dart   # Tela de login
  │   ├── register_screen.dart # Tela de cadastro
  │   ├── calendar_screen.dart # Visualização em calendário
  │   ├── task_list_screen.dart # Lista de tarefas
  │   └── add_task_dialog.dart  # Diálogo para adicionar tarefas
  ├── services/
  │   └── firebase_service.dart # Serviços de integração com Firebase
  ├── widgets/
  │   └── task_tile.dart      # Widget personalizado para exibição de tarefas
  └── main.dart               # Ponto de entrada do aplicativo
```

### Tecnologias Utilizadas
- **Flutter**: Framework para desenvolvimento multiplataforma
- **Firebase Authentication**: Autenticação de usuários
- **Cloud Firestore**: Banco de dados em tempo real
- **Provider**: Gerenciamento de estado
- **Material Design**: Sistema de design para interface do usuário

## Funcionalidades Implementadas

### 1. Autenticação
- Login com email e senha
- Cadastro de novos usuários
- Validação de campos
- Feedback visual de erros
- Tela de splash personalizada

### 2. Gerenciamento de Tarefas
- Criação de novas tarefas
- Visualização em lista
- Visualização em calendário
- Marcação de tarefas como concluídas
- Exclusão de tarefas
- Ordenação automática (pendentes primeiro, depois concluídas)

### 3. Interface do Usuário
- Design moderno com tema roxo personalizado
- Containers arredondados
- Feedback visual de carregamento
- Animações suaves
- Responsividade para diferentes tamanhos de tela

## Padrões de Projeto Utilizados

### 1. MVC (Model-View-Controller)
- **Model**: Classe Task para representação de dados
- **View**: Telas e widgets
- **Controller**: Serviços e lógica de negócios

### 2. Repository Pattern
- Implementado no FirebaseService para abstração do acesso a dados
- Separação clara entre lógica de negócios e acesso a dados

### 3. Dependency Injection
- Injeção de dependências para serviços
- Facilita testes e manutenção

## Aspectos Técnicos

### 1. Gerenciamento de Estado
- Uso de StatefulWidget para estados locais
- Provider para estado global
- StreamBuilder para dados em tempo real do Firestore

### 2. Segurança
- Autenticação segura com Firebase
- Validação de dados no cliente
- Regras de segurança no Firestore

### 3. Performance
- Lazy loading de dados
- Otimização de rebuilds
- Uso eficiente de streams

## Conclusão
O projeto demonstra a implementação de um aplicativo completo em Flutter, utilizando boas práticas de programação e padrões de projeto. A estrutura modular e organizada facilita a manutenção e expansão futura do código. A integração com serviços Firebase proporciona uma base sólida para autenticação e armazenamento de dados.

O desenvolvimento focou em criar uma experiência de usuário fluida e intuitiva, mantendo o código limpo e bem estruturado. As escolhas arquiteturais e de design pattern demonstram conhecimento de princípios sólidos de engenharia de software.

## Próximos Passos
- Implementação de testes automatizados
- Adição de funcionalidades de compartilhamento
- Suporte a múltiplos idiomas
- Implementação de tema escuro
- Backup e sincronização de dados

## Como Executar o Projeto
1. Clone o repositório
2. Configure o Firebase no projeto
3. Execute `flutter pub get`
4. Execute `flutter run`

## Requisitos
- Flutter 3.0 ou superior
- Dart 2.17 ou superior
- Firebase project configurado
- Android Studio / VS Code com plugins Flutter
