# 📌 Todo List App

## 📖 Deskripsi
Aplikasi Todo List ini dikembangkan menggunakan **Flutter** sebagai frontend dan **Laravel** sebagai backend. Aplikasi ini memungkinkan pengguna untuk mengelola daftar tugas mereka dengan fitur autentikasi, CRUD tugas, dan pembaruan profil.

## 🚀 Fitur Utama
- **Autentikasi pengguna** (Login, Register, Logout)
- **CRUD Todo** (Tambah, edit, hapus, dan tandai tugas selesai)
- **Pembaruan Profil** (Nama, email, dan unggah avatar)
- **Handling Error dan Loading States**

---

## 🏗 Struktur Proyek

### 📁 Backend (Laravel)
```
📦 apk_backend
 ┣ 📂 app                # Logic utama backend
 ┣ 📂 bootstrap          # Bootstrap aplikasi Laravel
 ┣ 📂 config             # Konfigurasi aplikasi
 ┣ 📂 database           # Migrasi dan seeder database
 ┣ 📂 public             # Direktori public (assets, uploads, dll.)
 ┣ 📂 resources          # View template (jika ada)
 ┣ 📂 routes             # Definisi endpoint API
 ┣ 📂 storage            # Penyimpanan sementara
 ┣ 📂 tests              # Unit testing
 ┣ 📂 vendor             # Dependencies Laravel
 ┣ 📜 .env               # Konfigurasi environment
 ┣ 📜 .env.example       # Contoh konfigurasi .env
 ┣ 📜 artisan            # CLI Laravel
 ┣ 📜 composer.json      # Dependencies PHP
 ┣ 📜 composer.lock      # Lock dependencies
 ┣ 📜 package.json       # Dependencies tambahan
 ┣ 📜 phpunit.xml        # Pengujian PHP
 ┣ 📜 server.php         # Entry point untuk server PHP
 ┗ 📜 webpack.mix.js     # Konfigurasi Webpack Laravel
```

### 📁 Frontend (Flutter)
```
📦 task_app
 ┣ 📂 lib                # Source code utama
 ┃ ┣ 📂 screens          # UI Screens (Login, Home, Profile, dll.)
 ┃ ┣ 📂 services         # API Calls
 ┃ ┣ 📂 models           # Model Data
 ┃ 
 ┣ 📂 assets             # Assets (gambar, ikon, dll.)
 ┣ 📂 test               # Pengujian aplikasi
 ┣ 📜 pubspec.yaml       # Dependencies Flutter
 ┗ 📜 main.dart          # Entry point aplikasi
```

---

## 🛠 Teknologi yang Digunakan
- **Frontend**: Flutter (Dart)
- **Backend**: Laravel (PHP)
- **Database**: MySQL
- **State Management**: Provider
- **API Communication**: HTTP Requests

---

## 🔧 Instalasi & Menjalankan Aplikasi

### 1️⃣ Backend (Laravel)
```bash
# Clone repository
$ git clone https://github.com/username/apk_backend.git
$ cd apk_backend

# Install dependencies
$ composer install

# Konfigurasi file .env
$ cp .env.example .env
$ php artisan key:generate

# Setup database
$ php artisan migrate --seed

# Jalankan server Laravel
$ php artisan serve
```

### 2️⃣ Frontend (Flutter)
```bash
# Clone repository
$ git clone https://github.com/username/task_app.git
$ cd task_app

# Install dependencies
$ flutter pub get

# Jalankan aplikasi di emulator atau perangkat
$ flutter run
```

---

## 📌 Dokumentasi API

### 🔑 1. Autentikasi
**Login**
```http
POST /api/login
```
**Request Body**:
```json
{
  "email": "admin@admin.com",
  "password": "password123"
}
```
**Response**:
```json
{
  "token": "eyJhbGciOiJIUzI1..."
}
```

### ✅ 2. Todo Management
**Get Todos**
```http
GET /api/todos
Authorization: Bearer {token}
```

**Create Todo**
```http
POST /api/todos
Authorization: Bearer {token}
```
**Request Body**:
```json
{
  "title": "Belajar Flutter",
  "description": "Mengerjakan latihan Flutter."
}
```

**Update Todo**
```http
PUT /api/todos/{id}
```

**Delete Todo**
```http
DELETE /api/todos/{id}
```

---

## 🔐 Credential untuk Testing
**Akun Pengguna**:
- **Email**: `testuser@example.com`
- **Password**: `password123`

---

## 🤝 Kontribusi
Jika ingin berkontribusi, silakan lakukan **fork** repository ini dan buat **pull request** dengan perubahan yang diajukan.

🚀 Selamat menggunakan aplikasi Todo List! 🎯

