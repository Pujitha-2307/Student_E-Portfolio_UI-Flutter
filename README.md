# Student E-Portfolio Web Application

A personal **Student E-Portfolio Web Application** developed using Flutter and Dart to present academic information, course certifications, learning activities, and achievements in one organized platform.

The application provides a simple, user-friendly interface for showcasing a student's educational journey and technical development.

## About the Project

A student builds knowledge and skills through coursework, programming practice, projects, and technical learning. This project brings these details together in a digital portfolio that can be demonstrated through a web browser.

The application includes a login screen, dashboard navigation, academic details, course certifications, extracurricular activities, and achievements.

## Features

- **Login Page** — Provides Roll Number and Password fields, with a password visibility toggle.
- **Dashboard** — Serves as the main navigation area for accessing portfolio sections.
- **Academic Details** — Presents student-related academic information.
- **Course Certifications** — Displays course certificates and provides options to open certificate documents.
- **Extracurricular Activities** — Showcases activities and learning beyond academics.
- **Achievements** — Highlights technical learning, academic projects, and skill development.
- **Responsive UI** — Uses Flutter widgets to build the application interface.
- **Blue-Themed Design** — Uses a consistent color scheme and card-based layouts.

## Technologies Used

| Technology | Purpose |
|---|---|
| Flutter | User interface and application development |
| Dart | Programming language |
| Flutter Web | Running the application in a web browser |
| Material Design | UI components, icons, cards, and buttons |
| Git and GitHub | Version control and source code hosting |

## Application Modules

### 1. Login Page
The login page contains Roll Number and Password fields, a password visibility toggle, and a Login button.

### 2. Dashboard
The dashboard provides navigation to the different sections of the student portfolio.

### 3. Academic Details
This section organizes the student's academic information for easy presentation.

### 4. Course Certifications
This module lists course certifications. Certificate documents can be opened from local PDF assets or online certificate links, depending on the certificate.

### 5. Extracurricular Activities
This section presents extracurricular participation and related skills, such as teamwork and communication, where included in the portfolio.

### 6. Achievements
This module highlights learning and development areas, including Java programming, Power BI learning, academic projects, and continuous learning.

## Project Structure

The project follows a Flutter application structure. The exact filenames may vary depending on the implementation.

```text
student-e-portfolio/
├── lib/
│   ├── main.dart
│   └── assets/
│       └── certificates/
│           ├── java_certificate.pdf
│           └── data_structures_certificate.pdf
├── web/
├── android/
├── ios/
├── test/
├── pubspec.yaml
├── pubspec.lock
├── analysis_options.yaml
└── README.md
```

Additional assets, images, and Dart files may be present in the actual project.

## Getting Started

### Prerequisites

Install the following tools before running the project:

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- [Dart SDK](https://dart.dev/get-dart) (included with Flutter)
- [Visual Studio Code](https://code.visualstudio.com/)
- A web browser such as Google Chrome
- Git, for version control

### Installation

**Step 1: Clone the repository**

```bash
git clone https://github.com/YOUR-USERNAME/YOUR-REPOSITORY.git
```

Replace the URL with your actual GitHub repository URL.

**Step 2: Open the project folder**

```bash
cd YOUR-REPOSITORY
```

**Step 3: Install dependencies**

```bash
flutter pub get
```

**Step 4: Check the Flutter environment**

```bash
flutter doctor
```

**Step 5: Run the application in Chrome**

```bash
flutter run -d chrome
```

Alternatively, open the project in Visual Studio Code and run it using the Flutter extension.

## Screenshots

Screenshots of the running application can be added here to demonstrate the interface.

Recommended screenshots:

- Login Page
- Dashboard
- Academic Details
- Course Certifications
- Certificate PDF
- Extracurricular Activities
- Achievements

To display a screenshot stored at `screenshots/login.png`, use:

```markdown
![Login Page](screenshots/login.png)
```

Create a `screenshots/` directory in the project root and add screenshots captured from the actual running application. Use the same approach for the other pages.

## Certificates and Assets

The project can include certificate PDFs and a profile image as local assets.

Make sure the required assets are registered in `pubspec.yaml`. For example:

```yaml
flutter:
  uses-material-design: true
  assets:
    - lib/assets/profile.jpg
    - lib/assets/certificates/
```

Keep the asset paths consistent with the actual project structure.

## Learning Outcomes

Through this project, the following areas can be practiced:

- Flutter UI development using Dart.
- Layout creation with widgets such as `Scaffold`, `Column`, `Card`, and `ListView`.
- Navigation between application screens.
- Form input handling and password visibility controls.
- Working with local PDF assets and online certificate links.
- Organizing a multi-page application.
- Using Git and GitHub for source code management.

## Future Enhancements

Possible future improvements include:

- Backend integration for secure authentication.
- Database storage for student details and achievements.
- An administrative interface for updating portfolio content.
- Improved responsive layouts for mobile and desktop.
- Additional project demonstrations and certificate previews.

These are potential enhancements and are not necessarily part of the current implementation.

## Author

**Name:** Your Name  
**Department:** Your Department  
**College:** Your College Name  
**Project:** Student E-Portfolio Web Application

## License

This project is intended for educational and academic demonstration purposes. Add an appropriate open-source license if you intend to permit others to reuse or distribute the code.
