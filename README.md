# 🚀 Awesome Flutter Test!

## 🏗 Architectural Decisions

The project follows a **mono-repo** structure, where both the features and platform packages are part of the same Flutter package inside the repository. This keeps them decoupled and ready to scale into a multi-repo if needed by simply moving packages.

## 🛠 Melos Integration

With multiple packages in the repo, **Melos** simplifies package management, allowing us to run scripts across all mapped packages without the need for custom shell scripts or manual `flutter pub get` executions.

## 📂 Project Structure

### Features & Platform

- **Features**: Contains the core functionalities (currently only `restaurants`).
- **Platform**: Contains utility packages like `dependency_injection`, facilitating developer workflows.

### Modular Architecture

To maintain modularity, each module manages its own dependencies and routes via a shared contract:
- `SF` prefix indicates classes used globally within the project.

## 🧱 Architecture Layers

The project follows **Clean Architecture** principles, dividing the codebase into three main layers:

1. **Presentation**: Handles UI, routes, and controllers (presenters). Contains Flutter-specific code.
2. **Domain**: Contains core business logic, including **UseCases**, **Entities**, and **Value Objects** like `Name`.
3. **Repository**: Responsible for data retrieval, adhering to contracts defined in the domain layer.

### Example Snippets

**Platform example:**
![Module Contrat]()

![Module Implementation]()


**Presentation Layer:**
![Widget]()

**Domain Layer (UseCases):**
![UseCase]()

![Repositories contracts]()

![Name Value Object]()


**Repository Layer:**
![Cache Repository Implementation]()

**Test E2E:**
![Test End To End]()

## 📦 State Management

The app uses **Cubit** (from `flutter_bloc`) for state management, recommended by Google. It offers a low learning curve for new developers and integrates well with `bloc_test` for unit testing.

## 🧪 Testing

- **Widgets**: Covered with widget tests.
- **Other layers**: Covered with unit tests.
- **End-to-End Testing**: Using **Maestro** to cover core app functionalities.

---

Thanks for checking out our Flutter project! ✨
