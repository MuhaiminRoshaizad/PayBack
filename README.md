# PayBack 💰

A private repayment tracking app with AI-powered OCR receipt scanning - automatically extracts amount, date, and payment details from any receipt.

## 📖 Overview

PayBack is a Flutter-based mobile app designed for tracking installment repayments between two users (originally built for a son-father phone purchase repayment scenario). The app features intelligent receipt scanning that automatically reads payment details from physical receipts, digital receipts, PDFs, and screenshots.

## ✨ Key Features

### 📊 Dashboard Summary
- **Total Amount Owed** - Clear display of original debt
- **Total Amount Paid** - Running total of all payments
- **Remaining Balance** - Automatically calculated
- **Monthly Expected Payment** - Optional target amount

### 🧾 Smart Receipt Scanning (OCR)
- **Automatic Data Extraction** - AI-powered scanning extracts:
  - Payment amount
  - Transaction date
  - Merchant/recipient details
- **Multiple Input Sources**:
  - 📸 Take photo of physical receipts
  - 🖼️ Upload screenshots of digital receipts
  - 📄 Import PDF receipts from e-wallets
- **Manual Edit** - Review and adjust OCR results before saving

### 💳 Payment Management
- **Payment History** - Chronological list of all payments
- **Receipt Images** - Each payment can have an attached receipt
- **Payment Confirmation** - Receiver confirms payments received
- **Notes** - Optional notes for each payment

### 👥 Dual View System (No Login Required)

#### Payer View (Son)
- ➕ Add new payments
- ✏️ Edit payment details
- 🗑️ Delete payments
- 📸 Upload receipt images
- 📊 View dashboard and history

#### Receiver View (Father)
- 👀 Read-only access to amounts
- ✅ Confirm payments
- 🖼️ View receipt images
- 📊 View dashboard and history
- 🚫 Cannot edit or delete payments

### 🔐 Simple Access Control
- **PIN-based role switching** - No complex authentication
- **Local preference storage** - Role saved on device
- **Privacy-focused** - Two-person use case only

### ☁️ Real-time Sync
- **Firebase Realtime Database** - Instant sync between devices
- **Firebase Storage** - Secure receipt image storage
- **Offline Support** - View data without internet (sync when connected)

## 🛠️ Tech Stack

- **Framework**: Flutter (Dart)
- **Backend**: Firebase
  - Realtime Database (data sync)
  - Storage (receipt images)
- **OCR/AI**: Google ML Kit Text Recognition
- **State Management**: [Your choice - Provider/Riverpod/Bloc]
- **Local Storage**: SharedPreferences

## 📦 Key Dependencies

```yaml
dependencies:
  # Firebase
  firebase_core: ^latest
  firebase_database: ^latest
  firebase_storage: ^latest
  
  # OCR & Image Processing
  google_mlkit_text_recognition: ^latest
  image_picker: ^latest
  file_picker: ^latest
  pdf_render: ^latest  # For PDF receipts
  
  # UI & Utilities
  cached_network_image: ^latest
  intl: ^latest  # Date/currency formatting
  shared_preferences: ^latest  # Role storage
  
  # Optional
  path_provider: ^latest
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.0 or higher)
- Dart SDK (3.0 or higher)
- Firebase account
- Android Studio / VS Code
- Physical device or emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/MuhaiminRoshaizad/payback.git
   cd payback
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Firebase Setup**
   - Create a new Firebase project at [Firebase Console](https://console.firebase.google.com)
   - Add Android/iOS apps to your Firebase project
   - Download `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)
   - Place them in the appropriate directories:
     - Android: `android/app/google-services.json`
     - iOS: `ios/Runner/GoogleService-Info.plist`

4. **Enable Firebase Services**
   - Go to Firebase Console → Realtime Database → Create Database
   - Go to Firebase Console → Storage → Get Started
   - Set up security rules (see below)

5. **Run the app**
   ```bash
   flutter run
   ```

## 🔥 Firebase Configuration

### Realtime Database Structure
```json
{
  "payback": {
    "summary": {
      "totalAmount": 5000,
      "monthlyExpected": 500,
      "startDate": "2026-01-01"
    },
    "payments": {
      "payment_id_1": {
        "amount": 500,
        "date": "2026-02-01",
        "note": "January payment",
        "receiptUrl": "https://...",
        "confirmed": true,
        "timestamp": 1234567890
      }
    }
  }
}
```

### Database Security Rules
```json
{
  "rules": {
    "payback": {
      ".read": true,
      ".write": true
    }
  }
}
```
⚠️ **Note**: These are permissive rules for a private two-user app. Adjust based on your security needs.

### Storage Security Rules
```
rules_version = '2';
service firebase.storage {
  match /b/{bucket}/o {
    match /receipts/{receiptId} {
      allow read, write: if true;
    }
  }
}
```

## 📱 Usage

### First Time Setup
1. Open the app
2. Select your role: **Payer** or **Receiver**
3. Set a 4-digit PIN (for receiver protection)
4. Enter the total amount owed and monthly payment (optional)

### Adding a Payment (Payer View)
1. Tap **"+ Add Payment"**
2. Choose input method:
   - **Take Photo** - Snap a picture of physical receipt
   - **Select Image** - Choose screenshot from gallery
   - **Select PDF** - Import digital receipt
3. Wait for OCR processing (2-3 seconds)
4. Review auto-filled data:
   - Amount
   - Date
   - Merchant/Note
5. Edit if needed
6. Tap **"Save"**

### Confirming a Payment (Receiver View)
1. View payment in history
2. Tap on payment to see details
3. View receipt image (if attached)
4. Tap **"Confirm Payment"** ✅

### Switching Roles
1. Go to **Settings**
2. Tap **"Switch Role"**
3. Enter PIN (if switching to Receiver)
4. Role changed!

## 🎨 UI/UX Principles

- **Minimal & Clean** - No clutter, easy navigation
- **Non-technical Friendly** - Designed for all age groups
- **Clear Visual Hierarchy** - Important info stands out
- **Calm Colors** - No aggressive or flashy design
- **Large Touch Targets** - Easy to tap buttons
- **Informational, Not Analytical** - No charts or trends

## 📂 Project Structure

```
lib/
├── main.dart
├── models/
│   ├── payment.dart
│   └── summary.dart
├── services/
│   ├── firebase_service.dart
│   ├── ocr_service.dart
│   └── storage_service.dart
├── views/
│   ├── role_selection_screen.dart
│   ├── dashboard_screen.dart
│   ├── add_payment_screen.dart
│   └── payment_detail_screen.dart
├── widgets/
│   ├── summary_card.dart
│   ├── payment_list_item.dart
│   └── receipt_viewer.dart
└── utils/
    ├── constants.dart
    └── receipt_parser.dart
```

## 🧠 OCR Implementation Details

### Text Recognition Flow
```
Receipt Image
    ↓
Google ML Kit Text Recognition
    ↓
Raw Text Extraction
    ↓
Smart Parser (Regex + Pattern Matching)
    ↓
Structured Data (Amount, Date, Merchant)
```

### Parsing Logic
- **Amount Detection**: Looks for "RM", "TOTAL", "JUMLAH", currency patterns
- **Date Detection**: Supports DD/MM/YYYY, DD-MM-YYYY, DD.MM.YYYY
- **Merchant Detection**: Top portion of receipt, business names

### Accuracy Tips
For best OCR results:
- ✅ Good lighting
- ✅ Flat, unwrinkled receipt
- ✅ Straight angle (not tilted)
- ✅ Clear focus
- ✅ Fill the frame

## 🔒 Privacy & Security

- **No Cloud Authentication** - No email/password stored
- **Local PIN** - Stored only on device
- **Private Firebase** - Data shared only between two devices
- **No Analytics** - No tracking or data collection
- **Two-User Only** - Not designed for multi-user scenarios

## 🐛 Known Limitations

- OCR accuracy varies with receipt quality (70-95%)
- Requires manual review of auto-extracted data
- Not suitable for multiple concurrent repayment plans
- Requires both users to have app installed
- No data export feature (yet)

## 🚧 Future Enhancements (Maybe)

- [ ] Data export (CSV/PDF report)
- [ ] Push notifications for payment confirmations
- [ ] Multiple repayment plans
- [ ] Payment reminders
- [ ] Currency conversion support
- [ ] Dark mode

## 📄 License

This is a private project for personal use. No license specified.

## 👨‍💻 Author

**Muhaimin Roshaizad** ([@MuhaiminRoshaizad](https://github.com/MuhaiminRoshaizad))

Built using Flutter & Firebase

---

## 🙋 Support

This is a personal project for two-person use. For issues or questions:
- Open an issue in this repository
- Contact: [aminmuhaimin192@gmail.com if you want]

## 🙏 Acknowledgments

- Google ML Kit for OCR technology
- Firebase for backend infrastructure
- Flutter for the amazing framework

---

**Note**: This app is designed specifically for a two-person repayment tracking scenario and is not intended for commercial use or large-scale deployment.