

# Project Documentation 🇺🇸

## Overview

This challenge was proposed by the Superformula team, and it’s an application I developed focused on restaurants. The app features two main screens:

### Home Page

- **Tab View**: I organized the home page into two tabs:
  - **Restaurant Catalog**: Displays a list of restaurants with relevant information.
  - **Favorites**: Shows the list of restaurants that user marks as favorites.

### Restaurant Page

- **Restaurant Details**: Provides detailed information about restaurants, which are obtained via the Yelp API.
- **Favorite Option**: Allows the user to add a restaurant to a favorites list. Favorited restaurants are stored locally on user device.

## Development Environments

The application supports two distinct environments:

- **Development Environment (Dev)**: I created a mocked data json endpoint to avoid exceeding Yelp API’s daily limit. the endpoint can be accessed using [link](https://raw.githubusercontent.com/fonsecguilherme/sf_flutter_test/master/restaurants.json).
  
- **Production Environment (Prod)**: Connects to the official Yelp API endpoint to retrieve real data.

## API Key Configuration

To ensure the security of the Yelp API key, I used `dart-define` along with a JSON file containing the key. This file is not included in the Git repository to protect the key from unauthorized access.

### API Key File Structure

The `api-keys.json` file should follow this structure:

```json
{
    "YELP_KEY": "<Insert your key here>"
}
```

### Security Considerations

- **Key Protection**: By using `dart-define` and not include the API key file from the Git repository, I protect the key from unauthorized access. The key will not be accessible to end users upon APK decompilation.

# Project Technical Overview

## Technologies and Packages

### Dart and Flutter Packages

- **[Mocktail](https://pub.dev/packages/mocktail)**: A package used for creating mock objects for unit testing.
- **[Flutter_bloc](https://pub.dev/packages/flutter_bloc)**: Provides integration between Flutter and BLoC for state management.
- **[Bloc](https://pub.dev/packages/bloc)**: A library for implementing the BLoC pattern.
- **[Mocktail_image_network](https://pub.dev/packages/mocktail_image_network)**: Provides mock image responses for network image testing.
- **[Bloc_test](https://pub.dev/packages/bloc_test)**: A package used for testing BLoC events and states.
- **[GetIt](https://pub.dev/packages/get_it)**: A service locator for dependency injection.
- **[Dartz](https://pub.dev/packages/dartz)**: A library for functional programming in Dart.
- **[Shared_preferences](https://pub.dev/packages/shared_preferences)**: For local data persistence using key-value pairs.

### Key Features and Practices

- **State Management**: I utilized BLoC and Flutter BLoC for managing the state of the application.
- **Dependency Injection**: Managed through the GetIt package for efficient service location and injection.
- **API Requests**: Handled via the HTTP package for network communication.
- **Testing**: Mocktail, Bloc Test, and Mocktail Image Network for comprehensive unit and widget testing.
- **Data Persistence**: Achieved with Shared Preferences for storing key-value data locally.
- **Functional Programming**: Leveraged through the Dartz package to incorporate functional programming concepts into the application.

This combination of packages and practices ensures a robust, maintainable, and testable application architecture.

## BLoC

- In this project, I chose to use **cubits** for state management. My choice was motivated by several reasons: cubits is a well-defined pattern, highly testable, widely adopted in the market, and offers flexibility for fine-tuning the user interface.

## Tests

- Page tests (home, favorites, and restaurant), cubits (favorite and restaurants), and the dev repository.

## App Structure

- **Core**: Essential components and features used throughout the app.
- **Data**: Handles communication with external sources and data management.
- **View**: Visual representation of app screens, incorporating cubits and states.

<p float="left">
  <img src="https://github.com/user-attachments/assets/0a806050-c4d0-4d78-9105-9779a6dc4cdf" width="350" />
</p>

## Video

[Video](https://drive.google.com/file/d/1zMk82eiCxKuIeOENQ8drDcDEveOictqX/view?usp=sharing)

## Screenshots

App screenshots are at the end of the file.

---

## Documentação do Projeto 🇧🇷

## Visão Geral

Este desafio foi proposto pela equipe Superformula, e trata-se de um aplicativo que foi desenvolvido focado em restaurantes. O aplicativo possui duas telas principais:

### Página Inicial

- **Visualização por Abas**: Organizei a página inicial em duas abas:
  - **Catálogo de Restaurantes**: Exibe uma lista de restaurantes com informações relevantes.
  - **Favoritos**: Mostra a lista de restaurantes que o usuário marca como favorito.

### Página do Restaurante

- **Detalhes do Restaurante**: Fornece informações detalhadas sobre restaurantes, obtidas através da API do Yelp.
- **Opção de Favorito**: Permite que o usuário adicione um restaurante à lista de favoritos. Os restaurantes favoritados são armazenados localmente no dispositivo do usuário.

## Ambientes de Desenvolvimento

O aplicativo suporta dois ambientes distintos:

- **Ambiente de Desenvolvimento (Dev)**: Criei um endpoint JSON de dados simulados para evitar exceder o limite diário da API do Yelp. O endpoint pode ser acessado usando o [link](https://raw.githubusercontent.com/fonsecguilherme/sf_flutter_test/master/restaurants.json).

- **Ambiente de Produção (Prod)**: Conecta-se ao endpoint oficial da API do Yelp para recuperar dados reais.

## Configuração da Chave API

Para garantir a segurança da chave API do Yelp, usei `dart-define` juntamente com um arquivo JSON contendo a chave. Este arquivo não está incluído no repositório Git para proteger a chave de acesso não autorizado.

### Estrutura do Arquivo da Chave API

O arquivo `api-keys.json` deve seguir esta estrutura:

```json
{
    "YELP_KEY": "<Insira sua chave aqui>"
}
```

### Considerações de Segurança

- **Proteção da Chave**: Usando `dart-define` e não incluindo o arquivo que contém a chave API no repositório Git, proteje a chave de acesso não autorizado. A chave não será acessível aos usuários caso o apk do app seja decompilado.

# Visão Técnica do Projeto

## Tecnologias e Pacotes

### Pacotes Dart e Flutter

- **[Mocktail](https://pub.dev/packages/mocktail)**: Um pacote usado para criar mocks para testes unitários.
- **[Flutter_bloc](https://pub.dev/packages/flutter_bloc)**: Fornece integração entre Flutter e BLoC para gerenciamento de estado.
- **[Bloc](https://pub.dev/packages/bloc)**: Uma biblioteca para implementar o padrão BLoC.
- **[Mocktail_image_network](https://pub.dev/packages/mocktail_image_network)**: Fornece image mocks para testes de imagens de rede.
- **[Bloc_test](https://pub.dev/packages/bloc_test)**: Pacote usado para testar eventos e estados BLoC.
- **[GetIt](https://pub.dev/packages/get_it)**: Service locator para injeção de dependência.
- **[Dartz](https://pub.dev/packages/dartz)**: Uma biblioteca para programação funcional em Dart.
- **[Shared_preferences](https://pub.dev/packages/shared_preferences)**: Para persistência de dados local usando pares chave-valor.

### Principais Recursos e Práticas

- **Gerenciamento de Estado**: Foi utilizado BLoC e Flutter BLoC para gerenciar o estado do aplicativo.
- **Injeção de Dependência**: Gerenciado através do pacote GetIt para localização e injeção de serviços eficientes.
- **Solicitações de API**: HTTP para comunicação de rede.
- **Testes**: Mocktail, Bloc Test e Mocktail Image Network para testes unitários e de widgets.
- **Persistência de Dados**: Obtida com Shared Preferences para armazenar dados chave-valor localmente.
- **Programação Funcional**: Aproveitada através do pacote Dartz para incorporar conceitos de programação funcional no aplicativo.

Esta combinação de pacotes e práticas garante uma arquitetura de aplicativo robusta, manutenível e testável.

## BLoC

- Neste projeto, escolhi usar **cubits** para gerenciamento de estado. Minha escolha foi motivada por vários motivos: cubits/BLoC é um padrão bem definido, altamente testável, amplamente adotado no mercado e oferece flexibilidade para ajustar a interface do usuário.

## Testes

- Testes de página (home, favorite e restaurant), cubits (favorit e restaurant) e o repositório dev.

## Estrutura do Aplicativo

- **Core**: Componentes e recursos essenciais usados em todo o aplicativo.
- **Data**: Lidar com a comunicação com fontes externas e gerenciamento de dados.
- **View**: Representação visual das telas do aplicativo, incorporando cubits e estados.

<p float="left">
  <img src="https://github.com/user-attachments/assets/0a806050-c4d0-4d78-9105-9779a6dc4cdf" width="350" />
</p>

## Vídeo

[Vídeo](https://drive.google.com/file/d/1zMk82eiCxKuIeOENQ8drDcDEveOictqX/view?usp=sharing)

## Screenshots
* Home page Android
<p float="left">
  <img src="https://github.com/user-attachments/assets/45f781eb-1e54-4f7f-9de8-e488d097b7f3" width="350" />
  <img src="https://github.com/user-attachments/assets/e1cb311d-aa7c-43dc-98cb-f606c7e057ab" width="350" />
</p>

* Favorites page Android
<p float="left">
  <img src="https://github.com/user-attachments/assets/26f8884d-ddd1-4d0f-be1a-b2aa59afc26d" width="350" />
  <img src="https://github.com/user-attachments/assets/4d0370ad-5d7f-4e8b-8a10-35ed47ea6f83" width="350" />
</p>

* Restaurant details Android
<p float="left">
  <img src="https://github.com/user-attachments/assets/62bac8d4-bc0c-406a-bd72-5253858fb3b6" width="350" />
  <img src="https://github.com/user-attachments/assets/565c0892-15f5-46ae-9b70-d0c4e0df8ad8" width="350" />
</p>

* Error to fetch restaurans Android
<p float="left">
  <img src="https://github.com/user-attachments/assets/16992708-03e0-405a-a306-1d8297893afa" width="350" />
</p>

* Restaurant details snack bar Android
<p float="left">
  <img src="https://github.com/user-attachments/assets/a18255c9-efeb-4e94-8893-1654310b92c8" width="350" />
  <img src="https://github.com/user-attachments/assets/505db944-d65f-4d2c-9d3b-398a820599e3" width="350" />
</p>
