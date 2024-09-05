# 🚀 Awesome Flutter Test!

## 🏗 Architectural Decisions

The project follows a **mono-repo** structure, where both the features and platform packages are part of the same Flutter package inside the repository. This keeps them decoupled and ready to scale into a multi-repo if needed by simply moving packages.

## 🛠 Melos Integration

With multiple packages in the repo, **Melos** simplifies package management, allowing us to run scripts across all mapped packages without the need for custom shell scripts or manual `flutter pub get` executions.

## 📂 Project Structure

### Features & Platform

- **Features**: Contains the functionalities (currently only `restaurants`).
- **Platform**: Contains utility packages like `dependency_injection`, facilitating developer workflows.

### Modular Architecture

To maintain modularity, each module manages its own dependencies and routes via a shared contract:
- `SF` prefix indicates classes used globally within the project.

## 🧱 Architecture Layers

The project follows **Clean Architecture** principles, dividing the codebase into three main layers:

1. **Presentation**: Handles UI, routes, and controllers (presenters). Contains Flutter-specific code.
2. **Domain**: Contains core business logic, including **UseCases**, **Entities**, **Value Objects** like `Name`, and **Repository Contracts**.
3. **Repository**: Responsible for data retrieval, and implementing contracts defined in the domain layer.

### Example Snippets

**Platform example:**
![Module Contrat](https://github.com/user-attachments/assets/ba4f076a-3709-4f0e-8451-a5080c37d995)

**Module implementation:**
![Module Implementation](https://github.com/user-attachments/assets/899e1df2-b041-44a0-b0a4-017e97835a9a)


**Widget (Presentation Layer):**
![Widget](https://github.com/user-attachments/assets/0f8b0ae4-8898-4571-82ca-00f5c3c9f309)

**UseCases (Domain Layer):**
![UseCase](https://github.com/user-attachments/assets/43c3e5b2-0be7-467c-9414-a5c6603e0b79)

**Repository Contract (Domain Layer):**
![Repositories contracts](https://github.com/user-attachments/assets/1c593112-697d-4462-8980-deffabb89857)

**Value Object (Domain Layer):**
![Name Value Object](https://github.com/user-attachments/assets/6bc4c8f7-4f5d-42ab-b50b-b42d2d703436)

**Repository implemantation (Repository Layer):**
![Cache Repository Implementation](https://github.com/user-attachments/assets/f9dd7678-943d-4d04-86f0-e27c332b48e3)

**Test E2E:**
![Test End To End](https://github.com/user-attachments/assets/0565fd1f-b8e1-4ed1-a5cb-9a0b2730493e)



## 📦 State Management

The app uses **Cubit** (from `flutter_bloc`) for state management, as recommended by Google. It offers a low learning curve for new developers and integrates well with `bloc_test` for unit testing.

## 🧪 Testing

- **Widgets**: Covered with widget tests.
- **Other layers**: Covered with unit tests.
- **End-to-End Testing**: Using **Maestro** to cover core app functionalities.

## Observations

The request to API are mocked due to a daily limit of requests.

------




