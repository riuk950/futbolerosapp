# Futboleros App 

**Gestióna jugadores, noticias, partidos y campeonatos de futbol.**  
Muestra Campeonatos, jugadores, patidos, canchas de los eventos , registra resultados, estadisticas, maneja personal arbitrario— todo offline y on line

---

## ✨ Funcionalidades

| Módulo  APP| Descripción |
|---|---|
| Partidos | lista los partidos segun el calendario  |
| Noticias | Reporte en tiempo real de noticias de los campeonatos o jugadores |
| Favoritos | Muestra los equipos favoritos del usuario |
| Perfil | Muestra los datos basicos del usuario segun su rol |

---

## ✨ Funcionalidades

| Módulo  WEB| Descripción |
|---|---|
| Home | Muestra campeonatos activos, y estadisticas   |
| Registro de equipos | 
| Registro de jugadores | 
| Registro y manejo de arbitros  | 
| Creacion de competiciones | 

---


## 🏗️ Arquitectura

El proyecto implementa **Clean Architecture** con separación estricta en 4 capas:

```
UI  →  Config  →  Infrastructure  →  Domain
```

- **Domain**: entidades puras Dart, gateways abstractos y casos de uso. Cero dependencias externas.
- **Infrastructure**: adaptadores Hive (persistencia local), serializers y mappers.
- **Config**: providers Riverpod (`StateNotifier`), inyección de dependencias y rutas (`go_router`).
- **UI**: páginas y widgets Flutter. Todo texto en español, todo código en inglés.

### Estructura de carpetas

```
lib/
├── config/
│   ├── providers/       # StateNotifierProviders (product_item, sale_record, expense, balance, backup)
│   ├── routes/          # AppRouter con go_router
│   └── theme/           # AppTheme (primaryColor, accentColor)
├── domain/
│   ├── models/          # ProductItem, SaleRecord, Expense, BalanceReport, BackupData + gateways
│   └── usecase/         # Casos de uso por entidad
├── infrastructure/
│   ├── driven_adapters/ # Implementaciones Hive de cada gateway
│   └── helpers/         # BackupSerializer, mappers (productItem, saleRecord, expense)
└── ui/
    ├── pages/           # home, dashboard, product_form, sale_record, expense, balance, backup, quotation
    ├── painters/        # RetroGridPainter
    └── widgets/         # RetroBackground, ProductCard, CostCalculatorForm, AdditionalCostRow
```

---

## 🚀 Setup

**Requisitos:** Flutter ≥ 3.11.0 · Dart ≥ 3.11.0

```bash
# 1. Clonar el repositorio
git clone <repo-url>
cd valora_code

# 2. Instalar dependencias
flutter pub get

# 3. Ejecutar en modo debug
flutter run
```

The application has different flavors for development and production. You can run a specific flavor using the following commands:

*   **Development:** `flutter run --flavor dev --target lib/env/main.dev.dart`
*   **Production:** `flutter run --flavor prod --target lib/env/main.prod.dart`

---

## 🧪 Tests

```bash
# Correr todos los tests
flutter test

# Con cobertura
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

**90 tests** cubriendo: modelos del dominio, casos de uso, providers y adaptadores de infraestructura.

---

## 📦 Dependencias principales

| Paquete | Uso |
|---|---|
| `supabase_flutter: ^2.0.0` | coneccion a backend |
| `flutter_riverpod ^2.6.1` | Gestión de estado (`StateNotifier`) |
| `hive ^2.2.3` + `hive_flutter` | Persistencia local offline |
| `go_router ^14.6.2` | Navegación declarativa |
| `file_picker ^8.1.6` | Importar backup desde el sistema de archivos |
| `uuid ^4.5.1` | Generación de IDs únicos |
| `mocktail ^1.0.4` | Mocks en tests |

---

## 🎨 Diseño

- Basate en DESING.md en la raiz del proyecto.
