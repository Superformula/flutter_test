# RestauranTour

PT/BR 🇧🇷
- Projeto proposto pela equipe da Superformula. Onde é mostrado duas telas principais.

**Home page**: Uma tab view com duas tabs. A primeira é onde é mostrado uma catálogo de restaurantes com algumas informações. A segura tab é onde é mostrado a listagem dos restaurantes favoritados pelos usuários.

**Restaurants page**: Página com os detalhes dos restaurantes fornecidos pela Yelp API onde é dado a possibilidade de favoritar e o restaurante favoritado é salvado localmente.

Criei dois ambientes para o app. Prod e dev. Cada ambiente acessa um endpoint diferente. Caso o ambiente seja Dev, é acessado um endpoint com dados mockados nesse [link](https://raw.githubusercontent.com/fonsecguilherme/sf_flutter_test/master/restaurants.json) para não exceder o limite diário da API da Yelp. Caso o ambiente selecionado seja de prod, aí sim é usado o endpoint da Yelp. 

English 🇺🇸
- Project proposed by Superformula team. Where it is shown a two main screens. 

**Home page**: A tab view with two tabs. The first tab it's shown a catalogue of restaurants with some information. The second tab is a list of favorites where it's shown user favorite restaurants.

**Restaurants page**: A page with all restaurant details provided by yelp API where it's given to the user the possibility to favorite and the restaurant is saved locally.

I created two flavors for the app. Prod and dev. Each flavor access a different endpoint. Case flavor is set ad Dev, an endpoint witch mocked data is accessed in this [link](https://raw.githubusercontent.com/fonsecguilherme/sf_flutter_test/master/restaurants.json) to not exceed the daily limit of Yelp API. Case  the flavor select is prod, so the Yelp endpoint is used

## Autor
- Guilherme Fonseca [Github](https://github.com/fonsecguilherme) e [Linkedin](https://www.linkedin.com/in/devfonsecguilherme/)

## Stack 
Dart and Flutter
**Packages:** [Mocktail](https://pub.dev/packages/mocktail), [Flutter_bloc](https://pub.dev/packages/flutter_bloc), [Bloc]( https://pub.dev/packages/bloc), [Network Image Mock](https://pub.dev/packages/mocktail_image_network), [Bloc test](https://pub.dev/packages/bloc_test), [GetIt](https://pub.dev/packages/get_it), [dartz](https://pub.dev/packages/dartz), [shares_preferences](https://pub.dev/packages/shared_preferences)

State management: BLoC and Flutter BLoC

Dependency Injection: GetIt

API requests: HTTP

Tests: Mocktail, Bloc Test, Mocktail Image Network

Data Persistance: Shared Preferences

Functional programming: dartz

## BLoc
PT/BR 🇧🇷
- Para esse projeto, foi utilizado cubits para gerenciamento de estados. A escolha foi baseada justamente por ser um padrão bem definido, altamente testável, com boa adoção pelo mercado e as possibilidades de ajustes finos na UI. 

English 🇺🇸
- For this project, I used cubits for state management. This choice was based on the fact that bloc is a well defined standard, highly testable, well received in the market and the possibilities of precise adjustments in the UI.

## App Structure
Core: Features that are used in all app

Data: Responsible for communicate with external agents

View: Visual representation of app screens with cubits and states

<p float="left">
  <img src="https://github.com/user-attachments/assets/0a806050-c4d0-4d78-9105-9779a6dc4cdf" width="350" />
</p>

## Tests
PT/BR 🇧🇷
- Foram escritos testes de páginas (home, favorites e restaurant), cubits (favorite e restaurants) e repositórios dev.

English 🇺🇸
- Covered pages tests (home, favorites and restaurant), cubits (favorite and restaurants) and dev repository.

## Video
[Video](https://drive.google.com/file/d/1zMk82eiCxKuIeOENQ8drDcDEveOictqX/view?usp=sharing)

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


